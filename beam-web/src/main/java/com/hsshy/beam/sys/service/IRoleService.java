package com.hsshy.beam.sys.service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hsshy.beam.common.base.service.ICommonService;
import com.hsshy.beam.common.utils.R;
import com.hsshy.beam.sys.entity.Role;
import com.hsshy.beam.sys.entity.User;

/**
 * 角色
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2018-10-10 21:13:03
 */
public interface IRoleService extends IService<Role> {

    IPage<Role> selectPageList(Role role);

    R deleteRole(Long roleIds[]);


}
