package com.hsshy.beam.modular.tool.dto.redwine;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description: 红酒识别结果
 * @author: hs
 * @create: 2019-08-30 11:17:12
 **/
public class RedWineResult {


    /**
     * log_id : 2495538539661269738
     * result : {"classifyByColor":"红葡萄酒/Red Wine","subRegionCn":"梅多克","wineNameCn":"拉图嘉利庄园红葡萄酒（正牌）","subRegionEn":"Medoc","regionEn":"Bordeaux","color":"深紫红色/Dark Violet","wineNameEn":"Chateau La Tour Carnet","hasdetail":1,"wineryCn":"拉图嘉利庄园","classifyBySugar":"干型/Dry","tasteTemperature":"16-18℃","regionCn":"波尔多","wineryEn":"Chateau La Tour-Carnet","grapeCn":"","grapeEn":"","countryCn":"法国","countryEn":"France","description":"此酒充满红果和黑果味道，并带有矿物质和花香（紫罗兰，玫瑰），混合些许香草气息，单宁柔软，余香悠长。在口中留下清新的味道，香料和香草味道萦绕口中。"}
     */

    @JSONField(name = "log_id")
    private long logId;
    @JSONField(name = "result")
    private ResultBean result;

    public long getLogId() {
        return logId;
    }

    public void setLogId(long logId) {
        this.logId = logId;
    }

    public ResultBean getResult() {
        return result;
    }

    public void setResult(ResultBean result) {
        this.result = result;
    }
}
