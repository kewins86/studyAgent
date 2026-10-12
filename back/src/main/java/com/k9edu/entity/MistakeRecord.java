package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 错题记录
 */
@Data
@TableName("mistake_records")
public class MistakeRecord {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long studentId;
    private String subject;
    private String question;
    private String myAnswer;
    private String rightAnswer;
    private String reason;
    private String knowledge;
    private String status;  // pending / mastered
    private String source;  // chat / assessment
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
