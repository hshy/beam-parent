package com.hsshy.beam.modular.business.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hsshy.beam.modular.business.entity.Article;
import com.hsshy.beam.modular.business.service.IArticleService;
import com.hsshy.beam.common.base.controller.BaseController;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ToolUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.Arrays;
import java.util.List;

/**
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-06-04 15:34:18
 */
@Api(value = "ArticleController", tags = {"Article接口"})
@RequestMapping("/business/article")
@RestController
public class ArticleController extends BaseController {

    @Autowired
    private IArticleService articleService;


    //分页
    @ApiOperation("分页列表")
    @GetMapping(value = "/page/list")
    public R pageList(Article article) {

        QueryWrapper qw = new QueryWrapper<Article>();

        IPage page = articleService.page(new Page(article.getCurrentPage(), article.getPageSize()), qw);
        return R.ok(page);
    }

    @ApiOperation("列表")
    @GetMapping(value = "/list")
    public R list(Article article) {

        QueryWrapper qw = new QueryWrapper<Article>();

        List<Article> articleList = articleService.list(qw);
        return R.ok(articleList);
    }

    @ApiOperation("保存")
    @PostMapping(value = "/save")
    public R save(@RequestBody Article article) {

        articleService.saveOrUpdate(article);
        return R.ok();
    }

    @ApiOperation("删除")
    @PostMapping(value = "/delete")
    public R delete(@RequestBody Long articleIds[]) {

        if (ToolUtil.isEmpty(articleIds) || articleIds.length <= 0) {
            return R.fail("未提交要删除的记录");
        }
        articleService.removeByIds(Arrays.asList(articleIds));
        return R.ok();
    }


}