package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 试卷题目关联
 */
@Data
@TableName("paper_questions")
public class PaperQuestion {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 试卷ID */
    private Long paperId;

    /** 题目ID */
    private Long questionId;

    /** 排序 */
    private Integer sortOrder;
}
