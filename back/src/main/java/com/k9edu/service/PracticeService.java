package com.k9edu.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.k9edu.entity.KnowledgeNode;
import com.k9edu.entity.LearningRecord;
import com.k9edu.entity.Question;
import com.k9edu.mapper.KnowledgeNodeMapper;
import com.k9edu.mapper.LearningRecordMapper;
import com.k9edu.mapper.QuestionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 练习闭环服务（V1 题库落地）
 * <p>
 * generate：按 学科/年级/知识点 从人工预置题库随机抽题（不含答案）
 * submit：逐题批改（标准化比对）→ 记录学习行为 → 更新掌握度 → 错题自动入错题本
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PracticeService {

    private static final ObjectMapper OM = new ObjectMapper();

    private final QuestionMapper questionMapper;
    private final KnowledgeNodeMapper knowledgeNodeMapper;
    private final MasteryService masteryService;
    private final LearningRecordMapper learningRecordMapper;
    private final MistakeService mistakeService;

    /** 生成练习题目（剥离答案，只给学生题干+选项） */
    public List<QuestionLite> generate(Long studentId, String subject, String grade, Long nodeId, int count) {
        count = Math.max(1, Math.min(count, 20));
        QueryWrapper<Question> qw = new QueryWrapper<Question>()
                .eq("subject", subject).eq("grade", grade).eq("deleted", 0)
                .isNotNull("images").ne("images", "").ne("images", "[]");
        if (nodeId != null) {
            qw.eq("node_id", nodeId);
        }
        qw.last("ORDER BY RAND() LIMIT " + count);
        List<Question> list = questionMapper.selectList(qw);
        List<QuestionLite> lite = new ArrayList<>();
        for (Question q : list) {
            QuestionLite l = new QuestionLite();
            l.id = q.getId();
            l.nodeId = q.getNodeId();
            l.subject = q.getSubject();
            l.grade = q.getGrade();
            l.type = q.getType();
            l.difficulty = q.getDifficulty();
            l.content = q.getContent();
            l.images = q.getImages();
            lite.add(l);
        }
        return lite;
    }

    /** 提交批改 */
    public SubmitResult submit(Long studentId, List<SubmitItem> items) {
        SubmitResult r = new SubmitResult();
        r.results = new ArrayList<>();
        int correct = 0;
        // nodeId -> [correct, total]
        Map<Long, int[]> nodeScore = new HashMap<>();
        for (SubmitItem it : items) {
            if (it == null || it.questionId == null) continue;
            Question q = questionMapper.selectById(it.questionId);
            if (q == null) continue;
            boolean ok = isCorrect(it.myAnswer, q.getAnswer());
            ResultItem ri = new ResultItem();
            ri.questionId = q.getId();
            ri.content = q.getContent();
            ri.myAnswer = it.myAnswer;
            ri.rightAnswer = q.getAnswer();
            ri.correct = ok;
            ri.analysis = q.getAnalysis();
            r.results.add(ri);
            if (ok) correct++;
            int[] sc = nodeScore.computeIfAbsent(q.getNodeId(), k -> new int[2]);
            sc[0] += ok ? 1 : 0;
            sc[1] += 1;
            if (!ok) {
                String know = "";
                KnowledgeNode kn = knowledgeNodeMapper.selectById(q.getNodeId());
                if (kn != null) know = kn.getName();
                mistakeService.add(studentId, q.getSubject(), stemOf(q.getContent()),
                        it.myAnswer, q.getAnswer(), q.getAnalysis(), know);
            }
        }
        r.correctCount = correct;
        r.total = r.results.size();
        // 更新各知识点掌握度
        for (Map.Entry<Long, int[]> e : nodeScore.entrySet()) {
            int score = e.getValue()[1] == 0 ? 0
                    : (int) Math.round(e.getValue()[0] * 100.0 / e.getValue()[1]);
            masteryService.update(studentId, e.getKey(), score);
        }
        // 学习行为记录
        LearningRecord lr = new LearningRecord();
        lr.setStudentId(studentId);
        lr.setAction("practice");
        lr.setResult(correct + "/" + r.total);
        lr.setDurationSec(0);
        lr.setCreatedAt(java.time.LocalDateTime.now());
        learningRecordMapper.insert(lr);
        return r;
    }

    /* ========== 内部工具 ========== */

    private boolean isCorrect(String my, String right) {
        if (my == null || right == null) return false;
        String a = normalize(my);
        String b = normalize(right);
        if (a.equals(b)) return true;
        try {
            double da = Double.parseDouble(a);
            double db = Double.parseDouble(b);
            return Math.abs(da - db) < 1e-6;
        } catch (Exception ignore) {
            return false;
        }
    }

    /** 标准化：去空格、去标点、去常见单位、转小写 */
    private String normalize(String s) {
        return s.trim().toLowerCase()
                .replaceAll("[\\s　]", "")
                .replaceAll("[。．.，,、？?！!：:；;]", "")
                .replaceAll("(个|厘米|cm|米|m|毫米|mm|千克|kg|克|g|分钟|分|秒|天|年)$", "");
    }

    private String stemOf(String content) {
        if (content == null) return "";
        try {
            JsonNode n = OM.readTree(content);
            return n.has("stem") ? n.get("stem").asText() : content;
        } catch (Exception e) {
            return content;
        }
    }

    /* ========== DTO ========== */

    @lombok.Data
    public static class QuestionLite {
        public Long id;
        public Long nodeId;
        public String subject;
        public String grade;
        public String type;
        public Integer difficulty;
        public String content; // JSON
        public String images;  // 图片路径JSON数组
    }

    @lombok.Data
    public static class SubmitItem {
        public Long questionId;
        public String myAnswer;
    }

    @lombok.Data
    public static class ResultItem {
        public Long questionId;
        public String content;
        public String myAnswer;
        public String rightAnswer;
        public boolean correct;
        public String analysis;
    }

    @lombok.Data
    public static class SubmitResult {
        public List<ResultItem> results;
        public int correctCount;
        public int total;
    }
}
