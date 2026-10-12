package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 家作条目（每项作业）
 */
@Data
@TableName("homework_items")
public class HomeworkItem {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long homeworkId;
    private Long studentId;
    private String subject;      // 语文/数学/英语
    private String content;      // 作业内容描述
    private String itemType;     // written / reading / dictation
    private String status;       // pending / done
    private Integer sortOrder;
    private String doneImage;    // 完成照片(base64，多张逗号分隔)
    private String doneAudio;    // 朗读录音(base64)
    private String aiCheckResult; // AI检查结果(JSON)
    private LocalDateTime checkedAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
