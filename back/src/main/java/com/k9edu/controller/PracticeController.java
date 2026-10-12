package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.k9edu.common.Result;
import com.k9edu.service.PracticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 练习闭环接口（V1 题库）
 * <p>
 * POST /api/practice/generate  生成练习（不含答案）
 * POST /api/practice/submit    提交批改
 */
@RestController
@RequestMapping("/api/practice")
@RequiredArgsConstructor
public class PracticeController {

    private final PracticeService practiceService;

    @PostMapping("/generate")
    public Result<List<PracticeService.QuestionLite>> generate(@RequestBody GenerateReq req) {
        Long studentId = StpUtil.getLoginIdAsLong();
        String subject = req.subject != null ? req.subject : "数学";
        String grade = req.grade != null ? req.grade : "三年级";
        int count = req.count != null ? req.count : 5;
        return Result.ok(practiceService.generate(studentId, subject, grade, req.nodeId, count));
    }

    @PostMapping("/submit")
    public Result<PracticeService.SubmitResult> submit(@RequestBody SubmitReq req) {
        Long studentId = StpUtil.getLoginIdAsLong();
        List<PracticeService.SubmitItem> items = req.items == null ? List.of() : req.items;
        return Result.ok(practiceService.submit(studentId, items));
    }

    /* ========== DTO ========== */

    @lombok.Data
    public static class GenerateReq {
        public String subject;
        public String grade;
        public Long nodeId;
        public Integer count;
    }

    @lombok.Data
    public static class SubmitReq {
        public List<PracticeService.SubmitItem> items;
    }
}
