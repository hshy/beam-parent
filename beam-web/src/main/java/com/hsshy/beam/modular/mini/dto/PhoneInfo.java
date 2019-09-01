package com.hsshy.beam.modular.mini.dto;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description: 用户手机信息
 * @author: hs
 * @create: 2019-07-25 10:22:35
 **/
public class PhoneInfo {


    /**
     * phoneNumber : 13580006666
     * purePhoneNumber : 13580006666
     * countryCode : 86
     * watermark : {"appid":"APPID","timestamp":"TIMESTAMP"}
     */

    @JSONField(name = "phoneNumber")
    private String phoneNumber;
    @JSONField(name = "purePhoneNumber")
    private String purePhoneNumber;
    @JSONField(name = "countryCode")
    private String countryCode;
    @JSONField(name = "watermark")
    private PhoneInfoWatermark watermark;

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPurePhoneNumber() {
        return purePhoneNumber;
    }

    public void setPurePhoneNumber(String purePhoneNumber) {
        this.purePhoneNumber = purePhoneNumber;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public PhoneInfoWatermark getWatermark() {
        return watermark;
    }

    public void setWatermark(PhoneInfoWatermark watermark) {
        this.watermark = watermark;
    }
}
