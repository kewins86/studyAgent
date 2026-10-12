package com.k9edu.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.k9edu.common.Result;
import com.k9edu.entity.ChatMessage;
import com.k9edu.entity.ChatSession;
import com.k9edu.entity.LearningRecord;
import com.k9edu.entity.MistakeRecord;
import com.k9edu.mapper.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 首页统计接口
 * GET /api/today  今日学习统计
 */
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class StatsController {

    private final ChatMessageMapper chatMessageMapper;
    private final ChatSessionMapper chatSessionMapper;
    private final LearningRecordMapper learningRecordMapper;
    private final MistakeRecordMapper mistakeRecordMapper;

    @GetMapping("/today")
    public Result<TodayStats> today() {
        Long studentId = StpUtil.getLoginIdAsLong();
        TodayStats stats = new TodayStats();

        // 今日聊天消息数（作为"完成题目"近似值）
        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
        List<ChatSession> sessions = chatSessionMapper.selectList(
                new QueryWrapper<ChatSession>().eq("student_id", studentId));
        List<Long> sessionIds = sessions.stream().map(ChatSession::getId).toList();
        if (!sessionIds.isEmpty()) {
            long msgCount = chatMessageMapper.selectCount(
                    new QueryWrapper<ChatMessage>()
                            .in("session_id", sessionIds)
                            .eq("role", "assistant")
                            .ge("created_at", todayStart));
            stats.setDone((int) msgCount);
        }

        // 今日学习时长（从 learning_records 累加 duration_sec）
        List<LearningRecord> records = learningRecordMapper.selectList(
                new QueryWrapper<LearningRecord>()
                        .eq("student_id", studentId)
                        .ge("created_at", todayStart));
        int totalSec = records.stream().mapToInt(r -> r.getDurationSec() != null ? r.getDurationSec() : 0).sum();
        stats.setMinutes(totalSec / 60);

        // 正确率：从错题记录中算（mastered / total）
        List<MistakeRecord> mistakes = mistakeRecordMapper.selectList(
                new QueryWrapper<MistakeRecord>().eq("student_id", studentId));
        if (!mistakes.isEmpty()) {
            long mastered = mistakes.stream().filter(m -> "mastered".equals(m.getStatus())).count();
            // 正确率 = 已掌握 / (已掌握 + 待订正) — 简单映射
            stats.setAccuracy((int) (mastered * 100 / mistakes.size()));
        }

        // 今日错题数
        long todayMistakes = mistakes.stream()
                .filter(m -> m.getCreatedAt() != null && m.getCreatedAt().isAfter(todayStart))
                .count();
        stats.setTodayMistakes((int) todayMistakes);

        return Result.ok(stats);
    }

    @Data
    public static class TodayStats {
        private int done = 0;          // 完成题目数
        private int accuracy = 100;    // 正确率
        private int minutes = 0;       // 学习分钟
        private int todayMistakes = 0; // 今日错题
    }
}
