package com.hsshy.beam.modular.tool.service.impl;
import com.hsshy.beam.modular.tool.dao.PosterBgMapper;
import com.hsshy.beam.modular.tool.entity.PosterBg;
import com.hsshy.beam.modular.tool.service.IPosterBgService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 海报背景图
 *
 * @author hs
 * @email 457030599@qq.com
 * @date 2019-09-01 16:15:56
 */
@Service
public class PosterBgServiceImpl extends ServiceImpl<PosterBgMapper, PosterBg> implements IPosterBgService {

        @Override
        public void changeFrozen(Long id, Integer frozen) {
            baseMapper.changeFrozen(id,frozen);
        }

}
