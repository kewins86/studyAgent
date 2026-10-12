package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 知识掌握度
 */
@Data
@TableName("knowledge_mastery")
public class KnowledgeMastery {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 知识点ID */
    private Long nodeId;

    /** weak/pass/good/master */
    private String level;

    /** 得分 */
    private Integer score;

    /** 更新时间 */
    private LocalDateTime updatedAt;
}
