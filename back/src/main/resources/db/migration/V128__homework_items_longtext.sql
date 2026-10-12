-- ============================================
-- V128: homework_items.done_image / done_audio 改 LONGTEXT
-- base64 图片/音频可能 >64KB(TEXT 上限)
-- ============================================

ALTER TABLE homework_items MODIFY COLUMN done_image LONGTEXT NULL COMMENT '完成照片(base64，多张逗号分隔)';
ALTER TABLE homework_items MODIFY COLUMN done_audio LONGTEXT NULL COMMENT '朗读录音(base64)';
