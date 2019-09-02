package com.hsshy.beam.modular.tool.dao;
import com.hsshy.beam.modular.tool.entity.PosterBg;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
/**
 * 海报背景图
 * 
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-09-01 16:15:56
 */
public interface PosterBgMapper extends BaseMapper<PosterBg> {

    IPage<PosterBg> selectPageList(Page page, @Param("posterBg") PosterBg posterBg);

    void changeFrozen(@Param("id") Long id, @Param("frozen") Integer frozen);

}
