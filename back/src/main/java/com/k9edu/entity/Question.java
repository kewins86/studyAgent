package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 题目
 */
@Data
@TableName("questions")
public class Question {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 知识点ID */
    private Long nodeId;

    /** 学科 */
    private String subject;

    /** 年级 */
    private String grade;

    /** 题型 */
    private String type;

    /** 难度1-5 */
    private Integer difficulty;

    /** 题干JSON */
    private String content;

    /** 答案 */
    private String answer;

    /** 解析 */
    private String analysis;

    /** 来源 */
    private String source;

    /** 标签JSON */
    private String tags;

    /** 图片路径JSON数组，如 ["/static/qimg/p001.jpg"] */
    private String images;

    @TableLogic
    private Integer deleted;
}
