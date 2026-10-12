-- ============================================
-- V127: 今日家作功能（homeworks + homework_items + homework_records）
-- 兼容 H2(MySQL模式) 与 MySQL 8
-- ============================================

-- 1. 家作主表（每天一条）
CREATE TABLE IF NOT EXISTS homeworks (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL COMMENT '学生ID',
    homework_date DATE NOT NULL COMMENT '作业日期',
    status      VARCHAR(20) DEFAULT 'incomplete' COMMENT 'incomplete:未完成 / completed:已完成',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_student_date (student_id, homework_date)
);

-- 2. 家作条目表（每项作业）
CREATE TABLE IF NOT EXISTS homework_items (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    homework_id   BIGINT NOT NULL COMMENT '关联家作主表',
    student_id    BIGINT NOT NULL COMMENT '学生ID（冗余，方便查询）',
    subject       VARCHAR(20) NOT NULL COMMENT '学科：语文/数学/英语',
    content       TEXT NOT NULL COMMENT '作业内容描述',
    item_type     VARCHAR(20) DEFAULT 'written' COMMENT 'written:书面 / reading:朗读 / dictation:默写',
    status        VARCHAR(20) DEFAULT 'pending' COMMENT 'pending:待完成 / done:已完成',
    sort_order    INT DEFAULT 0 COMMENT '排序',
    -- 打卡相关
    done_image    TEXT NULL COMMENT '完成照片(base64，多张逗号分隔)',
    done_audio    TEXT NULL COMMENT '朗读录音(base64)',
    ai_check_result TEXT NULL COMMENT 'AI检查结果(JSON)',
    checked_at    TIMESTAMP NULL COMMENT '完成打卡时间',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_items_homework (homework_id),
    INDEX idx_items_student (student_id)
);

-- 3. 家作检查记录表（家长查看日志）
CREATE TABLE IF NOT EXISTS homework_records (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    homework_id   BIGINT NOT NULL,
    student_id    BIGINT NOT NULL,
    item_id       BIGINT NULL COMMENT '关联条目（NULL=整体操作）',
    action        VARCHAR(50) NOT NULL COMMENT '操作类型: create/submit/check/done/ai_check',
    detail        TEXT NULL COMMENT '操作详情(JSON)',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_records_homework (homework_id),
    INDEX idx_records_student (student_id)
);
