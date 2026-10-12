package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.entity.StudyPlan;
import com.k9edu.service.PlanService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 学习计划接口（功能1 落地）
 * <p>
 * POST /api/students/{id}/plan  基于画像生成计划（LLM）
 * GET  /api/students/{id}/plan/latest  查询最近计划
 */
@RestController
@RequestMapping("/api/students/{studentId}/plan")
@RequiredArgsConstructor
public class PlanController {

    private final PlanService planService;

    /** 生成学习计划 */
    @PostMapping
    public Result<StudyPlan> generate(@PathVariable Long studentId, @Valid @RequestBody GenReq req) {
        return Result.ok(planService.generate(
                studentId, req.getGrade(), req.getSubject(), req.getDiligence(), req.getStyle()));
    }

    /** 查询最近计划 */
    @GetMapping("/latest")
    public Result<StudyPlan> latest(@PathVariable Long studentId) {
        return Result.ok(planService.latest(studentId));
    }

    @Data
    public static class GenReq {
        @NotBlank(message = "年级不能为空")
        private String grade;
        @NotBlank(message = "学科不能为空")
        private String subject;
        @NotNull(message = "好学程度不能为空")
        private Integer diligence;
        private String style;
    }
}
