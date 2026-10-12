-- ============================================
-- V7: 摸底测试表
-- ============================================

-- 摸底测试记录
CREATE TABLE IF NOT EXISTS assessments (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    subject     VARCHAR(20) NOT NULL DEFAULT '数学',
    grade       VARCHAR(20) NOT NULL COMMENT '出题年级（如二年级）',
    season      VARCHAR(20) NOT NULL COMMENT 'summer/winter/semester 暑假/寒假/学期内',
    status      VARCHAR(20) NOT NULL DEFAULT 'pending' COMMENT 'pending/in_progress/completed',
    score       INT NULL COMMENT '得分（0-100）',
    correct_count INT NULL COMMENT '答对题数',
    total_count INT NULL COMMENT '总题数',
    answers     TEXT NULL COMMENT '学生作答详情',
    started_at  TIMESTAMP NULL,
    finished_at TIMESTAMP NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_assess_student (student_id)
);

-- 摸底测试题目（LLM 生成后存库，可复用）
CREATE TABLE IF NOT EXISTS assessment_questions (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    assessment_id   BIGINT NULL COMMENT '关联测试记录（NULL=题库模板）',
    student_id      BIGINT NOT NULL,
    subject         VARCHAR(20) NOT NULL DEFAULT '数学',
    grade           VARCHAR(20) NOT NULL,
    question_type   VARCHAR(20) NOT NULL DEFAULT 'choice' COMMENT 'choice/fill/solve',
    content         TEXT NOT NULL COMMENT '题干（含选项）',
    answer          VARCHAR(500) NOT NULL COMMENT '正确答案',
    analysis        TEXT NULL COMMENT '解析',
    knowledge_point VARCHAR(100) NULL COMMENT '知识点',
    sort_order      INT DEFAULT 0,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_aq_assessment (assessment_id),
    INDEX idx_aq_student (student_id)
);
