package com.k9edu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * k9教育智能体 - 启动类
 */
@SpringBootApplication
@MapperScan("com.k9edu.mapper")
public class K9EduApplication {

    public static void main(String[] args) {
        SpringApplication.run(K9EduApplication.class, args);
        System.out.println("""
                
                ============================================
                 k9教育智能体启动成功
                 接口文档: http://localhost:8080
                 H2控制台: http://localhost:8080/h2-console
                ============================================
                """);
    }
}
