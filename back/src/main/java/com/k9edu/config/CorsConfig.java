package com.k9edu.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import java.io.IOException;

/**
 * 跨域配置（Filter 级别，确保在 Sa-Token 拦截器之前处理 CORS preflight）
 * <p>
 * 前端 uni-app H5 开发（localhost:5173）与后端（localhost:8080）联调必需。
 * 用 Filter 而非 WebMvcConfigurer，因为 Filter 执行优先级高于 Interceptor，
 * OPTIONS preflight 请求不会被 Sa-Token 401 拦截。
 */
@Configuration
public class CorsConfig {

    @Bean
    public FilterRegistrationBean<CorsFilter> corsFilterRegistration() {
        FilterRegistrationBean<CorsFilter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new CorsFilter());
        bean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        bean.addUrlPatterns("/*");
        return bean;
    }

    /**
     * CORS Filter：处理跨域，直接放行 OPTIONS preflight
     */
    static class CorsFilter implements Filter {
        @Override
        public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
                throws IOException, ServletException {
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) res;

            String origin = request.getHeader("Origin");
            if (origin != null) {
                response.setHeader("Access-Control-Allow-Origin", origin);
                response.setHeader("Access-Control-Allow-Credentials", "true");
                response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
                response.setHeader("Access-Control-Allow-Headers", "*");
                response.setHeader("Access-Control-Max-Age", "3600");
            }

            // OPTIONS preflight 直接返回 200，不进入后续拦截器
            if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
                response.setStatus(HttpServletResponse.SC_OK);
                return;
            }

            chain.doFilter(req, res);
        }
    }
}
