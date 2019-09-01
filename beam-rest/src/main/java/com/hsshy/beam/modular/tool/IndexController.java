package com.hsshy.beam.modular.tool;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hsshy.beam.common.base.controller.BaseBeanController;
import com.hsshy.beam.common.utils.*;
import com.hsshy.beam.modular.tool.entity.*;
import com.hsshy.beam.modular.tool.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * @description: 工具首页接口
 * @author: hs
 * @create: 2019-02-19 16:11:10
 **/
@Api(value="IndexController",tags={"工具首页接口"})
@RestController
@RequestMapping("/index")
public class IndexController extends BaseBeanController {


    @Autowired
    private IToolMenuService toolMenuService;

    @Autowired
    private IGoodAppraiseService goodAppraiseService;

    @Autowired
    private IBadWordService badWordService;

    @Autowired
    private IFeedbackService feedbackService;


    @ApiOperation(value = "首页菜单")
    @GetMapping("/list/menu")
    public R listMenu() {

        List<ToolMenu> toolMenuList = toolMenuService.list(new QueryWrapper<ToolMenu>().eq("status",1).orderByAsc("sort"));

        return R.ok(toolMenuList);

    }


    @ApiOperation(value = "好评助手")
    @GetMapping("/good/appraise")
    public R goodAppraise(@RequestParam Integer currentPage) {
        IPage<GoodAppraise> page = goodAppraiseService.page(new Page(currentPage,1),new QueryWrapper<GoodAppraise>());
        return R.ok(page);

    }

    @ApiOperation(value = "骂人助手")
    @GetMapping("/bad/word")
    public R badWord(@RequestParam Integer currentPage) {
        IPage<BadWord> page = badWordService.page(new Page(currentPage,1),new QueryWrapper<BadWord>());
        return R.ok(page);
    }



    @ApiOperation(value = "反馈")
    @PostMapping("/feedback")
    public R feedback(@RequestBody Feedback feedback) {
        Integer count = feedbackService.count(new QueryWrapper<Feedback>().eq("mid",getUserId()).like("create_time", DateUtil.getDay()));
        if(count>=3){
            return R.fail("今日反馈次数已用完");
        }
        else {
            feedback.setId(null);
            feedback.setMid(getUserId());
            feedbackService.saveOrUpdate(feedback);
            return R.ok("反馈成功");
        }
    }






}
