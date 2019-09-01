package com.hsshy.beam.modular.mini.dto;

import lombok.Data;
import weixin.popular.bean.wxa.LineColor;

/**
 * Created by liqian on 2018/6/3.
 */
@Data
public class Getwxacode {

    private String path;
    private Integer width;
    private Boolean auto_color;
    private LineColor line_color;
    private Boolean is_hyaline; // 是否需要透明底色， is_hyaline 为true时，生成透明底色的小程序码

}
