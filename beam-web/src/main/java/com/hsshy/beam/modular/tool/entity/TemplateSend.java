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
 * 模板消息发送表
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_template_send")
public class TemplateSend extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 订单号
    @TableField(value = "order_no")
    private String orderNo;
    // 微信open_id
    @TableField(value = "open_id")
    private String openId;
    // 表单id
    @TableField(value = "form_id")
    private String formId;
    // 模板消息关键字
    @TableField(value = "keyword1")
    private String keyword1;
    // 模板消息关键字
    @TableField(value = "keyword2")
    private String keyword2;
    // 模板消息关键字
    @TableField(value = "keyword3")
    private String keyword3;
    // 模板消息关键字
    @TableField(value = "keyword4")
    private String keyword4;
    // 备注
    @TableField(value = "remark")
    private String remark;
    // 发送时间
    @TableField(value = "send_time")
    private Date sendTime;
    // 发送状态：0待发送，1已发送，2发送失败
    @TableField(value = "status")
    private Integer status;
    // 错误说明，可将错误码一并记录，如："40001：这里是错误描述"
    @TableField(value = "error_msg")
    private String errorMsg;
    // 消息类型
    @TableField(value = "msg_type")
    private String msgType;


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