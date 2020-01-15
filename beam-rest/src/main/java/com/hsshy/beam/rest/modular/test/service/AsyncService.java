package com.hsshy.beam.rest.modular.test.service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Component;
import java.util.concurrent.Future;
@Component
@Slf4j
public class AsyncService {
    /**
     * @Async注解表示异步，后面的参数对应于线程池配置类ExecutorConfig中的方法名asyncServiceExecutor()，
     * 如果不写后面的参数，直接使用@Async注解，则是使用默认的线程池
     * Future<String>为异步返回的结果。可以通过get()方法获取结果。
     */
    @Async("taskExecutor")
    public Future<String> getAsynResult1(){
        log.info("线程名称：{}",Thread.currentThread().getName());
        String result="asyncResultTest1";
        try {
            //模拟逻辑处理，休眠三秒---------
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return new AsyncResult<String>(result);
    }
    @Async("taskExecutor")
    public Future<String> getAsynResult2(){
        log.info("线程名称：{}",Thread.currentThread().getName());
        String result="asyncResultTest2";
        try {
            //模拟逻辑处理，休眠1秒---------
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return new AsyncResult<String>(result);
    }
}