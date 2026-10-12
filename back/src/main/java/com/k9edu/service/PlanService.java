package com.k9edu.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.k9edu.common.LlmClient;
import com.k9edu.entity.StudyPlan;
import com.k9edu.mapper.StudyPlanMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 学习计划服务（功能1 的落地）
 * <p>
 * 输入：学生画像（年级、性格、好学程度、教学偏好）
 * 输出：LLM 生成的个性化学习计划（JSON），落库 study_plans
 * <p>
 * 约束：LLM 只做计划生成，题目/内容不由此生成（V1 题库人工预置）。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PlanService {

    private final LlmClient llmClient;
    private final StudyPlanMapper studyPlanMapper;
    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 基于画像生成学习计划
     *
     * @param studentId 学生ID
     * @param grade     年级（如：三年级）
     * @param subject   学科（如：数学）
     * @param diligence 好学程度 1-5
     * @param style     教学偏好（图文/视频/互动）
     * @return 生成的计划
     */
    @Transactional
    public StudyPlan generate(Long studentId, String grade, String subject, Integer diligence, String style) {
        String prompt = """
                你是资深K9学习规划师。请为一个%s学生生成%s学科的7天学习计划。
                学生情况：好学程度%d/5，偏好%s教学。
                要求：
                1. 输出JSON对象：{"items": [{"day": 1, "content": "具体学习内容", "duration_min": 分钟数}, ...]}
                2. 内容具体可执行（如：复习两位数乘一位数竖式，做5道练习题）
                3. 循序渐进，第1-2天基础，第3-5天巩固，第6-7天综合
                4. 只输出JSON，不要任何解释文字
                """.formatted(grade, subject, diligence, style == null ? "图文" : style);

        JsonNode node = llmClient.chatJson("你是严谨的学习规划师，只输出合法JSON", prompt);

        List<String> items = new ArrayList<>();
        if (node != null) {
            // 兼容三种返回形态：{"items":[...]} / 直接数组 / 单个计划对象
            JsonNode arr = node.isArray() ? node : node.path("items");
            if (!arr.isArray() && node.has("day")) {
                arr = objectMapper.createArrayNode().add(node);
            }
            if (arr.isArray()) {
                for (JsonNode item : arr) {
                    items.add(item.toString());
                }
            }
        }
        if (items.isEmpty()) {
            throw new IllegalArgumentException("计划生成失败，请稍后重试");
        }

        StudyPlan plan = new StudyPlan();
        plan.setStudentId(studentId);
        plan.setTitle(grade + "·" + subject + " 7天学习计划");
        plan.setContent(items.toString());
        plan.setStatus("active");
        studyPlanMapper.insert(plan);
        return plan;
    }

    /** 查询学生的最近计划 */
    public StudyPlan latest(Long studentId) {
        return studyPlanMapper.selectOne(
                new com.baomidou.mybatisplus.core.conditions.query.QueryWrapper<StudyPlan>()
                        .eq("student_id", studentId)
                        .eq("status", "active")
                        .orderByDesc("id")
                        .last("LIMIT 1"));
    }
}
