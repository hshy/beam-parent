package com.hsshy.beam.modular.auth;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.base.controller.BaseBeanController;
import com.hsshy.beam.common.utils.*;
import com.hsshy.beam.modular.mini.constant.MiniAppConfig;
import com.hsshy.beam.modular.mini.dto.EncryptedData;
import com.hsshy.beam.modular.mini.dto.PhoneInfo;
import com.hsshy.beam.modular.mini.dto.WxUserInfo;
import com.hsshy.beam.modular.tool.entity.Member;
import com.hsshy.beam.modular.tool.service.IMemberService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import weixin.popular.api.SnsAPI;
import weixin.popular.bean.sns.Jscode2sessionResult;
import weixin.popular.bean.wxa.WxaDUserInfo;
import weixin.popular.util.WxaUtil;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/auth")
public class AuthController extends BaseBeanController {

    @Autowired
    private IMemberService memberService;

    @Autowired
    private RedisUtil redisUtil;


    /**
     * 静默登陆
     *
     * @param code
     * @return
     */
    @IgnoreUTokenAuth
    @GetMapping(value = "/slogin", produces = "application/json")
    public R slogin(String code) {

        MiniAppConfig miniAppConfig = redisUtil.get("MiniAppConfig", MiniAppConfig.class);

        Jscode2sessionResult jscode2sessionResult = SnsAPI.jscode2session(miniAppConfig.getAppId(), miniAppConfig.getAppSecret(), code);
        String sessionKey = jscode2sessionResult.getSession_key();
        String openId = jscode2sessionResult.getOpenid();
        if (ToolUtil.isEmpty(openId)) {
            return R.fail("登陆失败");
        }
        Member member = memberService.getOne(new QueryWrapper<Member>().lambda().eq(Member::getOpenId, openId));
        // 老用户
        if (ToolUtil.isNotEmpty(member)) {
            member.setLastLoginTime(new Date());
            memberService.updateById(member);
        } else { // 新用户
            member = new Member();
            member.setOpenId(openId);
            member.setLastLoginTime(new Date());
            memberService.save(member);
        }
        String utoken = JwtTokenUtil.generateToken(member.getId() + "");
        redisUtil.set("cow-draw:sessionKey:" + member.getId(), sessionKey);
        Map result = new HashMap();
        result.put("utoken", utoken);
        result.put("userInfo", member);
        return R.ok(result);
    }


    /**
     * 解密微信用户信息
     */
    @PostMapping(value = "/decode")
    public R decodeWxUserInfo(@RequestBody EncryptedData encryptedData) {
        Member member = memberService.getById(getUserId());
        String sessionKey = getUserSessionKey();
        WxaDUserInfo wxaDUserInfo = WxaUtil.decryptUserInfo(sessionKey, encryptedData.getEncryptedData(), encryptedData.getIv());
        if (ToolUtil.isNotEmpty(wxaDUserInfo)) {
            member.setSex(wxaDUserInfo.getGender());
            member.setPhoto(wxaDUserInfo.getAvatarUrl());
            member.setNickName(wxaDUserInfo.getNickName());
            member.setProvince(wxaDUserInfo.getProvince());
            member.setCity(wxaDUserInfo.getCity());
            memberService.updateById(member);
            return R.ok(member);
        }
        else {
            return R.fail("用户信息解密失败");
        }

    }

    /**
     * 解密手机号
     */
    @PostMapping(value = "/decode/phone")
    public R decodePhoneInfo(@RequestBody EncryptedData encryptedData) {
        Member member = memberService.getById(getUserId());
        Assert.notNull(member, "用户不存在");
        try {
            String sessionKey = getUserSessionKey();
            // 用户信息解密
            AES aes = new AES();
            byte[] resultByte = aes.decrypt(Base64.decodeBase64(encryptedData.getEncryptedData()), Base64.decodeBase64(sessionKey), Base64.decodeBase64(encryptedData.getIv()));
            if (null != resultByte && resultByte.length > 0) {
                String phoneInfoStr = new String(resultByte, "UTF-8");
                PhoneInfo phoneInfo = JSON.parseObject(phoneInfoStr, PhoneInfo.class);
                member.setPhone(phoneInfo.getPhoneNumber());
                memberService.updateById(member);
            }
        } catch (InvalidAlgorithmParameterException e) {
            e.printStackTrace();
            return R.fail(-2, e.getMessage());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return R.fail(-2, e.getMessage());
        }
        return R.ok(member.getPhone());
    }


}
