package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.service.AssessmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 摸底测试接口
 * <p>
 * POST /api/assessment/generate  生成测试（调 LLM 出题，存库）
 * GET  /api/assessment/status    查询测试状态
 * GET  /api/assessment/{id}      获取测试题目
 * POST /api/assessment/{id}/submit  提交测试（批改 + 更新画像）
 */
@RestController
@RequestMapping("/api/assessment")
@RequiredArgsConstructor
public class AssessmentController {

    private final AssessmentService assessmentService;

    /** 生成摸底测试 */
    @PostMapping("/generate")
    public Result<Map<String, Object>> generate() {
        Long studentId = getCurrentStudentId();
        return Result.ok(assessmentService.generateAssessment(studentId));
    }

    /** 查询测试状态（前端判断入口用） */
    @GetMapping("/status")
    public Result<Map<String, Object>> status() {
        Long studentId = getCurrentStudentId();
        return Result.ok(assessmentService.getAssessmentStatus(studentId));
    }

    /** 获取测试题目 */
    @GetMapping("/{assessmentId}")
    public Result<Map<String, Object>> getQuestions(@PathVariable Long assessmentId) {
        Long studentId = getCurrentStudentId();
        return Result.ok(assessmentService.getAssessmentQuestions(studentId, assessmentId));
    }

    /** 提交测试 */
    @PostMapping("/{assessmentId}/submit")
    public Result<Map<String, Object>> submit(@PathVariable Long assessmentId,
                                               @RequestBody Map<String, String> answers) {
        Long studentId = getCurrentStudentId();
        return Result.ok(assessmentService.submitAssessment(studentId, assessmentId, answers));
    }

    private Long getCurrentStudentId() {
        return cn.dev33.satoken.stp.StpUtil.getLoginIdAsLong();
    }
}
