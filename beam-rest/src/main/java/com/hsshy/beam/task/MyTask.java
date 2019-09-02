package com.hsshy.beam.task;
import com.hsshy.beam.common.utils.RedisUtil;
import com.hsshy.beam.modular.mini.constant.MiniAppConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import weixin.popular.support.TokenManager;

/**
 * 定时器
 */
//@Profile({"prod-8081"})
@Component
public class MyTask {

    protected Logger logger = LoggerFactory.getLogger(MyTask.class);

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 每118分钟任务
     */
    @Scheduled(fixedRate = 1000*60*118)
    public void task(){
        MiniAppConfig miniAppConfig = redisUtil.get("MiniAppConfig",MiniAppConfig.class);
        logger.info("--------------定时获取token--------------");
        TokenManager.init(miniAppConfig.getAppId(), miniAppConfig.getAppSecret());
        redisUtil.set(miniAppConfig.getAppId()+":access:token", TokenManager.getToken(miniAppConfig.getAppId()));
        logger.info("小程序:"+redisUtil.get(miniAppConfig.getAppId()+":access:token"));

    }




}
