package com.hsshy.beam.modular.tool.dao;
import com.hsshy.beam.modular.tool.entity.BadWord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
/**
 * 脏话表
 * 
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-07-05 17:25:09
 */
public interface BadWordMapper extends BaseMapper<BadWord> {

    IPage<BadWord> selectPageList(Page page, @Param("badWord") BadWord badWord);

}
