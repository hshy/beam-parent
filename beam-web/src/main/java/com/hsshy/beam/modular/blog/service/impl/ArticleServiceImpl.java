package com.hsshy.beam.modular.blog.service.impl;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ShortCodeKit;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.modular.blog.dao.ArticleMapper;
import com.hsshy.beam.modular.blog.entity.Article;
import com.hsshy.beam.modular.blog.service.IArticleService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

/**
 * 
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-06-04 15:34:18
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {


    @Override
    public IPage<Article> selectPageList(Page page, Article article) {
        return baseMapper.selectPageList(page,article);
    }

    @Override
    public Integer addReadNum(Long id) {
        return baseMapper.addReadNum(id);
    }

    @Override
    public Article getArticle(Long id) {
        return baseMapper.getArticle(id);
    }

    @Override
    public Article getArticleInfo(Long id) {
        return baseMapper.getArticleInfo(id);
    }

    @Override
    public R saveArticle(Article article) {
        if(ToolUtil.isNotEmpty(article.getId())){
            if(ToolUtil.isEmpty(article.getShortCode())){
                Long pid = ShortCodeKit.permutedId(article.getId());
                String shortCode = ShortCodeKit.convertDecimalToBase62(pid,8);
                article.setShortCode(shortCode);
            }
            baseMapper.delRefById(article.getId());
        }
        else {
            Long pid = ShortCodeKit.permutedId(article.getId());
            String shortCode = ShortCodeKit.convertDecimalToBase62(pid,8);
            article.setShortCode(shortCode);
        }
        boolean a = this.saveOrUpdate(article);
        if(a&&article.getCids().size()>0){
            baseMapper.saveRef(article.getId(),article.getCids());
        }
        return R.ok(article);

    }

    @Override
    public List<Article> getArticleListByCid(Long cid) {
        return baseMapper.getArticleListByCid(cid);
    }
}
