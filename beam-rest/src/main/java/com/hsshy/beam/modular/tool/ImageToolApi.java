package com.hsshy.beam.modular.tool;

import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.base.controller.BaseBeanController;
import com.hsshy.beam.common.base.controller.BaseController;
import com.hsshy.beam.common.support.HttpKit;
import com.hsshy.beam.common.utils.*;
import com.hsshy.beam.modular.mini.constant.MiniAppConfig;
import com.hsshy.beam.modular.mini.util.WxappUtils;
import com.hsshy.beam.modular.tool.entity.Member;
import com.hsshy.beam.modular.tool.service.IMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import weixin.popular.bean.wxa.LineColor;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.UUID;

/**
 * @description: 图像相关
 * @author: hs
 * @create: 2019-08-30 10:56:20
 **/
@Api(value="ImageToolApi",tags={"工具接口"})
@RestController
@RequestMapping("/image/tool")
public class ImageToolApi extends BaseBeanController {

    @Autowired
    private ToolService toolService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private IMemberService memberService;


    @ApiOperation(value = "通用文字识别")
    @PostMapping("/common/identify/img/word")
    public R commonIdentifyImgWord(@RequestPart("file") MultipartFile file) {

        return toolService.commonIdentifyImgWord(file);

    }

    @ApiOperation(value = "动物识别")
    @PostMapping("/identify/animal")
    public R animalIdentify(@RequestPart("file") MultipartFile file) {

        return toolService.identifyAnimal(file);

    }

    @ApiOperation(value = "植物识别")
    @PostMapping("/identify/plant")
    public R plantIdentify(@RequestPart("file") MultipartFile file) {

        return toolService.identifyPlant(file);

    }

    @ApiOperation(value = "车型识别")
    @PostMapping("/identify/car")
    public R carIdentify(@RequestPart("file") MultipartFile file) {

        return toolService.identifyCar(file);

    }

    @ApiOperation(value = "红酒识别")
    @PostMapping("/identify/redwine")
    public R redwineIdentify(@RequestPart("file") MultipartFile file) {
        return toolService.identifyRedwine(file);

    }


    @ApiOperation(value = "二维码解析")
    @PostMapping("/qrcode/parse")
    public R qrcodeParse(@RequestPart("file") MultipartFile file) {

        return toolService.qrcodeParse(file);

    }

    @ApiOperation(value = "二维码生成")
    @GetMapping("/qrcode/create")
    public R qrcodeCreate(@RequestParam String url) {

        return toolService.qrcodeCreate(url);

    }

    @ApiOperation(value = "下载抖音视频")
    @GetMapping("/dy/download")
    public R dyDownload(@RequestParam String shareStr, HttpServletResponse response) throws UnsupportedEncodingException {

        //#在抖音，记录美好生活#可怕 http://v.douyin.com/kw7GEP/ 复制此链接，打开【抖音短视频】，直接观看视频！

        shareStr = URLDecoder.decode(shareStr,"UTF-8");

        String videoUrl = RegexUtil.getURL(shareStr);
        if(ToolUtil.isEmpty(videoUrl)){
            return R.fail("格式有误");
        }
        //从html中解析出真实路径
        videoUrl = DouyinVideoUtil.parseHtml(videoUrl);

        System.out.println(videoUrl);
        videoUrl = HttpKit.getJumpUrl(videoUrl);

        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        FileUtil.downloadMP4(videoUrl,"d:\\tmp\\"+uuid+".mp4");
        return R.ok(videoUrl);
    }



    @IgnoreUTokenAuth
    @ApiOperation(value = "画图")
    @GetMapping("/draw/img.png")
    public void draw(HttpServletResponse response,Integer showAvatar) throws Exception{
        if(ToolUtil.isEmpty(showAvatar)){
            return;
        }

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
        // 背景图
        BufferedImage bgImg = ImageIO.read(new URL("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566926160336&di=43184141c9672595f0f4083ff9c8c1e4&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b66958c6828ea801219c7746357b.jpg"));
        g2.drawImage(bgImg, 0, 0, width, height, null);

        Font font = new Font("宋体", Font.PLAIN,17*scale);
        g2.setFont(font);
        Color color = new Color(0,0,0);
        g2.setColor(color);
        FontMetrics fm = g2.getFontMetrics(font);


        String poems[] = "云想衣裳花相容，春风拂槛露华浓。若非群玉山头见，会向瑶台月下逢。一枝秾艳露凝香，云雨巫山枉断肠。借问汉宫谁得似，可怜飞燕倚新妆。名花倾国两相欢，长得君王带笑看。解释春风无限恨，沉香亭北倚阑干。".split("。");
        int poemTextWidth = fm.stringWidth(poems[0]);

        for(int i=0;i<poems.length;i++){
            g2.drawString(poems[i], (width-poemTextWidth)/2,height/4+i*25);

        }




        BufferedImage qrcode = WxappUtils.getwxacode(redisUtil.get(miniAppConfig.getAppId()+":access:token"), "/pages/index/index", false, false, new LineColor());
//        Getwxacodeunlimit getwxacodeunlimit = new Getwxacodeunlimit("",430,false,new LineColor("46", "161", "70"));
//        BufferedImage qrcode = WxaAPI.getwxacodeunlimit(redisUtil.get(miniAppConfig.getAppId()+":access:token"),getwxacodeunlimit);

        int qrcodeWidth = 100*scale;
        int qrcodeHeight = 100*scale;
        int qrcodeX = width-qrcodeWidth-15*scale;
        int qrcodeY = height-qrcodeHeight-20*scale;


        color = new Color(255,255,255);
        g2.setColor(color);

        String  miniAppName = "微信小程序：光有工具";
        int miniAppNameTextWidth = fm.stringWidth(miniAppName);
        logger.info("textWidth:"+miniAppNameTextWidth);
        int miniAppNameX = qrcodeX;
        int miniAppNameY = qrcodeY+qrcodeHeight+15*scale;
        font = new Font("宋体", Font.PLAIN,10*scale);
        g2.setFont(font);
        g2.drawString(miniAppName, miniAppNameX,miniAppNameY);


        g2.fillArc(qrcodeX-5,qrcodeY-5,qrcodeWidth+10,qrcodeHeight+10,0,360);

        //留一个像素的空白区域，这个很重要，画圆的时候把这个覆盖
        //图片是一个圆型
        Ellipse2D.Double shape = new Ellipse2D.Double(qrcodeX, qrcodeY, qrcodeWidth , qrcodeHeight);
        //需要保留的区域
        g2.setClip(shape);
        g2.drawImage(qrcode, qrcodeX, qrcodeY, qrcodeWidth, qrcodeHeight , null);




        if(showAvatar==1){
            Member member = memberService.getById(1098482460968165378L);
            String avatar = member.getPhoto();
            String nickName = member.getNickName();


            BufferedImage avatarImg = ImageIO.read(new URL(avatar));
            g2 = bufferedImage.createGraphics();
            int avatarWidth = 80*scale;
            int avatarHeight = 80*scale;

            //需要保留的区域
            shape = new Ellipse2D.Double((width-avatarHeight)/2, 10, avatarWidth, avatarHeight);
            g2.setClip(shape);
            g2.drawImage(avatarImg, (width-avatarHeight)/2, 10, avatarWidth, avatarHeight, null);

        }

        g2.dispose();

        ImageIO.write(bufferedImage, "jpg", response.getOutputStream());


    }


}
