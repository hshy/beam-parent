package com.hsshy.beam.modular.mini.dto;

import lombok.Data;

/**
 * 解密后的微信用户信息
 */
@Data
public class WxUserInfo {

    private String openId;
    private String nickName;
    private Integer gender;
    private String language;
    private String city;
    private String province;
    private String country;
    private String avatarUrl;
    private String unionId;
    private Watermark watermark;

    /**
     * 数据水印
     */
    @Data
    public class Watermark {
        public String appid;
        public long timestamp;
    }
}
