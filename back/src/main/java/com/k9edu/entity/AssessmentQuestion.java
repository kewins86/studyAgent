package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 摸底测试题目
 */
@Data
@TableName("assessment_questions")
public class AssessmentQuestion {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long assessmentId;
    private Long studentId;
    private String subject;
    private String grade;

    /** 题型：choice/fill/solve */
    private String questionType;

    /** 题干 JSON（含选项） */
    private String content;

    /** 正确答案 */
    private String answer;

    /** 解析 */
    private String analysis;

    /** 知识点 */
    private String knowledgePoint;

    private Integer sortOrder;
    private LocalDateTime createdAt;
}
