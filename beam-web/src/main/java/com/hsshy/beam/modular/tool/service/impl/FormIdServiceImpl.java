package com.hsshy.beam.modular.tool.service.impl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hsshy.beam.common.utils.DateUtil;
import com.hsshy.beam.modular.tool.dao.FormIdMapper;
import com.hsshy.beam.modular.tool.entity.FormId;
import com.hsshy.beam.modular.tool.service.IFormIdService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Date;

/**
 * 表单id收集
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-07-05 17:25:09
 */
@Service
public class FormIdServiceImpl extends ServiceImpl<FormIdMapper, FormId> implements IFormIdService {

    @Override
    public void collectFormId(String formId, Long userId) {
        FormId formIdRec = new FormId();
        formIdRec.setFormId(formId);
        formIdRec.setMid(userId);
        formIdRec.setType(1);
        formIdRec.setCreateTime(new Date());
        formIdRec.setExpireTime(DateUtil.getAfterDayDate(formIdRec.getCreateTime(),"7"));
        System.out.println(formIdRec.getExpireTime());
        System.out.println(DateUtil.getAfterDayDate(formIdRec.getCreateTime(),"7"));
        this.save(formIdRec);
    }

    @Override
    public void clearUnvalidFormId() {
        baseMapper.clearUnvalidFormId();
    }

    @Override
    public FormId getValidFormIdByUserId(Long mid) {

        FormId formIdRec = this.getOne(new QueryWrapper<FormId>().eq("mid",mid));
        return formIdRec;
    }

}
