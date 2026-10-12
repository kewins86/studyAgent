-- ============================================
-- V3: 登录认证字段（手机号 + BCrypt 密码）
-- 兼容 H2(MySQL模式) 与 MySQL 8
-- ============================================

ALTER TABLE students ADD COLUMN phone VARCHAR(20) NULL COMMENT '手机号（登录账号）';
ALTER TABLE students ADD COLUMN password_hash VARCHAR(100) NULL COMMENT 'BCrypt 密码哈希';

CREATE UNIQUE INDEX uk_students_phone ON students (phone);
