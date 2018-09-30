package com.hsshy.beam.web.base.entity;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.hsshy.beam.common.constant.DataBaseConstant;

import java.util.Date;

/**
 * 数据Entity类
 * 
 * @author hs
 * @date 2018-09-27
 *
 */
public abstract class RestEntity<ID> extends AbstractEntity<ID> {

	@TableField(value = "remarks")
	private String remarks; // 备注
	@TableField(value = "create_date", fill = FieldFill.INSERT)
	private Date createDate; // 创建日期
	@TableField(value = "update_date", fill = FieldFill.INSERT_UPDATE)
	private Date updateDate; // 更新日期
	@TableField(value = "del_flag", fill = FieldFill.INSERT)
	private Integer delFlag; // 删除标记（0：正常；1：删除 ）

	public RestEntity() {
		super();
		this.delFlag = DataBaseConstant.DEL_FLAG_NORMAL;
	}


	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}


}
