package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 学习行为记录
 */
@Data
@TableName("learning_records")
public class LearningRecord {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 知识点ID */
    private Long nodeId;

    /** 学/练/测 */
    private String action;

    /** 时长秒 */
    private Integer durationSec;

    /** 结果描述 */
    private String result;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
