-- ykl3sx 一课一练(华师大) 三上数学 5.2大月小月/5.4星期推算补录 共3题
-- 锚证:
--  1. p122题6(1) 选B: 2024闰年2月有29日,2月28日后一天=2月29日 — ans_207题6(1)B[注:2024年2月有29日]; 陷阱D=2月30日不存在
--  2. p122题6(2): 2021-10-01至12-31 = 31+30+31=92天 — ans_207题6(2)C[推算:31+30+31=92] (原为选择,转填空保语义)
--  3. p118题(5) 判断: "一年中有7个大月、5个小月" ✗ — ans_207题5?(5)×[注:2月]; 实际大月7个+小月4个+2月特殊
-- node: 1037=1, 1036=2
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1037, '数学', '三年级', '选择', 2, '{"stem": "2024年2月28日的后一天是（ ）", "options": ["A. 3月1日", "B. 2月29日", "C. 3月2日", "D. 2月30日"]}', 'B', '2024年是闰年，2月有29天，所以2月28日的后一天是2月29日（2月没有30日）。', 'paper', '["practice", "ykl3sx", "5.4"]', '["paper_png/ykl3_sx/p122.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1036, '数学', '三年级', '填空', 2, '{"stem": "2021年10月1日到12月31日一共有（ ）天", "options": null}', '92', '10月有31天，11月有30天，12月有31天，31+30+31=92天。', 'paper', '["practice", "ykl3sx", "5.4"]', '["paper_png/ykl3_sx/p122.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1036, '数学', '三年级', '判断', 1, '{"stem": "一年中有7个大月、5个小月。（ ）", "options": null}', '×', '一年有7个大月（1、3、5、7、8、10、12月），4个小月（4、6、9、11月），2月既不是大月也不是小月。', 'paper', '["practice", "ykl3sx", "5.2"]', '["paper_png/ykl3_sx/p118.png"]', 0);
