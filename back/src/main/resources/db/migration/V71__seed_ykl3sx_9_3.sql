-- ykl3sx 一课一练(华师大) 三上数学 节:9.3 练习3 共6题 (确定题批次; 册165-166 = p168-169)
-- 来源: p168/p169 OCR + ans_214 9.3段
-- 锚证: 题2(1)答案D: 2024下半年=184天(7-12月 62+61+61=184; 上半年=182=B → D唯一确定下半年)
--       题2(2)答案C: 62天两月=7月8月(31+31=62); 若题干61则B/D两可 → 题干必为62(OCR 62→61误读被数学排除)
--       题1(5)=16:30: 24时记时法, 若上午4:30则=4:30 → 必为下午4:30
--       题1(2)=365 28 366 29: 平闰对比四空常识填空(2024闰年表后衔接)
--       题4(1): p169面"(1) 2025年是平年吗?" + 答案365÷7=52周…1天 → 2025全年365天=52周零1天
--       题4(3): p169面"108个 3个月" + 答案108÷3=36(个) 432(个) → 平均每月36个 照这样全年432个
-- 未录(面缺/多解): 题1(1)2024年月历表12值(视觉表)、题1(3)2020/2028闰年多选填、(4)62、(6)9 21:00(跨天时刻)、题2(3)CD(4)B、题3判断4、题4(2)(4)、题5 → 问题清单
-- node分布: 1036=2(下半年天数/62天两月), 1035=1(下午4:30→16:30), 1037=2(平闰四空/2025年52周余1), 1029=1(108÷3照这样计算)
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1036, '数学', '三年级', '选择', 2, '{"stem": "2024年下半年一共有（ ）天。", "options": "A.181天 B.182天 C.183天 D.184天"}', 'D', '2024年下半年是7~12月：31+31+30+31+30+31=184（天），选D。（若算上半年则是182天）', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p168.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1036, '数学', '三年级', '选择', 1, '{"stem": "下面两个月一共有62天的是（ ）。", "options": "A.3月和4月 B.5月和6月 C.7月和8月 D.9月和10月"}', 'C', '7月和8月都是大月，31+31=62（天）。A是31+30=61，B是31+30=61，D是30+31=61。', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p168.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1035, '数学', '三年级', '填空', 1, '{"stem": "用24时记时法表示：下午4时30分是（ ）。", "options": null}', '16:30', '下午4时30分即12时制4:30加12小时，为16时30分，记作16:30。', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p168.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1037, '数学', '三年级', '填空', 1, '{"stem": "平年全年有（ ）天，二月有（ ）天；闰年全年有（ ）天，二月有（ ）天。", "options": null}', '365、28、366、29', '平年365天、二月28天；闰年366天、二月29天。四年一闰，闰年二月多1天。', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p168.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1037, '数学', '三年级', '应用', 2, '{"stem": "2025年是平年，全年有多少天？是几个星期零几天？", "options": null}', '365天；52个星期零1天', '平年全年365天。365÷7=52（周）……1（天），所以是52个星期零1天。', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p169.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1029, '数学', '三年级', '应用', 2, '{"stem": "某工厂前3个月共生产108个零件。照这样计算：（1）平均每月生产多少个？（2）全年能生产多少个？", "options": null}', '（1）36个（2）432个', '（1）108÷3=36（个）；（2）36×12=432（个）。', 'paper', '["practice", "ykl3sx", "9.3"]', '["paper_png/ykl3_sx/p169.png"]', 0);
