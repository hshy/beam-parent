package com.hsshy.beam.modular.mini.util;

import com.hsshy.beam.modular.mini.dto.Getwxacode;
import org.apache.http.Header;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import weixin.popular.api.API;
import weixin.popular.api.WxaAPI;
import weixin.popular.bean.wxa.LineColor;
import weixin.popular.client.LocalHttpClient;
import weixin.popular.util.JsonUtil;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.Charset;


/**
 * 小程序API
 */
public class WxappUtils {
    static Logger logger = LoggerFactory.getLogger(WxappUtils.class);

    /**
     * 获取小程序码: 适用于需要的码数量较少的业务场景
     *
     * 注意：通过该接口生成的小程序码，永久有效，数量限制见文末说明，请谨慎使用。用户扫描该码进入小程序后，将直接进入 path 对应的页面
     */
    public static BufferedImage getwxacode(String access_token, String path) {
        weixin.popular.bean.wxa.Getwxacode getwxacode = new weixin.popular.bean.wxa.Getwxacode(path, 430, false, null);
        BufferedImage bufferedImage = WxaAPI.getwxacode(access_token, getwxacode);
        return bufferedImage;
    }
    public static BufferedImage getwxacode(String access_token, String path, Boolean auto_color, Boolean is_hyaline) {
        Getwxacode getwxacode = new Getwxacode();
        getwxacode.setPath(path);
        getwxacode.setWidth(430);
        getwxacode.setAuto_color(auto_color); // 线
        getwxacode.setIs_hyaline(is_hyaline); // 透明图
        BufferedImage bufferedImage = getwxacode(access_token, getwxacode);
        return bufferedImage;
    }

    public static BufferedImage getwxacode(String access_token, String path, Boolean auto_color, Boolean is_hyaline, LineColor lineColor) {
        Getwxacode getwxacode = new Getwxacode();
        getwxacode.setPath(path);
        getwxacode.setWidth(430);
        getwxacode.setLine_color(lineColor);
        getwxacode.setAuto_color(auto_color); // 线
        getwxacode.setIs_hyaline(is_hyaline); // 透明图
        BufferedImage bufferedImage = getwxacode(access_token, getwxacode);
        return bufferedImage;
    }

    public static BufferedImage getwxacode(String access_token, Getwxacode getwxacode) {
        String json = JsonUtil.toJSONString(getwxacode);
        Header jsonHeader = new BasicHeader("Content-Type", ContentType.APPLICATION_JSON.toString());
        HttpUriRequest httpUriRequest = RequestBuilder.post().setHeader(jsonHeader).setUri("https://api.weixin.qq.com/wxa/getwxacode").addParameter("access_token", API.accessToken(access_token)).setEntity(new StringEntity(json, Charset.forName("utf-8"))).build();
        CloseableHttpResponse httpResponse = LocalHttpClient.execute(httpUriRequest);

        BufferedImage var7;
        try {
            int status = httpResponse.getStatusLine().getStatusCode();
            if(status != 200) {
                return null;
            }

            byte[] bytes = EntityUtils.toByteArray(httpResponse.getEntity());
            var7 = ImageIO.read(new ByteArrayInputStream(bytes));
        } catch (IOException var18) {
            logger.info("", var18);
            return null;
        } finally {
            try {
                httpResponse.close();
            } catch (IOException var17) {
                logger.info("", var17);
            }

        }

        return var7;
    }
}
