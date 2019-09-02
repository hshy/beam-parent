package com.hsshy.beam.modular.tool;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.base.controller.BaseBeanController;
import com.hsshy.beam.common.utils.*;
import com.hsshy.beam.modular.mini.constant.MiniAppConfig;
import com.hsshy.beam.modular.mini.util.WxappUtils;
import com.hsshy.beam.modular.tool.entity.*;
import com.hsshy.beam.modular.tool.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import weixin.popular.bean.wxa.LineColor;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Base64;
import java.util.List;

/**
 * @description: 工具首页接口
 * @author: hs
 * @create: 2019-02-19 16:11:10
 **/
@Api(value="IndexController",tags={"工具首页接口"})
@RestController
@RequestMapping("/index")
public class IndexController extends BaseBeanController {


    @Autowired
    private IToolMenuService toolMenuService;

    @Autowired
    private IGoodAppraiseService goodAppraiseService;

    @Autowired
    private IBadWordService badWordService;

    @Autowired
    private IFeedbackService feedbackService;

    @Autowired
    private IPosterBgService posterBgService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private IMemberService memberService;


    @ApiOperation(value = "首页菜单")
    @GetMapping("/list/menu")
    public R listMenu() {

        List<ToolMenu> toolMenuList = toolMenuService.list(new QueryWrapper<ToolMenu>().eq("status",1).orderByAsc("sort"));

        return R.ok(toolMenuList);

    }


    @ApiOperation(value = "好评助手")
    @GetMapping("/good/appraise")
    public R goodAppraise(@RequestParam Integer currentPage) {
        IPage<GoodAppraise> page = goodAppraiseService.page(new Page(currentPage,1),new QueryWrapper<GoodAppraise>());
        return R.ok(page);

    }

    @ApiOperation(value = "骂人助手")
    @GetMapping("/bad/word")
    public R badWord(@RequestParam Integer currentPage) {
        IPage<BadWord> page = badWordService.page(new Page(currentPage,1),new QueryWrapper<BadWord>());
        return R.ok(page);
    }



    @ApiOperation(value = "反馈")
    @PostMapping("/feedback")
    public R feedback(@RequestBody Feedback feedback) {
        Integer count = feedbackService.count(new QueryWrapper<Feedback>().eq("mid",getUserId()).like("create_time", DateUtil.getDay()));
        if(count>=3){
            return R.fail("今日反馈次数已用完");
        }
        else {
            feedback.setId(null);
            feedback.setMid(getUserId());
            feedbackService.saveOrUpdate(feedback);
            return R.ok("反馈成功");
        }
    }

    @ApiOperation(value = "海报背景图")
    @GetMapping("/poster/bg")
    public R posterBg() {
        List<PosterBg> posterBgList = posterBgService.list(new QueryWrapper<PosterBg>().eq("frozen",1));
        return R.ok(posterBgList);
    }

    @IgnoreUTokenAuth
    @ApiOperation(value = "画图")
    @GetMapping("/draw/poster.png")
    public void draw(HttpServletResponse response,String bgImgUrl) throws Exception{

        if(ToolUtil.isEmpty(bgImgUrl)){
            return;
        }

        bgImgUrl = URLDecoder.decode(bgImgUrl);

        int scale = 1;
        MiniAppConfig miniAppConfig = redisUtil.get("MiniAppConfig",MiniAppConfig.class);

        int width = 375*scale;
        int height = 667*scale;
        BufferedImage bufferedImage = null;
        Graphics2D g2 = null;
        // 创建内存图像
        bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        g2 = bufferedImage.createGraphics();
        // 抗锯齿
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_DEFAULT);
        Color color = new Color(255,255,255);
        g2.setColor(color);
        g2.fillRect(0,0,width,height);

        // 背景图
        int bgWidth = 375*scale;
        int bgHeight = 567*scale;
        BufferedImage bgImg = ImageIO.read(new URL(bgImgUrl));
        g2.drawImage(bgImg, 0, 0, bgWidth, bgHeight, null);


        Member member = memberService.getById(1098482460968165378L);
        String avatarImgUrl = member.getPhoto();
        String nickName = member.getNickName();

        Font font = new Font("宋体", Font.BOLD,17*scale);
        FontMetrics fm = g2.getFontMetrics(font);
        g2.setFont(font);
        color = new Color(0,0,0);
        g2.setColor(color);
        int nickNameWidth = fm.stringWidth(nickName);
        int nickNameX = 90*scale;
        int nickNameY = 607*scale;
        g2.setFont(font);
        g2.drawString(nickName, nickNameX,nickNameY);

        int desX = 90*scale;
        int desY = 647*scale;
        g2.drawString("邀请你加入海贼联盟", desX,desY);


        BufferedImage qrcode = WxappUtils.getwxacode(redisUtil.get(miniAppConfig.getAppId()+":access:token"), "/pages/index/index", false, false, new LineColor());
        int qrcodeWidth = 100*scale;
        int qrcodeHeight = 100*scale;
        int qrcodeX = 275;
        int qrcodeY = 567;
        g2.setColor(color);
        //留一个像素的空白区域，这个很重要，画圆的时候把这个覆盖
        //图片是一个圆型
        Ellipse2D.Double shape = new Ellipse2D.Double(qrcodeX, qrcodeY, qrcodeWidth , qrcodeHeight);
        //需要保留的区域
        g2.setClip(shape);
        g2.drawImage(qrcode, qrcodeX, qrcodeY, qrcodeWidth, qrcodeHeight , null);







        BufferedImage avatarImg = ImageIO.read(new URL(avatarImgUrl));
        g2 = bufferedImage.createGraphics();
        int avatarWidth = 80*scale;
        int avatarHeight = 80*scale;
        int avatarX = 0*scale;
        int avatarY = 577*scale;
        //需要保留的区域
        shape = new Ellipse2D.Double(avatarX, avatarY, avatarWidth, avatarHeight);
        g2.setClip(shape);
        g2.drawImage(avatarImg, avatarX, avatarY, avatarWidth, avatarHeight, null);
        g2.dispose();

        ImageIO.write(bufferedImage, "png", response.getOutputStream());


    }




}
