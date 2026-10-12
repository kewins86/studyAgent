package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.entity.Student;
import com.k9edu.service.StudentService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 学生管理
 */
@RestController
@RequestMapping("/api/students")
@RequiredArgsConstructor
public class StudentController {

    private final StudentService studentService;

    /** 创建学生 */
    @PostMapping
    public Result<Student> create(@Valid @RequestBody CreateReq req) {
        return Result.ok(studentService.create(req.getName(), req.getGrade(), req.getTrack()));
    }

    /** 查询学生 */
    @GetMapping("/{id}")
    public Result<Student> get(@PathVariable Long id) {
        return Result.ok(studentService.get(id));
    }

    @Data
    public static class CreateReq {
        @NotBlank(message = "姓名不能为空")
        private String name;
        @NotBlank(message = "年级不能为空")
        private String grade;
        private String track;
    }
}
