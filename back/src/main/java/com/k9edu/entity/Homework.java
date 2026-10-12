package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 家作主表（每天一条）
 */
@Data
@TableName("homeworks")
public class Homework {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long studentId;
    private LocalDate homeworkDate;
    private String status; // incomplete / completed
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
