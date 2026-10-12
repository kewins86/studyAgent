-- ykl3sx 一课一练(华师大) 三上数学 节:9.4 练习4 共6题 (确定题批次; 册167 = p170)
-- 来源: p170 OCR + ans_214 9.4段题1(2)换算12空 值序 10 100 1000 50 5 40 3000 702 9 6 6 40
-- 锚证: 3km=3000m(序7) 7m2cm=702cm(序8) 96mm=9cm6mm(序9/10) 6040m=6km40m(序11/12) 4cm=40mm(序6) 全命中
-- 题1(3)排序: 答案序 6m3dm 36dm 3m6cm 636mm = 630cm>360cm>306cm>63.6cm 递减 → 题干=从大到小(答案序自证)
-- 未录: 行A 3空(值10/100/1000 式面OCR缺)、500cm=?dm(单位空OCR缺)、题2判断(图形题面) 存问题清单
-- node分布: 1045=1(3km=3000m), 1039=1(4cm=40mm), 1040=3(7m2cm/96mm/6040m 复名单名互化), 1040=1(长度比大小排序)
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1045, '数学', '三年级', '填空', 1, '{"stem": "单位换算：3km=（ ）m", "options": null}', '3000', '1km=1000m，3km=3000m。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1039, '数学', '三年级', '填空', 1, '{"stem": "单位换算：4cm=（ ）mm", "options": null}', '40', '1cm=10mm，4cm=40mm。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1040, '数学', '三年级', '填空', 1, '{"stem": "单位换算：7m2cm=（ ）cm", "options": null}', '702', '7m=700cm，700cm+2cm=702cm。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1040, '数学', '三年级', '填空', 1, '{"stem": "单位换算：96mm=（ ）cm（ ）mm", "options": null}', '9cm6mm', '96mm=90mm+6mm=9cm6mm。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1040, '数学', '三年级', '填空', 1, '{"stem": "单位换算：6040m=（ ）km（ ）m", "options": null}', '6km40m', '6040m=6000m+40m=6km40m。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1040, '数学', '三年级', '排序', 2, '{"stem": "把6m3dm、36dm、3m6cm、636mm按从大到小的顺序排列：", "options": null}', '6m3dm＞36dm＞3m6cm＞636mm', '统一化成cm比较：6m3dm=630cm，36dm=360cm，3m6cm=306cm，636mm=63.6cm。630＞360＞306＞63.6，所以6m3dm＞36dm＞3m6cm＞636mm。', 'paper', '["practice", "ykl3sx", "9.4"]', '["paper_png/ykl3_sx/p170.png"]', 0);
