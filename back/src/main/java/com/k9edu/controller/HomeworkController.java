package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.k9edu.common.Result;
import com.k9edu.entity.HomeworkItem;
import com.k9edu.service.HomeworkService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 * 今日家作接口
 * <p>
 * GET  /api/homework/today             获取今日家作
 * GET  /api/homework/history?days=7    获取历史（家长检查）
 * POST /api/homework/items             录入家作条目
 * POST /api/homework/items/{id}/submit 提交作业成果（照片/录音，不标记完成）
 * POST /api/homework/items/{id}/done   标记条目完成（检查家作用）
 * POST /api/homework/items/{id}/ai      更新AI检查结果
 */
@RestController
@RequestMapping("/api/homework")
@RequiredArgsConstructor
public class HomeworkController {

    private final HomeworkService homeworkService;

    @GetMapping("/today")
    public Result<HomeworkService.HomeworkDetail> today() {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(homeworkService.getToday(studentId));
    }

    @GetMapping("/history")
    public Result<List<HomeworkService.HomeworkDetail>> history(
            @RequestParam(defaultValue = "7") int days) {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(homeworkService.getHistory(studentId, days));
    }

    @GetMapping("/date/{date}")
    public Result<HomeworkService.HomeworkDetail> byDate(@PathVariable String date) {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(homeworkService.getByDate(studentId, LocalDate.parse(date)));
    }

    @PostMapping("/items")
    public Result<List<HomeworkItem>> submitItems(@RequestBody List<HomeworkService.HomeworkItemDTO> items) {
        Long studentId = StpUtil.getLoginIdAsLong();
        return Result.ok(homeworkService.submitItems(studentId, items));
    }

    @PostMapping("/items/{id}/submit")
    public Result<HomeworkItem> submitResult(
            @PathVariable Long id,
            @RequestBody(required = false) Map<String, String> body) {
        Long studentId = StpUtil.getLoginIdAsLong();
        String doneImage = body != null ? body.get("doneImage") : null;
        String doneAudio = body != null ? body.get("doneAudio") : null;
        return Result.ok(homeworkService.submitResult(studentId, id, doneImage, doneAudio));
    }

    @PostMapping("/items/{id}/done")
    public Result<HomeworkItem> markDone(
            @PathVariable Long id,
            @RequestBody(required = false) Map<String, String> body) {
        Long studentId = StpUtil.getLoginIdAsLong();
        String doneImage = body != null ? body.get("doneImage") : null;
        String doneAudio = body != null ? body.get("doneAudio") : null;
        return Result.ok(homeworkService.markDone(studentId, id, doneImage, doneAudio));
    }

    @PostMapping("/items/{id}/ai")
    public Result<Void> updateAiCheck(
            @PathVariable Long id,
            @RequestBody Map<String, String> body) {
        Long studentId = StpUtil.getLoginIdAsLong();
        homeworkService.updateAiCheck(studentId, id, body.get("result"));
        return Result.ok(null);
    }

    /**
     * AI 识别家作（拍照模式）
     * 上传图片 → Vision LLM 识别 → 返回结构化作业条目列表
     * 前端确认后调 /items 落库
     */
    @PostMapping("/recognize")
    public Result<List<HomeworkService.HomeworkItemDTO>> recognize(@RequestBody RecognizeReq req) {
        StpUtil.getLoginIdAsLong(); // 验证登录
        List<HomeworkService.HomeworkItemDTO> items;
        if (req.getImage() != null && !req.getImage().isBlank()) {
            // 拍照模式：Vision LLM
            items = homeworkService.recognizeFromImage(req.getImage());
        } else if (req.getText() != null && !req.getText().isBlank()) {
            // 录音模式：ASR 转文字后 → LLM 解析
            items = homeworkService.recognizeFromText(req.getText());
        } else {
            return Result.fail("图片或文字不能都为空");
        }
        return Result.ok(items);
    }

    @lombok.Data
    public static class RecognizeReq {
        /** 图片 base64（不含 data: 前缀） */
        private String image;
        /** 语音转文字后的文本（录音模式） */
        private String text;
    }
}
