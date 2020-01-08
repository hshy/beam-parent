package com.hsshy.beam.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import java.util.concurrent.ThreadPoolExecutor;
@Configuration
@EnableAsync
/**
 * @description 线程池配置
 * @date: 2020/1/8 10:10
 * @author: hs
 */
public class ThreadPoolTaskConfig {
    /**
     *   默认情况下，在创建了线程池后，线程池中的线程数为0，当有任务来之后，就会创建一个线程去执行任务，
     *	当线程池中的线程数目达到corePoolSize后，就会把到达的任务放到缓存队列当中；
     *  当队列满了，就继续创建线程，当线程数量大于等于maxPoolSize后，开始使用拒绝策略拒绝
     *
     *
     *  注意事项：
     * 如下方式会使@Async失效
     * 一、异步方法使用static修饰
     * 二、异步类没有使用@Component注解（或其他注解）导致spring无法扫描到异步类
     * 三、异步方法不能与被调用的异步方法在同一个类中
     * 四、类中需要使用@Autowired或@Resource等注解自动注入，不能自己手动new对象
     * 五、如果使用SpringBoot框架必须在启动类中增加@EnableAsync注解
     *
     */

    /** 核心线程数（默认线程数） */
    private static final int    corePoolSize     = 20;
    /** 最大线程数 */
    private static final int    maxPoolSize      = 50;
    /** 允许线程空闲时间（单位：默认为秒） */
    private static final int    keepAliveTime    = 10;
    /** 缓冲队列大小 */
    private static final int    queueCapacity    = 60;
    /** 线程池名前缀 */
    private static final String threadNamePrefix = "Async-Service-";

    @Bean("taskExecutor") // bean的名称，默认为首字母小写的方法名
    public ThreadPoolTaskExecutor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setKeepAliveSeconds(keepAliveTime);
        executor.setThreadNamePrefix(threadNamePrefix);
        // 线程池对拒绝任务的处理策略
        // CallerRunsPolicy：由调用线程（提交任务的线程）处理该任务
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 丢弃任务，抛运行时异常
//        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());
        // 初始化
        executor.initialize();
        return executor;
    }

}