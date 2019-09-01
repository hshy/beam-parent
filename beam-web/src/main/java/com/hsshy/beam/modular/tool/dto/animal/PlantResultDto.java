package com.hsshy.beam.modular.tool.dto.animal;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.List;

/**
 * @description: 百度识别动物返回结果
 * @author: hs
 * @create: 2019-02-19 18:01:19
 **/
public class PlantResultDto {

    /**
     * log_id : 7392482912853822863
     * result : {"log_id": 811345858465858516, "result": [{"score": 0.95834141969681, "name": "蒲公英"}, {"score": 0.039724390953779, "name": "药用蒲公英"}, {"score": 0.036219619214535, "name": "灰果蒲公英"}, {"score": 0.028772750869393, "name": "辽东蒲公英"}, {"score": 0.027970422059298, "name": "白缘蒲公英"}]}
     */

    @JSONField(name = "log_id")
    private long logId;
    @JSONField(name = "result")
    private List<ResultBean> result;

    public long getLogId() {
        return logId;
    }

    public void setLogId(long logId) {
        this.logId = logId;
    }

    public List<ResultBean> getResult() {
        return result;
    }

    public void setResult(List<ResultBean> result) {
        this.result = result;
    }
}
