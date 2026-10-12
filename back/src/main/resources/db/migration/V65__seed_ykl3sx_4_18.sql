-- ykl3sx 一课一练(华师大) 三上数学 节:4.18 共14题 (确定题批次; 题面 OCR 可重建部分)
-- 来源: p105 OCR + ans_204 交叉核验(题2=5628/1880, 题3=135/928/228/16 锚定; 口算答案由算式自证无需答案定位)
-- node分布: 1010=2(加减/加减混合口算), 1016=3(两位数×一位拆十口算 5×24/25×4/24×5 及同型), 1018=2(积含0特型口算 8×125/405×6), 1014=1(整十×一位 20×5), 1017=2(三位数×一位数竖式 804×7/8×235), 1011=3(递等式混合 201-198÷3/18+182×5/456÷8×4)
-- 待目检: 4.18题1另9式面(答案18值含20……2等)、题2竖式另2式(189/68……)、题3第4式(=16)、题4应用(8×4=32个/40÷8=5个 语义)、题5表格(20/76/12?)、题6(1)(2)(75×8=600个/932÷4=233棵 语义)题6(3)(63÷5=12个余3 装盒语境)、题7(10÷2=5个/28÷(6+1)=4个)、题8(80个?…4?12? 答在ans_205顶) 均存问题清单
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '口算', 1, '{"stem": "口算：36+64=", "options": null}', '100', '36+64=100。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1018, '数学', '三年级', '口算', 1, '{"stem": "口算：8×125=", "options": null}', '1000', '125×8=1000（125×4=500，500×2=1000）。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '口算', 1, '{"stem": "口算：86+14=", "options": null}', '100', '86+14=100。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1016, '数学', '三年级', '口算', 1, '{"stem": "口算：5×24=", "options": null}', '120', '24×5：先算20×5=100，4×5=20，100+20=120。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1016, '数学', '三年级', '口算', 1, '{"stem": "口算：25×4=", "options": null}', '100', '25×4=100（25×2=50，50×2=100）。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '口算', 1, '{"stem": "口算：480+120÷6=", "options": null}', '500', '先算除法：120÷6=20，再算加法：480+20=500。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '口算', 1, '{"stem": "口算：(143+57)-8=", "options": null}', '192', '先算括号里：143+57=200，再算减法：200-8=192。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '口算', 1, '{"stem": "口算：20×5=", "options": null}', '100', '先算2×5=10，再在末尾添1个0，得100。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1018, '数学', '三年级', '口算', 1, '{"stem": "口算：405×6=", "options": null}', '2430', '405×6：先算400×6=2400，5×6=30，2400+30=2430。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1017, '数学', '三年级', '计算', 1, '{"stem": "用竖式计算：804×7=", "options": null}', '5628', '804×7：个位7×4=28，写8进2；十位7×0=0，加进位2得2；百位7×8=56。结果是5628。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1017, '数学', '三年级', '计算', 1, '{"stem": "用竖式计算：8×235=", "options": null}', '1880', '235×8：个位8×5=40，写0进4；十位8×3=24，加进位4得28，写8进2；百位8×2=16，加进位2得18。结果是1880。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '计算', 1, '{"stem": "用递等式计算：201-198÷3=", "options": null}', '135', '先算除法：198÷3=66，再算减法：201-66=135。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '计算', 1, '{"stem": "用递等式计算：18+182×5=", "options": null}', '928', '先算乘法：182×5=910，再算加法：18+910=928。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '计算', 1, '{"stem": "用递等式计算：456÷8×4=", "options": null}', '228', '乘除混合从左往右算：456÷8=57，57×4=228。', 'paper', '["practice", "ykl3sx", "4.18"]', '["paper_png/ykl3_sx/p105.png"]', 0);
