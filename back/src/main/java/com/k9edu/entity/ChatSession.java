package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 问答会话
 */
@Data
@TableName("chat_sessions")
public class ChatSession {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 学科 */
    private String subject;

    /** 知识点ID */
    private Long nodeId;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
