package com.hsshy.beam.modular.sys.controller;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hsshy.beam.common.annotion.SysLog;
import com.hsshy.beam.common.base.controller.BaseController;
import com.hsshy.beam.common.utils.DateUtil;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.common.utils.ToolUtil;
import com.hsshy.beam.modular.sys.dto.RoleExportDto;
import com.hsshy.beam.modular.sys.entity.Menu;
import com.hsshy.beam.modular.sys.entity.Role;
import com.hsshy.beam.modular.sys.service.IRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 角色
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2018-10-10 21:13:03
 */
@Api(value="RoleController",tags={"Role接口"})
@RestController
@RequestMapping("/sys/role")
public class RoleController extends BaseController {

    @Autowired
    private IRoleService roleService;

    @RequiresPermissions("sys:role:list")
    @ApiOperation(value = "分页列表")
    @GetMapping(value = "/page/list")
    public Object pageList(Role role)  {

        return  R.ok(roleService.selectPageList(role));
    }

    @ApiOperation(value = "列表")
    @GetMapping(value = "/list")
    public Object list(Role role)  {

        QueryWrapper qw = new QueryWrapper<Role>();
        return  R.ok(roleService.list(qw));
    }


    @SysLog(value = "保存角色")
    @RequiresPermissions(value = {"sys:role:add","sys:role:edit"},logical = Logical.OR)
    @ApiOperation("保存角色")
    @PostMapping(value = "/save")
    public Object save(@RequestBody Role role){
        roleService.saveOrUpdate(role);
        return R.ok();
    }
    @RequiresPermissions("sys:role:del")
    @ApiOperation("批量删除用户")
    @PostMapping(value = "/delete")
    public Object delete(@RequestBody Long roleIds[]){

        return roleService.deleteRole(roleIds);
    }

    @ApiOperation("角色详情")
    @GetMapping(value = "/info}")
    @RequiresPermissions("sys:role:edit")
    public Object info(@RequestParam Long roleId){

        return R.ok(roleService.getById(roleId));
    }

    @ApiOperation(value = "获取角色的菜单权限")
    @GetMapping(value = "/menu/list")
    public Object roleMenuList(@RequestParam Long roleId)  {

        return  R.ok(roleService.getCheckMenuIds(roleId));
    }

    @RequiresPermissions("sys:role:configPerm")
    @ApiOperation("配置菜单权限")
    @PostMapping(value = "/save/menu/perm")
    public Object saveMuenPerms(@RequestBody Role role){

        return roleService.saveMuenPerms(role);
    }


    @RequiresPermissions("sys:role:export")
    @ApiOperation("导出")
    @GetMapping(value = "/export")
    public void exportExcel(Role role) throws Exception{
        QueryWrapper<Role> qw = new QueryWrapper();
        if(ToolUtil.isNotEmpty(role.getRoleName())){
            qw.like("role_name",role.getRoleName());
        }
        if(ToolUtil.isNotEmpty(role.getRoleIds())&&role.getRoleIds().length>0){
            qw.in("id",role.getRoleIds());
        }
        List<Role> roleList = roleService.list(qw);
        List<RoleExportDto> roleExportDtoList = new ArrayList<>();
        for(int i=0;i<roleList.size();i++){
            RoleExportDto roleExportDto = new RoleExportDto();
            BeanUtils.copyProperties(roleList.get(i),roleExportDto);
            roleExportDtoList.add(roleExportDto);
        }

        String sheetName = "sheet1";
        OutputStream out = getExportExcelResponse("角色数据导出-"+ DateUtil.getAllTime()).getOutputStream();
        ExcelWriter writer = new ExcelWriter(out, ExcelTypeEnum.XLSX);
        Sheet sheet = new Sheet(1,0, RoleExportDto.class);
        sheet.setSheetName(sheetName);
        writer.write(roleExportDtoList,sheet);
        writer.finish();

    }


}