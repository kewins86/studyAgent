package com.k9edu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 学生
 */
@Data
@TableName("students")
public class Student {

    @TableId(type = IdType.AUTO)
    /** 主键 */
    private Long id;

    /** 姓名 */
    private String name;

    /** 年级 */
    private String grade;

    /** 文/理 */
    private String track;

    /** 手机号（登录账号） */
    private String phone;

    /** BCrypt 密码哈希（不序列化给前端） */
    @JsonIgnore
    private String passwordHash;

    /** 创建时间 */
    private LocalDateTime createdAt;

    /** 更新时间 */
    private LocalDateTime updatedAt;

    @TableLogic
    private Integer deleted;
}
