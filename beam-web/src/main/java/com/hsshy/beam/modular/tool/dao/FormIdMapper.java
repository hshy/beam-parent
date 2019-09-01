package com.hsshy.beam.modular.tool.dao;
import com.hsshy.beam.modular.tool.entity.FormId;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
/**
 * 表单id收集
 * 
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-07-05 17:25:09
 */
public interface FormIdMapper extends BaseMapper<FormId> {

    IPage<FormId> selectPageList(Page page, @Param("formId") FormId formId);

    void clearUnvalidFormId();


}
