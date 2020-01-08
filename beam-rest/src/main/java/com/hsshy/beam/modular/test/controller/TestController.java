package com.hsshy.beam.modular.test.controller;
import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.redis.RedisUtil;
import com.hsshy.beam.modular.base.controller.BaseBeanController;
import com.hsshy.beam.modular.common.service.ISysConfigService;
import com.hsshy.beam.modular.test.dto.LoginForm;
import com.hsshy.beam.modular.test.service.AsyncService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.*;

/**
 * @description: 测试
 * @author: hs
 * @create: 2019-04-01 22:16:07
 **/
@Api(value = "测试",tags = "TestController")
@RequestMapping(value = "/test")
@RestController
public class TestController extends BaseBeanController {

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private ISysConfigService sysConfigService;

    @Autowired
    private AsyncService asyncService;

    /*
    *
    *  请求参数  可以再sign/util/signTest中进行模拟
        {
            "object":"ewogICJwYXNzd29yZCI6ICJzdHJpbmciLAogICJ1c2VybmFtZSI6ICJzdHJpbmciCn0=",
            "sign":"15dedfdf8c0d9d81378a22903ff6ab98"
        }
    *
    *
    */
    //签名方式：
    // 请求对象为 object: 整个对象进行base64编码后的值  sign: 将整个对象进行base64编码得到的值拼接上密钥做md5加密作为sign
    @ApiOperation(value = "登陆")
    @IgnoreUTokenAuth
    @PostMapping(value = "/login")
    public R  login(@RequestBody LoginForm loginForm){
        System.out.println(loginForm.getUsername());
        System.out.println(loginForm.getPassword());
        //存入userId
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        redisUtil.set(uuid,"1L"); //可以在这设置过期时间 返回登陆后将uuid设置为请求header中的utoken  以后所有请求带上utoken就可以获取到用户ID
        return R.ok(uuid);
    }

    @ApiOperation(value = "免授权")
    @IgnoreUTokenAuth
    @GetMapping(value = "/ignore")
    public R  ignore(){
        return R.ok();
    }

    @ApiOperation(value = "授权")
    @GetMapping(value = "/auth")
    public R  auth(){
        System.out.println(getUserId());
        return R.ok();
    }

    @ApiOperation(value = "动态数据源测试-默认数据源")
    @IgnoreUTokenAuth
    @GetMapping(value = "/dynamic/default")
    public R  dynamicDefault(){
        return R.ok(sysConfigService.getValue("test",""));
    }



//    @ApiOperation(value = "动态数据源测试-test数据源")
//    @IgnoreUTokenAuth
//    @GetMapping(value = "/dynamic/test")
//    @DataSource(name = "test")
//    public R  dynamicTest(){
//
//        return R.ok(sysConfigService.getValue("test",""));
//    }
//
//    @ApiOperation(value = "动态数据源测试-tool数据源")
//    @IgnoreUTokenAuth
//    @GetMapping(value = "/dynamic/tool")
//    @DataSource(name = "tool")
//    public R  dynamicTool(){
//        return R.ok(sysConfigService.getValue("test",""));
//    }

    @ApiOperation(value = "测试异步结果归集")
    @IgnoreUTokenAuth
    @GetMapping(value = "/asyn")
    @SneakyThrows
    public R  testAsyn(){
        Future<String>  future1 = asyncService.getAsynResult1();
        Future<String>  future2 = asyncService.getAsynResult2();
        String result1 =future1.get();
//        logger.info("异步1处理结果为：{}",result1);
        String result2 =future2.get();
//        logger.info("异步2处理结果为：{}",result2);
        Map map = new HashMap();
        map.put("result1",result1);
        map.put("result2",result2);
        return R.ok(map);
    }


}
