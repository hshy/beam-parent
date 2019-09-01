package com.hsshy.beam.modular.mini.dto;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-07-25 10:23:04
 **/
public class PhoneInfoWatermark {
    /**
     * appid : APPID
     * timestamp : TIMESTAMP
     */

    @JSONField(name = "appid")
    private String appid;
    @JSONField(name = "timestamp")
    private String timestamp;

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
