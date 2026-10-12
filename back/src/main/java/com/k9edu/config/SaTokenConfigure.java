package com.k9edu.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Sa-Token 拦截：全站需登录（白名单除外）
 * <p>
 * 登录/注册/健康检查放行，其余接口未带有效 token 一律 401。
 */
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {

    /** 无需登录的路径 */
    private static final String[] EXCLUDE = {
            "/api/auth/login",
            "/api/auth/register",
            "/api/health",
            "/api/asr/signature",
            "/paper_png/**",
            "/error",
            "/favicon.ico"
    };

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SaInterceptor(handle -> cn.dev33.satoken.stp.StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns(EXCLUDE);
    }
}
