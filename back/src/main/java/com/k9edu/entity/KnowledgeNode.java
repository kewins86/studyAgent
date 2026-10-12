package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 知识点（静态章节树）
 */
@Data
@TableName("knowledge_nodes")
public class KnowledgeNode {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 父节点 */
    private Long parentId;

    /** 学科 */
    private String subject;

    /** 年级 */
    private String grade;

    /** 章节名 */
    private String chapter;

    /** 知识点名 */
    private String name;

    /** 层级1-3 */
    private Integer level;

    /** 排序 */
    private Integer sortOrder;
}
