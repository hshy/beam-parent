package com.hsshy.beam.modular.business.dao;
import com.hsshy.beam.modular.business.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * 
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-06-04 15:34:18
 */
public interface ArticleMapper extends BaseMapper<Article> {

    IPage<Article> selectPageList(Page page, @Param("article") Article article);

}
