package com.hsshy.beam;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
@SpringBootApplication(scanBasePackages = {"com.hsshy.beam"})
@EnableSwagger2
@EnableScheduling
@EnableCaching
@EnableAsync
public class BeamRestApplication {
    public static void main(String[] args) {
        SpringApplication.run(BeamRestApplication.class, args);
    }
}
