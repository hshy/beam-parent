package com.hsshy.beam.modular.tool.dto.car;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @description:
 * @author: hs
 * @create: 2019-02-20 21:39:33
 **/
public class LocationResultBean {
    /**
     * width : 447
     * top : 226
     * height : 209
     * left : 188
     */

    @JSONField(name = "width")
    private int width;
    @JSONField(name = "top")
    private int top;
    @JSONField(name = "height")
    private int height;
    @JSONField(name = "left")
    private int left;

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

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLeft() {
        return left;
    }

    public void setLeft(int left) {
        this.left = left;
    }
}
