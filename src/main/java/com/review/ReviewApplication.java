package com.review;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("resource/mapper/*.xml")
@SpringBootApplication
public class ReviewApplication {
    public static void main(String[] args) {
        SpringApplication.run(ReviewApplication.class, args);
    }
}
