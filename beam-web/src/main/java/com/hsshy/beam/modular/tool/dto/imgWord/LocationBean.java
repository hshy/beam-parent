package com.hsshy.beam.modular.tool.dto.imgWord;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * @description:
 * @author: hs
 * @create: 2019-02-19 17:01:34
 **/
public class LocationBean {
    /**
     * width : 545
     * top : 24
     * left : 30
     * height : 45
     */

    @JSONField(name = "width")
    private int width;
    @JSONField(name = "top")
    private int top;
    @JSONField(name = "left")
    private int left;
    @JSONField(name = "height")
    private int height;

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    public int getLeft() {
        return left;
    }

    public void setLeft(int left) {
        this.left = left;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
}
