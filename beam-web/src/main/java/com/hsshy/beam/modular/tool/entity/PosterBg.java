package com.hsshy.beam.modular.tool.entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hsshy.beam.common.base.entity.RestEntity;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

/**
 * 海报背景图
 *
 * @author hs
 */
@Data
@NoArgsConstructor
@TableName("t_poster_bg")
public class PosterBg extends RestEntity<Long> {

    //
    @TableId
    private Long id;
    //图片地址
    @TableField(value = "img_url")
    private String imgUrl;
    //备注
    @TableField(value = "remark")
    private String remark;
    //是否可用
    @TableField(value = "frozen")
    private Integer frozen;
    //分类ID
    @TableField(value = "cid")
    private Long cid;
    @Override
    public Long getId(){
        return id;
    }
    @Override
    public void setId(Long id){
        this.id=id;
    }
    @Override
    protected Serializable pkVal(){
        return this.id;
    }
}