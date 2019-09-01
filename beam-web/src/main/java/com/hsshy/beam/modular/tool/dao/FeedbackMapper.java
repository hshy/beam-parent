package com.hsshy.beam.modular.tool.dao;
import com.hsshy.beam.modular.tool.entity.Feedback;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
/**
 * 反馈表
 * 
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-07-05 17:25:09
 */
public interface FeedbackMapper extends BaseMapper<Feedback> {

    IPage<Feedback> selectPageList(Page page, @Param("feedback") Feedback feedback);

}
