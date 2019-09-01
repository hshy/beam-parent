package com.hsshy.beam.modular.tool.dto.car;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.List;

/**
 * @description: 车辆识别返回结果
 * @author: hs
 * @create: 2019-02-20 21:38:56
 **/
public class CarResultDto {


    /**
     * log_id : 4086212218842203806
     * location_result : {"width":447,"top":226,"height":209,"left":188}
     * result : [{"baike_info":{"baike_url":"http://baike.baidu.com/item/%E5%B8%83%E5%8A%A0%E8%BF%AAChiron/20419512","description":"布加迪Chiron是法国跑车品牌布加迪出品的豪华超跑车。配置四涡轮增压发动机，420 公里每小时，有23种颜色的选择，售价高达260万美元。"},"score":0.98793351650238,"name":"布加迪Chiron","year":"无年份信息"},{"score":0.0021970034576952,"name":"奥迪RS5","year":"2011-2017"},{"score":0.0021096928976476,"name":"奥迪RS4","year":"无年份信息"},{"score":0.0015581247862428,"name":"奥迪RS7","year":"2014-2016"},{"score":8.2337751518935E-4,"name":"布加迪威航","year":"2004-2015"}]
     * color_result : 颜色无法识别
     */

    @JSONField(name = "log_id")
    private long logId;
    @JSONField(name = "location_result")
    private LocationResultBean locationResult;
    @JSONField(name = "color_result")
    private String colorResult;
    @JSONField(name = "result")
    private List<ResultBean> result;

    public long getLogId() {
        return logId;
    }

    public void setLogId(long logId) {
        this.logId = logId;
    }

    public LocationResultBean getLocationResult() {
        return locationResult;
    }

    public void setLocationResult(LocationResultBean locationResult) {
        this.locationResult = locationResult;
    }

    public String getColorResult() {
        return colorResult;
    }

    public void setColorResult(String colorResult) {
        this.colorResult = colorResult;
    }

    public List<ResultBean> getResult() {
        return result;
    }

    public void setResult(List<ResultBean> result) {
        this.result = result;
    }
}
