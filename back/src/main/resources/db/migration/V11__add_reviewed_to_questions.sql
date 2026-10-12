-- V11: 题目审核标记
-- LLM 自动生成的题目 reviewed=0，待人工审核；历史人工种子题默认已审核=1
ALTER TABLE questions ADD COLUMN reviewed TINYINT NOT NULL DEFAULT 1 COMMENT '0未审核/1已审核';
