package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 学习计划
 */
@Data
@TableName("study_plans")
public class StudyPlan {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 标题 */
    private String title;

    /** 计划项JSON */
    private String content;

    /** 状态 */
    private String status;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
