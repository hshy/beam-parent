package com.hsshy.beam.modular.tool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


/**
 * 脏话表
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_bad_word")
public class BadWord extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 内容
    @TableField(value = "content")
    private String content;
    // 是否可用
    @TableField(value = "frozen")
    private Integer frozen;


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