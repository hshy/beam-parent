package com.hsshy.beam.modular.tool.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hsshy.beam.modular.tool.entity.FormId;
/**
 * 表单id收集
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-07-05 17:25:09
 */
public interface IFormIdService extends IService<FormId> {

    void collectFormId(String formId, Long userId);

    void clearUnvalidFormId();

    FormId getValidFormIdByUserId(Long memberId);

}
