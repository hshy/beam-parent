package com.hsshy.beam.modular.tool.service;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hsshy.beam.modular.tool. entity.PosterBg;

/**
 * 海报背景图
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-09-01 16:15:56
 */
public interface IPosterBgService extends IService<PosterBg> {


    void changeFrozen(Long id, Integer frozen);

}
