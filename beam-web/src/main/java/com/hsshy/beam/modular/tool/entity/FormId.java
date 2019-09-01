package com.hsshy.beam.modular.tool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


/**
 * 表单id收集
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_form_id")
public class FormId extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 用户id
    @TableField(value = "mid")
    private Long mid;
    // 表单id或者预支付id
    @TableField(value = "form_id")
    private String formId;
    // 类型：1表单id，2预支付id
    @TableField(value = "type")
    private Integer type;
    // 已使用次数
    @TableField(value = "used_times")
    private Integer usedTimes;
    // 失效时间
    @TableField(value = "expire_time")
    private Date expireTime;


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