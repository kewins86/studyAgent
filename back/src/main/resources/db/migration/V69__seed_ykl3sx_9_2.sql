-- ykl3sx 一课一练(华师大) 三上数学 节:9.2 练习2 共9题 (确定题批次; 册162 = p165页1上半)
-- 来源: p165 OCR + ans_214 9.2段(题1口算行读序 72 7 80 720 70 74 7200 14 83 → 5式锚定; 题2递等式3值1204/456/112 → 2式锚定(112式面未捕获); 题3递等式详解 601-372+128=229+128=357 / 364+36÷2=364+18=382 全锚)
-- 锚证: 9×8=72(序1) 90×8=720(序4) 9×800=7200(序7) 56+6×4=80(序3) 75+23-15=83(序9) = 三列行读序自洽; 574+6×105=574+630=1204; 600-576÷4=600-144=456(OCR ÷→-)
-- node分布: 38=1(表内乘9×8), 1014=2(90×8/9×800 整十整百×一), 1010=2(75+23-15/601-372+128 加减混合), 1011=4(56+6×4/574+6×105/600-576÷4/364+36÷2 先乘除后加减)
-- 待目检: 题1另4式(值7/70/74/14 中列式面未捕获)、题2第3式(值112)、题4判断面、题5应用3小问、题6填数、题7表格(p166续页) 存问题清单
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
38, '数学', '三年级', '口算', 1, '{"stem": "口算：9×8=", "options": null}', '72', '用乘法口诀“八九七十二”，9×8=72。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '口算', 1, '{"stem": "口算：90×8=", "options": null}', '720', '先算9×8=72，再在末尾添1个0，得720。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '口算', 1, '{"stem": "口算：9×800=", "options": null}', '7200', '先算9×8=72，再在末尾添2个0，得7200。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '口算', 1, '{"stem": "口算：56+6×4=", "options": null}', '80', '先算6×4=24，再算56+24=80。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '口算', 1, '{"stem": "口算：75+23-15=", "options": null}', '83', '按从左往右的顺序：75+23=98，98-15=83。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：574+6×105", "options": null}', '1204', '先算乘法：6×105=630，再算加法：574+630=1204。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：600-576÷4", "options": null}', '456', '先算除法：576÷4=144，再算减法：600-144=456。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：601-372+128", "options": null}', '357', '按从左往右的顺序：601-372=229，229+128=357。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：364+36÷2", "options": null}', '382', '先算除法：36÷2=18，再算加法：364+18=382。', 'paper', '["practice", "ykl3sx", "9.2"]', '["paper_png/ykl3_sx/p165.png"]', 0);
