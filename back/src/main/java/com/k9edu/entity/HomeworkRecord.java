package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 家作操作记录（家长查看日志）
 */
@Data
@TableName("homework_records")
public class HomeworkRecord {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long homeworkId;
    private Long studentId;
    private Long itemId;
    private String action;  // create/submit/check/done/ai_check
    private String detail;  // JSON
    private LocalDateTime createdAt;
}
