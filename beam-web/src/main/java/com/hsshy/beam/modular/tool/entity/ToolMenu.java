package com.hsshy.beam.modular.tool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


/**
 * 菜单表
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_tool_menu")
public class ToolMenu extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 菜单名称
    @TableField(value = "name")
    private String name;
    // 菜单图标地址
    @TableField(value = "icon")
    private String icon;
    // 小程序跳转地址
    @TableField(value = "url")
    private String url;
    // 是否显示
    @TableField(value = "status")
    private Integer status;
    //
    @TableField(value = "sort")
    private Integer sort;


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}