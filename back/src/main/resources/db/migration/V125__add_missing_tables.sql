-- V125: 补建旧版有但 H2 缺失的表（mistake_records / assessments / assessment_questions）

-- 错题记录表
CREATE TABLE IF NOT EXISTS mistake_records (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT       NOT NULL,
    subject     VARCHAR(20)  NOT NULL,
    question    TEXT         NOT NULL,
    my_answer   TEXT         NULL,
    right_answer TEXT        NULL,
    reason      VARCHAR(500) NULL,
    knowledge   VARCHAR(200) NULL,
    status      VARCHAR(20)  NOT NULL DEFAULT 'pending',
    source      VARCHAR(20)  NULL     DEFAULT 'chat',
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 摸底测试记录
CREATE TABLE IF NOT EXISTS assessments (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    subject     VARCHAR(20) NOT NULL DEFAULT '数学',
    grade       VARCHAR(20) NOT NULL,
    season      VARCHAR(20) NOT NULL,
    status      VARCHAR(20) NOT NULL DEFAULT 'pending',
    score       INT NULL,
    correct_count INT NULL,
    total_count INT NULL,
    answers     TEXT NULL,
    started_at  TIMESTAMP NULL,
    finished_at TIMESTAMP NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 摸底测试题目
CREATE TABLE IF NOT EXISTS assessment_questions (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    assessment_id   BIGINT NULL,
    student_id      BIGINT NOT NULL,
    subject         VARCHAR(20) NOT NULL DEFAULT '数学',
    grade           VARCHAR(20) NOT NULL,
    question_type   VARCHAR(20) NOT NULL DEFAULT 'choice',
    content         TEXT NOT NULL,
    answer          VARCHAR(500) NOT NULL,
    analysis        TEXT NULL,
    knowledge_point VARCHAR(100) NULL,
    sort_order      INT DEFAULT 0,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
