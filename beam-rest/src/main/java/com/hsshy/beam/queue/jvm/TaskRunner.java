package com.hsshy.beam.queue.jvm;

import com.hsshy.beam.queue.entity.SuccessKilled;
import com.hsshy.beam.queue.service.ISeckillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * 消费秒杀队列
 * 创建者 科帮网
 * 创建时间	2018年4月3日
 */
@Component
public class TaskRunner implements ApplicationRunner {
	
	@Autowired
	private ISeckillService seckillService;
	
	@Override
    public void run(ApplicationArguments var) throws Exception{
		while(true){
			//进程内队列
			SuccessKilled kill = SeckillQueue.getMailQueue().consume();
			if(kill!=null){
				seckillService.startSeckil(kill.getId(), kill.getUserId());
			}
		}
    }
}