package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 测试记录
 */
@Data
@TableName("test_records")
public class TestRecord {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 试卷ID */
    private Long paperId;

    /** 得分 */
    private Integer score;

    /** 作答JSON */
    private String answers;

    /** 开始时间 */
    private LocalDateTime startedAt;

    /** 结束时间 */
    private LocalDateTime finishedAt;
}
