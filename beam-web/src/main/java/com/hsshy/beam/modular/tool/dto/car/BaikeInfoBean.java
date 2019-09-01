package com.hsshy.beam.modular.tool.dto.car;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-02-20 21:39:33
 **/
public class BaikeInfoBean {
    /**
     * baike_url : http://baike.baidu.com/item/%E5%B8%83%E5%8A%A0%E8%BF%AAChiron/20419512
     * description : 布加迪Chiron是法国跑车品牌布加迪出品的豪华超跑车。配置四涡轮增压发动机，420 公里每小时，有23种颜色的选择，售价高达260万美元。
     */

    @JSONField(name = "baike_url")
    private String baikeUrl;
    @JSONField(name = "description")
    private String description;

    public String getBaikeUrl() {
        return baikeUrl;
    }

    public void setBaikeUrl(String baikeUrl) {
        this.baikeUrl = baikeUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
