package com.k9edu.controller;

import com.k9edu.common.Result;
import com.k9edu.service.SubjectRouterService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 健康检查 + 工具接口
 */
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class HealthController {

    private final SubjectRouterService subjectRouterService;

    /** 健康检查（前端/部署探活用） */
    @GetMapping("/health")
    public Result<Map<String, Object>> health() {
        Map<String, Object> m = new HashMap<>();
        m.put("status", "up");
        m.put("service", "k9-edu-back");
        return Result.ok(m);
    }

    /** 学科识别测试（开发调试用） */
    @GetMapping("/classify")
    public Result<Map<String, String>> classify(@RequestParam String question) {
        Map<String, String> m = new HashMap<>();
        m.put("subject", subjectRouterService.classify(question));
        return Result.ok(m);
    }
}
