package com.hsshy.beam.modular.tool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


/**
 * 反馈表
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_feedback")
public class Feedback extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 用户ID
    @TableField(value = "mid")
    private Long mid;
    // 内容
    @TableField(value = "content")
    private String content;


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