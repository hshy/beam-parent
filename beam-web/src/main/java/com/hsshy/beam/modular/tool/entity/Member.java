package com.hsshy.beam.modular.tool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 小程序用户
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_member")
public class Member extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    // 微信头像
    @TableField(value = "photo")
    private String photo;
    // 微信openid
    @TableField(value = "open_id")
    private String openId;
    // 微信昵称
    @TableField(value = "nick_name")
    private String nickName;
    // 性别
    @TableField(value = "sex")
    private String sex;
    // 余额
    @TableField(value = "balance")
    private BigDecimal balance;
    // 最近一次登录时间
    @TableField(value = "last_login_time")
    private Date lastLoginTime;
    //省份
    @TableField(value = "province")
    private String province;
    //城市
    @TableField(value = "city")
    private String city;
    //手机号
    @TableField(value = "phone")
    private String phone;

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