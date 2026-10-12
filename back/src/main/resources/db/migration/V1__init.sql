-- ============================================
-- V1: k9教育智能体 初始表结构（12张表）
-- 兼容 H2(MySQL模式) 与 MySQL 8
-- ============================================

-- 1. 学生表
CREATE TABLE IF NOT EXISTS students (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50)  NOT NULL,
    grade       VARCHAR(20)  NOT NULL COMMENT '年级，如：初一/高一',
    track       VARCHAR(10)  NULL COMMENT '文/理（高中）',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted     TINYINT DEFAULT 0
);

-- 2. 学生画像表（1:1）
CREATE TABLE IF NOT EXISTS student_profiles (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id    BIGINT NOT NULL,
    personality   VARCHAR(100) COMMENT '性格：内向/外向/沉稳/好动等',
    diligence     INT COMMENT '好学程度 1-5',
    learning_style VARCHAR(20) COMMENT '偏好：图文/视频/互动',
    extra         TEXT COMMENT '扩展字段',
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id)
);

-- 3. 知识点表（静态章节树）
CREATE TABLE IF NOT EXISTS knowledge_nodes (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    parent_id   BIGINT NULL COMMENT '父节点，顶级为NULL',
    subject     VARCHAR(20) NOT NULL COMMENT '学科：语文/数学/英语/物理/化学/生物',
    grade       VARCHAR(20) NOT NULL,
    chapter     VARCHAR(100) COMMENT '章节名',
    name        VARCHAR(200) NOT NULL COMMENT '知识点名',
    level       INT DEFAULT 1 COMMENT '层级：1年级/2章节/3知识点',
    sort_order  INT DEFAULT 0,
    INDEX idx_nodes_subject_grade (subject, grade)
);

-- 4. 题库表
CREATE TABLE IF NOT EXISTS questions (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    node_id     BIGINT NULL COMMENT '关联知识点',
    subject     VARCHAR(20) NOT NULL,
    grade       VARCHAR(20) NOT NULL,
    type        VARCHAR(20) NOT NULL COMMENT '单选/多选/填空/解答',
    difficulty  INT DEFAULT 1 COMMENT '1-5',
    content     TEXT NOT NULL COMMENT '题干（含选项）',
    answer      TEXT COMMENT '答案',
    analysis    TEXT COMMENT '解析',
    source      VARCHAR(20) DEFAULT '自研' COMMENT '自研/模拟/真题',
    tags        TEXT COMMENT '考点标签',
    deleted     TINYINT DEFAULT 0,
    INDEX idx_questions_node (node_id),
    INDEX idx_questions_subject_grade (subject, grade)
);

-- 5. 试卷表
CREATE TABLE IF NOT EXISTS papers (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    type        VARCHAR(20) NOT NULL COMMENT '摸底/变式/单元',
    config      TEXT COMMENT '组卷规则',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. 试卷-题目关联
CREATE TABLE IF NOT EXISTS paper_questions (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    paper_id    BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    sort_order  INT DEFAULT 0,
    INDEX idx_pq_paper (paper_id)
);

-- 7. 测试记录表
CREATE TABLE IF NOT EXISTS test_records (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    paper_id    BIGINT NULL,
    score       INT COMMENT '得分',
    answers     TEXT COMMENT '学生作答',
    started_at  TIMESTAMP,
    finished_at TIMESTAMP,
    INDEX idx_tr_student (student_id)
);

-- 8. 知识掌握度表（四级：weak/pass/good/master）
CREATE TABLE IF NOT EXISTS knowledge_mastery (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    node_id     BIGINT NOT NULL,
    level       VARCHAR(10) NOT NULL COMMENT 'weak/pass/good/master',
    score       INT DEFAULT 0,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id, node_id)
);

-- 9. 学习行为埋点表（V2 周报数据源）
CREATE TABLE IF NOT EXISTS learning_records (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    node_id     BIGINT NULL,
    action      VARCHAR(20) NOT NULL COMMENT '学/练/测',
    duration_sec INT DEFAULT 0,
    result      VARCHAR(200) COMMENT '结果描述',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_lr_student_time (student_id, created_at)
);

-- 10. 学习计划表
CREATE TABLE IF NOT EXISTS study_plans (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    title       VARCHAR(200),
    content     TEXT COMMENT '计划项数组',
    status      VARCHAR(20) DEFAULT 'active',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_sp_student (student_id)
);

-- 11. 问答会话表
CREATE TABLE IF NOT EXISTS chat_sessions (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT NOT NULL,
    subject     VARCHAR(20) COMMENT '学科',
    node_id     BIGINT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_cs_student (student_id)
);

-- 12. 问答消息表
CREATE TABLE IF NOT EXISTS chat_messages (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    session_id  BIGINT NOT NULL,
    role        VARCHAR(10) NOT NULL COMMENT 'user/assistant',
    content     TEXT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_cm_session (session_id)
);
