package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 问答消息
 */
@Data
@TableName("chat_messages")
public class ChatMessage {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 会话ID */
    private Long sessionId;

    /** user/assistant */
    private String role;

    /** 内容 */
    private String content;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
