package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.entity.StudentProfile;
import com.k9edu.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 学生画像接口（功能1）
 * <p>
 * POST /api/students/{id}/profile  提交画像问卷
 * GET  /api/students/{id}/profile  查询画像
 */
@RestController
@RequestMapping("/api/students/{studentId}/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final StudentService studentService;

    /** 提交画像问卷 */
    @PostMapping
    public Result<StudentProfile> save(@PathVariable Long studentId, @RequestBody StudentProfile profile) {
        return Result.ok(studentService.saveProfile(studentId, profile));
    }

    /** 查询画像 */
    @GetMapping
    public Result<StudentProfile> get(@PathVariable Long studentId) {
        StudentProfile p = studentService.getProfile(studentId);
        return p == null ? Result.fail(1003, "画像尚未创建") : Result.ok(p);
    }
}
