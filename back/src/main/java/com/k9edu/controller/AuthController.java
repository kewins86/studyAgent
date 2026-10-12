package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.k9edu.common.Result;
import com.k9edu.entity.Student;
import com.k9edu.service.AuthService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 登录认证接口
 * <p>
 * POST /api/auth/register  注册（手机号+密码，返回 token）
 * POST /api/auth/login     登录（返回 token）
 * GET  /api/auth/me        当前登录学生（需 token）
 * POST /api/auth/logout    登出（需 token）
 */
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public Result<AuthResp> register(@RequestBody RegisterReq req) {
        Student s = authService.register(req.getPhone(), req.getPassword());
        StpUtil.login(s.getId()); // 注册即登录
        return Result.ok(buildResp(s));
    }

    @PostMapping("/login")
    public Result<AuthResp> login(@RequestBody LoginReq req) {
        Student s = authService.login(req.getPhone(), req.getPassword());
        return Result.ok(buildResp(s));
    }

    @GetMapping("/me")
    public Result<Student> me() {
        return Result.ok(authService.current());
    }

    @PostMapping("/logout")
    public Result<Void> logout() {
        authService.logout();
        return Result.ok();
    }

    private AuthResp buildResp(Student s) {
        AuthResp resp = new AuthResp();
        resp.setToken(StpUtil.getTokenValue());
        resp.setStudent(s);
        return resp;
    }

    @Data
    public static class RegisterReq {
        private String phone;
        private String password;
    }

    @Data
    public static class LoginReq {
        private String phone;
        private String password;
    }

    @Data
    public static class AuthResp {
        private String token;
        private Student student;
    }
}
