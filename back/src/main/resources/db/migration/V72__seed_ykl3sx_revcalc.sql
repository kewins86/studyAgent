-- ykl3sx 一课一练(华师大) 三上数学 总复习计算页 共12题 (确定题批次; 册173 = p176 + p177应用(4))
-- 来源: p176/p177 OCR + ans_215 段B(节标题OCR丢,疑9.6/9.7,册173; 题1口算10值/题2竖式/题3递等式4值/题4(4))
-- 锚证: 300×4=1200 12+8×9=84 32÷4×10=80 504×2=1008 25×7×4=700(口算值序1200 11 84 80 100 1008 700 22 49 6 中5命中,另5式面OCR缺)
--       竖式 8×34=272 230×5=1150(题2首2式); 递等式 159+345+241=745 375-158+42=259 256-56÷4=242 317-(135-83)=265(4值全锚)
--       应用4(4): p177面(6个盒/100个/4个) + 答案(100-4)÷6=16(盒) → 100个每盒装6个剩4个 装了多少盒(96÷6=16唯一)
-- 未录: 题1另5式(11/100/22/49/6)、题2后3式(25…1/160/…)、题4(3)(5)(6)(图表格) → 问题清单
-- node分布: 1014=2(300×4/230×5), 1011=4(12+8×9/32÷4×10/25×7×4/256-56÷4), 1018=2(504×2/8×34), 1010=3(159+345+241/375-158+42/317-(135-83)), 1026=1(96÷6应用)
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '口算', 1, '{"stem": "口算：300×4=", "options": null}', '1200', '先算3×4=12，再在末尾添2个0，得1200。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '口算', 1, '{"stem": "口算：12+8×9=", "options": null}', '84', '先算8×9=72，再算12+72=84。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '口算', 1, '{"stem": "口算：32÷4×10=", "options": null}', '80', '按从左往右的顺序：32÷4=8，8×10=80。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1018, '数学', '三年级', '口算', 1, '{"stem": "口算：504×2=", "options": null}', '1008', '先算500×2=1000，4×2=8，1000+8=1008。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '口算', 1, '{"stem": "口算：25×7×4=", "options": null}', '700', '25×4=100，100×7=700。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1018, '数学', '三年级', '竖式', 2, '{"stem": "列竖式计算：8×34", "options": null}', '272', '34×8：8×4=32写2进3，8×3=24加进位3得27，结果272。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '竖式', 1, '{"stem": "列竖式计算：230×5", "options": null}', '1150', '先算23×5=115，再在末尾添1个0，得1150。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：159+345+241", "options": null}', '745', '159+241=400，400+345=745。（凑整巧算）', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：375-158+42", "options": null}', '259', '按从左往右的顺序：375-158=217，217+42=259。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1011, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：256-56÷4", "options": null}', '242', '先算除法：56÷4=14，再算减法：256-14=242。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1010, '数学', '三年级', '递等式', 2, '{"stem": "递等式计算：317-（135-83）", "options": null}', '265', '先算括号里：135-83=52，再算317-52=265。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p176.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1026, '数学', '三年级', '应用', 2, '{"stem": "有100个苹果，每盒装6个，装了一些盒子后还剩4个。已经装了多少盒？", "options": null}', '16盒', '（100-4）÷6=96÷6=16（盒）。先算出已装走的96个，再除以每盒6个。', 'paper', '["practice", "ykl3sx", "9.6"]', '["paper_png/ykl3_sx/p177.png"]', 0);
