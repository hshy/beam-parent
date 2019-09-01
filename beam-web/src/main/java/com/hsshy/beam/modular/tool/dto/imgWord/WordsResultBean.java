package com.hsshy.beam.modular.tool.dto.imgWord;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-02-19 17:01:34
 **/
public class WordsResultBean {
    /**
     * location : {"width":545,"top":24,"left":30,"height":45}
     * words : A双引擎,领跑无人车与对话式A
     */

    @JSONField(name = "location")
    private LocationBean location;
    @JSONField(name = "words")
    private String words;

    public LocationBean getLocation() {
        return location;
    }

    public void setLocation(LocationBean location) {
        this.location = location;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }
}
