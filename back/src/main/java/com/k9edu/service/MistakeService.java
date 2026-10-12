package com.k9edu.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.k9edu.entity.MistakeRecord;
import com.k9edu.mapper.MistakeRecordMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 错题本服务
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class MistakeService {

    private final MistakeRecordMapper mistakeRecordMapper;

    /** 查询学生错题列表 */
    public List<MistakeRecord> list(Long studentId, String status) {
        QueryWrapper<MistakeRecord> qw = new QueryWrapper<MistakeRecord>()
                .eq("student_id", studentId)
                .orderByDesc("created_at");
        if (status != null && !status.equals("all")) {
            qw.eq("status", status);
        }
        return mistakeRecordMapper.selectList(qw);
    }

    /** 添加错题（答疑时自动记录） */
    public void add(Long studentId, String subject, String question,
                    String myAnswer, String rightAnswer, String reason, String knowledge) {
        MistakeRecord m = new MistakeRecord();
        m.setStudentId(studentId);
        m.setSubject(subject);
        m.setQuestion(question);
        m.setMyAnswer(myAnswer);
        m.setRightAnswer(rightAnswer);
        m.setReason(reason);
        m.setKnowledge(knowledge);
        m.setStatus("pending");
        m.setSource("chat");
        mistakeRecordMapper.insert(m);
    }

    /** 标记已掌握 */
    public void markMastered(Long id, Long studentId) {
        UpdateWrapper<MistakeRecord> uw = new UpdateWrapper<MistakeRecord>()
                .eq("id", id)
                .eq("student_id", studentId)
                .set("status", "mastered");
        mistakeRecordMapper.update(null, uw);
    }

    /** 统计 */
    public Stats stats(Long studentId) {
        List<MistakeRecord> all = mistakeRecordMapper.selectList(
                new QueryWrapper<MistakeRecord>().eq("student_id", studentId));
        Stats s = new Stats();
        s.total = all.size();
        s.pending = (int) all.stream().filter(m -> "pending".equals(m.getStatus())).count();
        s.mastered = (int) all.stream().filter(m -> "mastered".equals(m.getStatus())).count();
        // 本周新增
        LocalDateTime weekAgo = LocalDateTime.now().minusDays(7);
        s.weekNew = (int) all.stream()
                .filter(m -> m.getCreatedAt() != null && m.getCreatedAt().isAfter(weekAgo))
                .count();
        s.masteredRate = s.total == 0 ? 0 : (int) (s.mastered * 100 / s.total);
        return s;
    }

    @lombok.Data
    public static class Stats {
        private int total;
        private int pending;
        private int mastered;
        private int weekNew;
        private int masteredRate;
    }
}
