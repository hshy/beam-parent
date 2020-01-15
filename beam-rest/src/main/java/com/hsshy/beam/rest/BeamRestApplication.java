package com.hsshy.beam.rest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
@EnableSwagger2
@EnableScheduling
@EnableCaching
@EnableAsync
@SpringBootApplication(scanBasePackages = {"com.hsshy.beam"})
public class BeamRestApplication {
    public static void main(String[] args) {
        SpringApplication.run(BeamRestApplication.class, args);
    }
}
