package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 试卷
 */
@Data
@TableName("papers")
public class Paper {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 试卷类型 */
    private String type;

    /** 组卷规则JSON */
    private String config;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
