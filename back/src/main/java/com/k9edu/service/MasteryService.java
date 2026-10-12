package com.k9edu.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.k9edu.entity.KnowledgeMastery;
import com.k9edu.mapper.KnowledgeMasteryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 掌握度服务（功能4「诊」的落地）
 * <p>
 * 四级映射（简单分数，不做贝叶斯/IRT）：
 * <60 薄弱(weak) / 60-75 合格(pass) / 75-90 良好(good) / >90 精通(master)
 */
@Service
@RequiredArgsConstructor
public class MasteryService {

    private final KnowledgeMasteryMapper masteryMapper;

    /** 分数 → 等级 */
    public static String levelOf(int score) {
        if (score < 60) return "weak";
        if (score < 75) return "pass";
        if (score < 90) return "good";
        return "master";
    }

    /**
     * 更新某知识点掌握度（练/测后调用）
     * 新成绩与旧成绩取加权平均，避免单次波动过大
     */
    public KnowledgeMastery update(Long studentId, Long nodeId, int newScore) {
        QueryWrapper<KnowledgeMastery> qw = new QueryWrapper<KnowledgeMastery>()
                .eq("student_id", studentId).eq("node_id", nodeId);
        KnowledgeMastery m = masteryMapper.selectOne(qw);
        if (m == null) {
            m = new KnowledgeMastery();
            m.setStudentId(studentId);
            m.setNodeId(nodeId);
            m.setScore(newScore);
            m.setLevel(levelOf(newScore));
            masteryMapper.insert(m);
        } else {
            // 加权：旧成绩占 40%，新成绩占 60%
            int merged = (int) Math.round(m.getScore() * 0.4 + newScore * 0.6);
            m.setScore(merged);
            m.setLevel(levelOf(merged));
            masteryMapper.updateById(m);
        }
        return m;
    }

    /** 查询学生某知识点掌握度 */
    public KnowledgeMastery get(Long studentId, Long nodeId) {
        return masteryMapper.selectOne(new QueryWrapper<KnowledgeMastery>()
                .eq("student_id", studentId).eq("node_id", nodeId));
    }
}
