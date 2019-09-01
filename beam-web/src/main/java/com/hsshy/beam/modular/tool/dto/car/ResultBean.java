package com.hsshy.beam.modular.tool.dto.car;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-02-20 21:39:33
 **/
public class ResultBean {
    /**
     * baike_info : {"baike_url":"http://baike.baidu.com/item/%E5%B8%83%E5%8A%A0%E8%BF%AAChiron/20419512","description":"布加迪Chiron是法国跑车品牌布加迪出品的豪华超跑车。配置四涡轮增压发动机，420 公里每小时，有23种颜色的选择，售价高达260万美元。"}
     * score : 0.98793351650238
     * name : 布加迪Chiron
     * year : 无年份信息
     */

    @JSONField(name = "baike_info")
    private BaikeInfoBean baikeInfo;
    @JSONField(name = "score")
    private double score;
    @JSONField(name = "name")
    private String name;
    @JSONField(name = "year")
    private String year;

    public BaikeInfoBean getBaikeInfo() {
        return baikeInfo;
    }

    public void setBaikeInfo(BaikeInfoBean baikeInfo) {
        this.baikeInfo = baikeInfo;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
