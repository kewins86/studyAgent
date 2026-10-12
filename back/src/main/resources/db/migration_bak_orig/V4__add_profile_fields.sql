-- V4: 学生画像表增加字段
ALTER TABLE student_profiles
    ADD COLUMN grade_sep INT COMMENT '年级（9月升学后）',
    ADD COLUMN nickname VARCHAR(50) COMMENT '昵称',
    ADD COLUMN academic_level VARCHAR(10) COMMENT '学业水平 A/B/C/D/E';
