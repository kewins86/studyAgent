package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 学生画像
 */
@Data
@TableName("student_profiles")
public class StudentProfile {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 学生ID */
    private Long studentId;

    /** 性格 */
    private String personality;

    /** 好学程度1-5 */
    private Integer diligence;

    /** 偏好：图文/视频/互动 */
    private String learningStyle;

    /** 年级（9月升学后） */
    private Integer gradeSep;

    /** 昵称 */
    private String nickname;

    /** 学业水平 A/B/C/D/E */
    private String academicLevel;

    /** 扩展字段JSON */
    private String extra;

    /** AI 生成的画像描述（summary + strategy） */
    private String aiSummary;

    /** AI 生成的标签（竖线分隔，如：主动型学习者|需鼓励驱动|兴趣导向） */
    private String aiTags;

    /** 更新时间 */
    private LocalDateTime updatedAt;
}
