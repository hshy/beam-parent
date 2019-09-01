package com.hsshy.beam.modular.blog;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hsshy.beam.common.annotion.IgnoreUTokenAuth;
import com.hsshy.beam.common.base.controller.BaseController;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ShortCodeKit;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.modular.blog.entity.Article;
import com.hsshy.beam.modular.blog.entity.ArticleCategory;
import com.hsshy.beam.modular.blog.service.IArticleCategoryService;
import com.hsshy.beam.modular.blog.service.IArticleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-06-04 15:34:18
 */
@Api(value = "BlogApi", tags = {"博客接口"})
@RequestMapping("/blog")
@RestController
public class BlogApi extends BaseController {

    @Autowired
    private IArticleService articleService;

    @Autowired
    private IArticleCategoryService articleCategoryService;


    @ApiOperation("列表")
    @GetMapping(value = "/list")
    public R articleList(Article article) {
        List<Article> articleList;
        if(ToolUtil.isNotEmpty(article.getCid())){
            articleList = articleService.getArticleListByCid(article.getCid());
        }
        else {
            QueryWrapper<Article> qw = new QueryWrapper();
            qw.eq("frozen",1);
            qw.select("short_code as shortCode,title,create_time as createTime,read_num as readNum,tag");
            qw.orderByDesc("sort","create_time");
            qw.last("limit 15");
            articleList = articleService.list(qw);

        }
        return R.ok(articleList);
    }
    @ApiOperation("根据分类查询文章列表")
    @GetMapping(value = "/article/list/{cid}")
    public R getArticleListByCid(@PathVariable Long cid) {
        List<Article> articleList = articleService.getArticleListByCid(cid);
        return R.ok(articleList);
    }

    @ApiOperation("分类列表")
    @GetMapping(value = "/category/list")
    public R categoryList() {
        List<ArticleCategory> articleCategoryList = articleCategoryService.getArticleCategoryList();
        return R.ok(articleCategoryList);
    }

    @IgnoreUTokenAuth
    @ApiOperation("详情")
    @GetMapping(value = "/detail/{shortCode}")
    public R detail(@PathVariable String shortCode) {
        Long pid = Long.parseLong(ShortCodeKit.convertBase62ToDecimal(shortCode));
        Long id = ShortCodeKit.permutedId(pid);
        Article article = articleService.getArticle(id);
        return R.ok(article);
    }

    @ApiOperation("增加访问量")
    @GetMapping(value = "/add/read/num")
    public R addReadNum(String shortCode) {
        System.out.println(shortCode);
        Long pid = Long.parseLong(ShortCodeKit.convertBase62ToDecimal(shortCode));
        Long id = ShortCodeKit.permutedId(pid);
        articleService.addReadNum(id);
        return R.ok();
    }


}