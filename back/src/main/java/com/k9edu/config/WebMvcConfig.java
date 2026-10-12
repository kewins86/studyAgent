package com.k9edu.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

/**
 * 静态资源映射：将 /paper_png/** 请求映射到本地文件系统 ~/k9-edu-data/paper_png/
 * 让前端能通过 http://localhost:8080/paper_png/ykl3_sx/p065.png 访问题目图片
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String paperDir = System.getProperty("user.home") + File.separator + "k9-edu-data" + File.separator + "paper_png";
        registry.addResourceHandler("/paper_png/**")
                .addResourceLocations("file:" + paperDir + File.separator);
    }
}
