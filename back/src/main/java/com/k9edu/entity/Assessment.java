package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 摸底测试记录
 */
@Data
@TableName("assessments")
public class Assessment {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long studentId;

    /** 学科 */
    private String subject;

    /** 出题年级 */
    private String grade;

    /** 季节：summer/winter/semester */
    private String season;

    /** 状态：pending/in_progress/completed */
    private String status;

    /** 得分 */
    private Integer score;

    /** 答对题数 */
    private Integer correctCount;

    /** 总题数 */
    private Integer totalCount;

    /** 学生作答详情 JSON */
    private String answers;

    private LocalDateTime startedAt;
    private LocalDateTime finishedAt;
    private LocalDateTime createdAt;
}
