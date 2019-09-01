package com.hsshy.beam.modular.tool;
import com.alibaba.fastjson.JSON;
import com.hsshy.beam.common.qr.ImgQrTool;
import com.hsshy.beam.common.qr.ParseQrTool;
import com.hsshy.beam.common.utils.*;
import com.hsshy.beam.modular.mini.constant.BdAiConfig;
import com.hsshy.beam.modular.tool.dto.animal.AnimalResultDto;
import com.hsshy.beam.modular.tool.dto.animal.PlantResultDto;
import com.hsshy.beam.modular.tool.dto.car.CarResultDto;
import com.hsshy.beam.modular.tool.dto.imgWord.WordsResultBean;
import com.hsshy.beam.modular.tool.dto.redwine.RedWineResult;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import com.hsshy.beam.modular.tool.dto.imgWord.ImgWordResult;

/**
 * 获取token类
 */
@Service
public class ToolService {

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 获取权限token
     * @return 返回示例：
     * {
     * "access_token": "24.460da4889caad24cccdb1fea17221975.2592000.1491995545.282335-1234567",
     * "expires_in": 2592000
     * }
     */
    public  String getAuth(int type) {
        // 官网获取的 API Key 更新为你注册的
        // 官网获取的 Secret Key 更新为你注册的

        //type：1 图像识别 2：文字识别

        BdAiConfig bdAiConfig = redisUtil.get("BdAiConfig", BdAiConfig.class);
        String accessToken = "";
        if(type==1){
            if(ToolUtil.isNotEmpty(redisUtil.get("bd:img:identify:access:token"))){
                return redisUtil.get("bd:img:identify:access:token").trim();
            }
            else {
                accessToken = getAuth(bdAiConfig.getImgIdentifyClientId(), bdAiConfig.getImgIdentifyClientSecret());
                redisUtil.set("bd:img:identify:access:token",accessToken,28*60);
                return accessToken;
            }
        }
        else if(type==2){
            if(ToolUtil.isNotEmpty(redisUtil.get("bd:word:identify:access:token"))){
                return redisUtil.get("bd:word:identify:access:token").trim();
            }
            else {
                accessToken = getAuth(bdAiConfig.getWordIdentifyClientId(), bdAiConfig.getWordIdentifyClientSecret());
                redisUtil.set("bd:word:identify:access:token",accessToken,28*60);
                return accessToken;
            }
        }
        else {
            return accessToken;
        }



    }

    /**
     * 获取API访问token
     * 该token有一定的有效期，需要自行管理，当失效时需重新获取.
     * @param ak - 百度云官网获取的 API Key
     * @param sk - 百度云官网获取的 Securet Key
     * @return assess_token 示例：
     * "24.460da4889caad24cccdb1fea17221975.2592000.1491995545.282335-1234567"
     */
    public static String getAuth(String ak, String sk) {
        // 获取token地址
        String authHost = "https://aip.baidubce.com/oauth/2.0/token?";
        String getAccessTokenUrl = authHost
                // 1. grant_type为固定参数
                + "grant_type=client_credentials"
                // 2. 官网获取的 API Key
                + "&client_id=" + ak
                // 3. 官网获取的 Secret Key
                + "&client_secret=" + sk;
        try {
            URL realUrl = new URL(getAccessTokenUrl);
            // 打开和URL之间的连接
            HttpURLConnection connection = (HttpURLConnection) realUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String result = "";
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
            /**
             * 返回结果示例
             */
            JSONObject jsonObject = new JSONObject(result);
            String access_token = jsonObject.getString("access_token");


            return access_token;
        } catch (Exception e) {
//            System.err.printf("获取token失败！");
            e.printStackTrace(System.err);
        }
        return null;
    }

    //百度图片文字识别
    public R commonIdentifyImgWord(MultipartFile file){
        // 通用识别url
        String otherHost = "https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic";
        StringBuffer words = new StringBuffer();

        // 本地图片路径
        String filePath = "#####本地文件路径#####";
        try {
//            byte[] imgData = FileUtil.toByteArray(filePath);
            byte[] imgData = file.getBytes();
            String imgStr = Base64Util.encode(imgData);
            String params = URLEncoder.encode("image", "UTF-8") + "=" + URLEncoder.encode(imgStr, "UTF-8");
            /**
             * 线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
             */
            String accessToken = getAuth(2);
            String result = HttpUtil.post(otherHost, accessToken, params);
            ImgWordResult imgWordResult = JSON.parseObject(result,ImgWordResult.class);
            if(imgWordResult.getWordsResultNum()>0){
                for(WordsResultBean wordsResultBean:imgWordResult.getWordsResult()){
                    words.append(wordsResultBean.getWords());
                }
            }
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.ok(words.toString());


    }
    //动物识别
    public R identifyAnimal(MultipartFile file) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/animal";
        try {
            // 本地文件路径
            byte[] imgData = file.getBytes();
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");

            String param = "image=" + imgParam + "&top_num=" + 6;

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = getAuth(1);

            String result = HttpUtil.post(url, accessToken, param);
            AnimalResultDto animalResultDto = JSON.parseObject(result,AnimalResultDto.class);
            return R.ok(animalResultDto);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.fail();
    }
    //植物识别
    public R identifyPlant(MultipartFile file) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/plant";
        try {
            // 本地文件路径
            byte[] imgData = file.getBytes();
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");

            String param = "image=" + imgParam;

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = getAuth(1);

            String result = HttpUtil.post(url, accessToken, param);
            PlantResultDto plantResultDto = JSON.parseObject(result, PlantResultDto.class);
            return R.ok(plantResultDto);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.fail();
    }
    //车型识别
    public R identifyCar(MultipartFile file) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/car";
        try {
            // 本地文件路径
            byte[] imgData = file.getBytes();
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");

            String param = "image=" + imgParam+"&top_num=" + 5;

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = getAuth(1);

            String result = HttpUtil.post(url, accessToken, param);
            CarResultDto carResultDto = JSON.parseObject(result,CarResultDto.class);
            return R.ok(carResultDto);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.fail();
    }

    //车型识别
    public R identifyRedwine(MultipartFile file) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/redwine";
        try {
            // 本地文件路径
            byte[] imgData = file.getBytes();
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");
            String param = "image=" + imgParam;
            String accessToken = getAuth(1);
            String result = HttpUtil.post(url, accessToken, param);
            System.out.println(result);
            RedWineResult redWineResult = JSON.parseObject(result,RedWineResult.class);
            return R.ok(redWineResult);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.fail();
    }



    //二维码解析
    public R qrcodeParse(MultipartFile file){
        try {
            String url = ParseQrTool.deEncodeByInputStream(file.getInputStream());
            return R.ok(url);

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return R.fail();

    }

    //二维码生成
    public R qrcodeCreate(String url){

        ImgQrTool.createSimpleQr(url,200,200);

        return R.ok();

    }





}