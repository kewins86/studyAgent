-- V9: 错题记录表
CREATE TABLE IF NOT EXISTS mistake_records (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id  BIGINT       NOT NULL COMMENT '学生ID',
    subject     VARCHAR(20)  NOT NULL COMMENT '学科',
    question    TEXT         NOT NULL COMMENT '题目内容',
    my_answer   TEXT         NULL     COMMENT '学生答案',
    right_answer TEXT        NULL     COMMENT '正确答案',
    reason      VARCHAR(500) NULL     COMMENT '错因分析',
    knowledge   VARCHAR(200) NULL     COMMENT '关联知识点',
    status      VARCHAR(20)  NOT NULL DEFAULT 'pending' COMMENT 'pending=待订正 mastered=已掌握',
    source      VARCHAR(20)  NULL     DEFAULT 'chat' COMMENT '来源: chat=答疑 assessment=摸底',
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_student (student_id),
    INDEX idx_status (student_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题记录';
