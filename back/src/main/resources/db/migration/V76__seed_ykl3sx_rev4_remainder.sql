-- ykl3sx 一课一练(华师大) 三上数学 第4章复习卷 带余除法余数最大 2题
-- 锚证(数学强制): 选项仅余数最大者唯一合法
--  1. p113底 选择16: □÷5=18……□余数最大 → 18×5+4=94(C); A92余2 B93余3 C94余4均合法 → 单选必为"最大"=94; D95=余5非法陷阱
--  2. p114中 选择: □÷8=12……□余数最大 → 12×8+7=103(B); A96余0合法但非最大; D107=余11>除数非法
-- node 1027 带余除法
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1027, '数学', '三年级', '选择', 2, '{"stem": "□÷5=18……□中，要使余数最大，被除数是（ ）", "options": ["A. 92", "B. 93", "C. 94", "D. 95"]}', 'C', '余数必须比除数5小，最大余数是4，18×5+4=94。D的95表示余数5，等于除数，不合法。', 'paper', '["practice", "ykl3sx", "复习4"]', '["paper_png/ykl3_sx/p113.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1027, '数学', '三年级', '选择', 2, '{"stem": "□÷8=12……□中，要使余数最大，被除数是（ ）", "options": ["A. 96", "B. 103", "C. 105", "D. 107"]}', 'B', '余数必须比除数8小，最大余数是7，12×8+7=103。D的107表示余数11，超过除数，不合法。', 'paper', '["practice", "ykl3sx", "复习4"]', '["paper_png/ykl3_sx/p114.png"]', 0);
