package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.k9edu.common.Result;
import com.k9edu.entity.MistakeRecord;
import com.k9edu.service.MistakeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 错题本接口
 * <p>
 * GET  /api/mistakes?status=all|pending|mastered  错题列表
 * GET  /api/mistakes/stats                         统计
 * POST /api/mistakes/{id}/mastered                 标记已掌握
 */
@RestController
@RequestMapping("/api/mistakes")
@RequiredArgsConstructor
public class MistakeController {

    private final MistakeService mistakeService;

    @GetMapping
    public Result<List<MistakeRecord>> list(@RequestParam(defaultValue = "all") String status) {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(mistakeService.list(studentId, status));
    }

    @GetMapping("/stats")
    public Result<MistakeService.Stats> stats() {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(mistakeService.stats(studentId));
    }

    @PostMapping("/{id}/mastered")
    public Result<Void> mastered(@PathVariable Long id) {
        Long studentId = StpUtil.getLoginIdAsLong();
        mistakeService.markMastered(id, studentId);
        return Result.ok(null);
    }
}
