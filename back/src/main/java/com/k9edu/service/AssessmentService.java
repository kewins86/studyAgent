package com.k9edu.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.k9edu.common.BizException;
import com.k9edu.common.LlmClient;
import com.k9edu.entity.Assessment;
import com.k9edu.entity.AssessmentQuestion;
import com.k9edu.entity.Student;
import com.k9edu.entity.StudentProfile;
import com.k9edu.mapper.AssessmentMapper;
import com.k9edu.mapper.AssessmentQuestionMapper;
import com.k9edu.mapper.StudentMapper;
import com.k9edu.mapper.StudentProfileMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

/**
 * 摸底测试服务
 * <p>
 * 问卷提交后触发：
 * 1. 根据 Q1（9月升X年级）+ 当前日期推算年级和季节
 * 2. 调 LLM 生成 5 道数学题（二年级重要知识点），存库可复用
 * 3. 测试完成后调 LLM 更新画像
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AssessmentService {

    private final AssessmentMapper assessmentMapper;
    private final AssessmentQuestionMapper assessmentQuestionMapper;
    private final StudentProfileMapper studentProfileMapper;
    private final StudentMapper studentMapper;
    private final LlmClient llmClient;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /** 安全序列化 JSON（不抛异常） */
    private String toJson(Object obj) {
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (Exception e) {
            log.error("JSON 序列化失败", e);
            return "{}";
        }
    }

    /** 二年级数学重要知识点（用于 LLM 出题提示） */
    private static final String G2_MATH_TOPICS = """
            1. 100以内加减法（进位加法、退位减法）
            2. 表内乘法（乘法口诀表，2-9的乘法）
            3. 表内除法（用乘法口诀求商）
            4. 角的初步认识（直角、锐角、钝角）
            5. 长度单位（厘米和米的关系、测量）
            6. 观察物体（从不同方向看）
            7. 统计与概率（简单的数据收集和整理）
            8. 数学广角（简单的排列组合）
            """;

    /**
     * 生成摸底测试
     * <p>
     * 如果已有未完成的测试返回已有的；否则调 LLM 生成新题目。
     *
     * @param studentId 学生ID
     * @return 测试记录（含题目列表）
     */
    @Transactional
    public Map<String, Object> generateAssessment(Long studentId) {
        // 1. 查画像（问卷 Q1 升几年级）和学生本身（注册时填的当前年级），
        //    任一存在即用其算出题年级，无需问卷全部完成
        StudentProfile profile = studentProfileMapper.selectOne(
                new QueryWrapper<StudentProfile>().eq("student_id", studentId));
        Student student = studentMapper.selectById(studentId);
        if (student == null) {
            throw new BizException("学生信息不存在");
        }

        int currentGrade; // 出题目标：当前在读年级
        if (profile != null && profile.getGradeSep() != null) {
            // 问卷 Q1: 9月升X年级 → 当前年级 = gradeSep - 1
            currentGrade = profile.getGradeSep() - 1;
        } else if (student.getGrade() != null && !student.getGrade().isBlank()) {
            // 注册时填的"X年级"已是当前年级，直接用
            currentGrade = gradeNameToNumber(student.getGrade());
            if (currentGrade <= 0) {
                throw new BizException("请先完成问卷设置年级信息，或在个人资料中完善年级");
            }
        } else {
            throw new BizException("请先完成问卷设置年级信息，或在个人资料中完善年级");
        }

        // 2. 推算季节
        String season = getSeason(LocalDate.now());
        // 出题年级：暑假/寒假用刚结束的年级（currentGrade），学期内也用 currentGrade 已学过的
        String gradeName = gradeNumberToName(currentGrade);

        // 3. 查是否有未完成的测试
        Assessment existing = assessmentMapper.selectOne(
                new QueryWrapper<Assessment>()
                        .eq("student_id", studentId)
                        .eq("status", "pending")
                        .orderByDesc("created_at")
                        .last("LIMIT 1"));
        if (existing != null) {
            // 已有待完成测试，返回其题目
            List<AssessmentQuestion> questions = assessmentQuestionMapper.selectList(
                    new QueryWrapper<AssessmentQuestion>()
                            .eq("assessment_id", existing.getId())
                            .orderByAsc("sort_order"));
            if (!questions.isEmpty()) {
                return buildResult(existing, questions);
            }
        }

        // 也检查是否有已完成的测试（不重复生成）
        Assessment completed = assessmentMapper.selectOne(
                new QueryWrapper<Assessment>()
                        .eq("student_id", studentId)
                        .eq("status", "completed")
                        .orderByDesc("created_at")
                        .last("LIMIT 1"));
        if (completed != null) {
            // 已完成，返回结果
            List<AssessmentQuestion> questions = assessmentQuestionMapper.selectList(
                    new QueryWrapper<AssessmentQuestion>()
                            .eq("assessment_id", completed.getId())
                            .orderByAsc("sort_order"));
            return buildResult(completed, questions);
        }

        // 4. 调 LLM 生成 5 道数学题
        log.info("生成摸底测试：studentId={}, grade={}, season={}", studentId, gradeName, season);
        List<AssessmentQuestion> questions = generateMathQuestions(studentId, gradeName);

        // 5. 创建测试记录
        Assessment assessment = new Assessment();
        assessment.setStudentId(studentId);
        assessment.setSubject("数学");
        assessment.setGrade(gradeName);
        assessment.setSeason(season);
        assessment.setStatus("pending");
        assessment.setTotalCount(questions.size());
        assessment.setCreatedAt(LocalDateTime.now());
        assessmentMapper.insert(assessment);

        // 6. 题目关联测试记录
        for (int i = 0; i < questions.size(); i++) {
            AssessmentQuestion q = questions.get(i);
            q.setAssessmentId(assessment.getId());
            q.setSortOrder(i + 1);
            assessmentQuestionMapper.insert(q);
        }

        return buildResult(assessment, questions);
    }

    /**
     * 获取当前测试状态（前端判断入口用）
     */
    public Map<String, Object> getAssessmentStatus(Long studentId) {
        Map<String, Object> result = new HashMap<>();

        Assessment pending = assessmentMapper.selectOne(
                new QueryWrapper<Assessment>()
                        .eq("student_id", studentId)
                        .in("status", "pending", "in_progress")
                        .orderByDesc("created_at")
                        .last("LIMIT 1"));
        if (pending != null) {
            result.put("status", pending.getStatus());
            result.put("assessmentId", pending.getId());
            result.put("grade", pending.getGrade());
            result.put("season", pending.getSeason());
            return result;
        }

        Assessment completed = assessmentMapper.selectOne(
                new QueryWrapper<Assessment>()
                        .eq("student_id", studentId)
                        .eq("status", "completed")
                        .orderByDesc("created_at")
                        .last("LIMIT 1"));
        if (completed != null) {
            result.put("status", "completed");
            result.put("assessmentId", completed.getId());
            result.put("score", completed.getScore());
            result.put("correctCount", completed.getCorrectCount());
            result.put("totalCount", completed.getTotalCount());
            return result;
        }

        result.put("status", "none");
        return result;
    }

    /**
     * 获取测试题目（分页式：前端一题一答，但一次返回全部，前端控制翻页）
     */
    public Map<String, Object> getAssessmentQuestions(Long studentId, Long assessmentId) {
        Assessment assessment = assessmentMapper.selectById(assessmentId);
        if (assessment == null || !assessment.getStudentId().equals(studentId)) {
            throw new RuntimeException("测试不存在");
        }
        List<AssessmentQuestion> questions = assessmentQuestionMapper.selectList(
                new QueryWrapper<AssessmentQuestion>()
                        .eq("assessment_id", assessmentId)
                        .orderByAsc("sort_order"));

        // 标记为进行中
        if ("pending".equals(assessment.getStatus())) {
            UpdateWrapper<Assessment> uw = new UpdateWrapper<>();
            uw.eq("id", assessmentId);
            uw.set("status", "in_progress");
            uw.set("started_at", LocalDateTime.now());
            assessmentMapper.update(null, uw);
        }

        return buildResult(assessment, questions);
    }

    /**
     * 提交测试
     * <p>
     * 批改 → 记录成绩 → 调 LLM 更新画像
     */
    @Transactional
    public Map<String, Object> submitAssessment(Long studentId, Long assessmentId, Map<String, String> answers) {
        Assessment assessment = assessmentMapper.selectById(assessmentId);
        if (assessment == null || !assessment.getStudentId().equals(studentId)) {
            throw new RuntimeException("测试不存在");
        }

        List<AssessmentQuestion> questions = assessmentQuestionMapper.selectList(
                new QueryWrapper<AssessmentQuestion>()
                        .eq("assessment_id", assessmentId)
                        .orderByAsc("sort_order"));

        // 批改
        int correct = 0;
        List<Map<String, Object>> answerDetails = new ArrayList<>();
        for (AssessmentQuestion q : questions) {
            String studentAnswer = answers.getOrDefault(String.valueOf(q.getId()), "");
            boolean isCorrect = studentAnswer.trim().equals(q.getAnswer().trim());
            if (isCorrect) correct++;

            Map<String, Object> detail = new HashMap<>();
            detail.put("questionId", q.getId());
            detail.put("studentAnswer", studentAnswer);
            detail.put("correctAnswer", q.getAnswer());
            detail.put("isCorrect", isCorrect);
            detail.put("knowledgePoint", q.getKnowledgePoint());
            answerDetails.add(detail);
        }

        int score = (int) Math.round((double) correct / questions.size() * 100);

        // 更新测试记录
        UpdateWrapper<Assessment> uw = new UpdateWrapper<>();
        uw.eq("id", assessmentId);
        uw.set("status", "completed");
        uw.set("score", score);
        uw.set("correct_count", correct);
        uw.set("total_count", questions.size());
        uw.set("answers", toJson(answers));
        uw.set("finished_at", LocalDateTime.now());
        assessmentMapper.update(null, uw);

        // 调 LLM 更新画像
        try {
            updateProfileWithAssessment(studentId, assessment, answerDetails);
        } catch (Exception e) {
            log.warn("测试后画像更新失败，不影响测试结果：{}", e.getMessage());
        }

        // 返回结果
        Map<String, Object> result = new HashMap<>();
        result.put("assessmentId", assessmentId);
        result.put("score", score);
        result.put("correctCount", correct);
        result.put("totalCount", questions.size());
        result.put("details", answerDetails);
        return result;
    }

    /**
     * 调 LLM 生成 5 道二年级数学题
     */
    private List<AssessmentQuestion> generateMathQuestions(Long studentId, String gradeName) {
        String systemPrompt = """
                你是一位资深的小学数学教师和教研专家。请根据指定年级的重要知识点，生成 5 道选择题用于摸底测试。

                要求：
                1. 每道题 4 个选项（A/B/C/D），只有 1 个正确答案
                2. 题目难度适中，覆盖该年级核心知识点
                3. 每道题标注考查的知识点
                4. 附带简要解析

                输出格式（JSON）：
                {
                  "questions": [
                    {
                      "content": "题干文本",
                      "options": ["选项A", "选项B", "选项C", "选项D"],
                      "answer": "B",
                      "analysis": "解析说明",
                      "knowledgePoint": "知识点名称"
                    }
                  ]
                }
                """;

        String userMessage = String.format(
                "年级：%s\n请基于以下重要知识点生成 5 道选择题：\n%s",
                gradeName, G2_MATH_TOPICS);

        JsonNode result = llmClient.chatJson(systemPrompt, userMessage);
        if (result == null || !result.has("questions")) {
            throw new RuntimeException("LLM 生成题目失败");
        }

        List<AssessmentQuestion> questions = new ArrayList<>();
        for (JsonNode qNode : result.get("questions")) {
            AssessmentQuestion q = new AssessmentQuestion();
            q.setStudentId(studentId);
            q.setSubject("数学");
            q.setGrade(gradeName);
            q.setQuestionType("choice");

            // content: {"stem": "...", "options": ["A","B","C","D"]}
            Map<String, Object> content = new HashMap<>();
            content.put("stem", qNode.get("content").asText());
            List<String> options = new ArrayList<>();
            if (qNode.has("options") && qNode.get("options").isArray()) {
                for (JsonNode opt : qNode.get("options")) {
                    options.add(opt.asText());
                }
            }
            content.put("options", options);
            q.setContent(toJson(content));

            q.setAnswer(qNode.get("answer").asText());
            q.setAnalysis(qNode.has("analysis") ? qNode.get("analysis").asText() : "");
            q.setKnowledgePoint(qNode.has("knowledgePoint") ? qNode.get("knowledgePoint").asText() : "");
            q.setCreatedAt(LocalDateTime.now());
            questions.add(q);
        }

        if (questions.isEmpty()) {
            throw new RuntimeException("LLM 未生成有效题目");
        }

        return questions;
    }

    /**
     * 测试完成后调 LLM 更新画像
     */
    private void updateProfileWithAssessment(Long studentId, Assessment assessment, List<Map<String, Object>> answerDetails) {
        StudentProfile profile = studentProfileMapper.selectOne(
                new QueryWrapper<StudentProfile>().eq("student_id", studentId));
        if (profile == null) return;

        String existingSummary = profile.getAiSummary() != null ? profile.getAiSummary() : "（暂无）";
        String extraJson = profile.getExtra() != null ? profile.getExtra() : "{}";

        // 构造答题摘要
        StringBuilder answerSummary = new StringBuilder();
        for (Map<String, Object> d : answerDetails) {
            answerSummary.append(String.format("题%s: %s → %s (%s)\n",
                    d.get("questionId"),
                    d.get("studentAnswer"),
                    d.get("correctAnswer"),
                    (boolean) d.get("isCorrect") ? "✓" : "✗ 知识点:" + d.get("knowledgePoint")));
        }

        String systemPrompt = """
                你是一位资深的小学教育专家。家长已完成了孩子学习问卷，孩子刚完成了一次摸底测试。
                请结合原有画像和测试结果，生成更新后的学习画像。

                要求：
                1. 综合问卷信息和测试表现，生成 150-200 字画像描述
                2. 测试结果应修正或验证问卷中的学业水平判断
                3. 给出针对性的教学策略建议
                4. 3-5 个更新后的特征标签

                输出格式（JSON）：
                {
                  "summary": "更新后的画像描述",
                  "strategy": "教学策略建议",
                  "tags": ["标签1", "标签2"]
                }
                """;

        String userMessage = String.format(
                "原有画像：\n%s\n\n问卷答案：\n%s\n\n摸底测试结果（%s，%d/%d 正确）：\n%s",
                existingSummary,
                extraJson,
                assessment.getGrade(),
                assessment.getCorrectCount(),
                assessment.getTotalCount(),
                answerSummary.toString());

        JsonNode result = llmClient.chatJson(systemPrompt, userMessage);
        if (result == null) {
            log.warn("测试后画像更新返回 null");
            return;
        }

        String summary = result.has("summary") ? result.get("summary").asText() : "";
        String strategy = result.has("strategy") ? result.get("strategy").asText() : "";
        StringBuilder fullSummary = new StringBuilder(summary);
        if (!strategy.isBlank()) {
            fullSummary.append("\n\n💡 教学策略：").append(strategy);
        }

        List<String> tags = new ArrayList<>();
        if (result.has("tags") && result.get("tags").isArray()) {
            for (JsonNode tag : result.get("tags")) {
                tags.add(tag.asText());
            }
        }
        String tagsJoined = String.join("|", tags);

        UpdateWrapper<StudentProfile> uw = new UpdateWrapper<>();
        uw.eq("student_id", studentId);
        uw.set("ai_summary", fullSummary.toString());
        uw.set("ai_tags", tagsJoined);
        studentProfileMapper.update(null, uw);

        log.info("测试后画像已更新，studentId={}, score={}/{}", studentId,
                assessment.getCorrectCount(), assessment.getTotalCount());
    }

    /** 判断季节 */
    private String getSeason(LocalDate date) {
        int month = date.getMonthValue();
        int day = date.getDayOfMonth();
        // 暑假：7月1日 - 8月31日
        if (month == 7 || month == 8) return "summer";
        // 寒假：1月15日 - 2月28日
        if ((month == 1 && day >= 15) || month == 2) return "winter";
        return "semester";
    }

    /** 年级数字转中文名 */
    private String gradeNumberToName(int grade) {
        String[] names = {"一年级", "二年级", "三年级", "四年级", "五年级", "六年级", "初一", "初二", "初三"};
        if (grade >= 1 && grade <= 9) return names[grade - 1];
        return "二年级";
    }

    /** 中文年级名 → 数字（一年级=1, ..., 六年级=6, 初一=7, 初二=8, 初三=9） */
    private int gradeNameToNumber(String name) {
        if (name == null) return 0;
        switch (name.trim()) {
            case "一年级": return 1;
            case "二年级": return 2;
            case "三年级": return 3;
            case "四年级": return 4;
            case "五年级": return 5;
            case "六年级": return 6;
            case "初一":   return 7;
            case "初二":   return 8;
            case "初三":   return 9;
            default: return 0;
        }
    }

    /** 构造返回结果 */
    private Map<String, Object> buildResult(Assessment assessment, List<AssessmentQuestion> questions) {
        Map<String, Object> result = new HashMap<>();
        result.put("assessmentId", assessment.getId());
        result.put("status", assessment.getStatus());
        result.put("grade", assessment.getGrade());
        result.put("season", assessment.getSeason());
        result.put("score", assessment.getScore());
        result.put("correctCount", assessment.getCorrectCount());
        result.put("totalCount", assessment.getTotalCount());

        List<Map<String, Object>> questionList = new ArrayList<>();
        for (AssessmentQuestion q : questions) {
            Map<String, Object> qMap = new HashMap<>();
            qMap.put("id", q.getId());
            qMap.put("content", q.getContent());
            qMap.put("knowledgePoint", q.getKnowledgePoint());
            // 不返回 answer/analysis 给前端（防作弊），提交后统一批改
            questionList.add(qMap);
        }
        result.put("questions", questionList);
        return result;
    }
}
