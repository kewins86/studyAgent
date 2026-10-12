-- V32: 一课一练(华师大·三年级数学第一学期) 1.2 两步四则运算②（书p3-4 / PDF p006-007）
-- 来源: 本地 Vision OCR(坐标重排还原双栏) + 书末附录参考答案(p186) 交叉校验
-- OCR 的 ÷→-/+、×→X、丢括号 已按答案+运算规则逐题反推；4(1) B 选项括号为反推补全
-- 挂点: 1009 乘除同级 / 1010 加减同级 / 1011 先乘除后加减 / 1013 两步应用
-- 共 21 题，全部真实答案

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1009, '数学', '三年级', '计算', 1, '{"stem": "4×6÷3=", "options": null}', '8', '同级乘除按从左往右：4×6=24，24÷3=8。', 'paper', '["practice", "VG-G3-1-1", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1010, '数学', '三年级', '计算', 1, '{"stem": "45−19+8=", "options": null}', '34', '同级加减按从左往右：45−19=26，26+8=34。', 'paper', '["practice", "VG-G3-1-2", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1009, '数学', '三年级', '计算', 1, '{"stem": "2×4×7=", "options": null}', '56', '同级乘除按从左往右：2×4=8，8×7=56。', 'paper', '["practice", "VG-G3-1-1", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 1, '{"stem": "63÷7+86=", "options": null}', '95', '先算除法：63÷7=9，再算 9+86=95。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 1, '{"stem": "40÷5+30=", "options": null}', '38', '先算除法：40÷5=8，再算 8+30=38。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1010, '数学', '三年级', '计算', 1, '{"stem": "27−9+6=", "options": null}', '24', '同级加减按从左往右：27−9=18，18+6=24。', 'paper', '["practice", "VG-G3-1-2", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1010, '数学', '三年级', '计算', 1, '{"stem": "61+20−35=", "options": null}', '46', '同级加减按从左往右：61+20=81，81−35=46。', 'paper', '["practice", "VG-G3-1-2", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1009, '数学', '三年级', '计算', 1, '{"stem": "72÷8×6=", "options": null}', '54', '同级乘除按从左往右：72÷8=9，9×6=54。', 'paper', '["practice", "VG-G3-1-1", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1009, '数学', '三年级', '计算', 1, '{"stem": "64÷8÷8=", "options": null}', '1', '同级乘除按从左往右：64÷8=8，8÷8=1。', 'paper', '["practice", "VG-G3-1-1", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1010, '数学', '三年级', '填空', 2, '{"stem": "在○里填上合适的运算符号，使等式成立，并写出计算过程：45○9○2=52。先算（ ），再算（ ）。", "options": null}', '45+9−2=52；先算 45+9=54，再算 54−2=52', '同级加减按从左往右：先算 45+9=54，再算 54−2=52，等式成立。', 'paper', '["practice", "VG-G3-1-2", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '填空', 2, '{"stem": "在○里填上合适的运算符号，使等式成立，并写出计算过程：45○9○2=7。先算（ ），再算（ ）。", "options": null}', '45÷9+2=7；先算 45÷9=5，再算 5+2=7', '先算除法 45÷9=5（先乘除后加减），再算 5+2=7，等式成立。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：45÷5+24", "options": null}', '33', '先算除法：45÷5=9，再算 9+24=33。递等式：45÷5+24=9+24=33。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：15−48÷8", "options": null}', '9', '先算除法：48÷8=6，再算 15−6=9。递等式：15−48÷8=15−6=9。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：20+9×9", "options": null}', '101', '先算乘法：9×9=81，再算 20+81=101。递等式：20+9×9=20+81=101。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：86−6×9", "options": null}', '32', '先算乘法：6×9=54，再算 86−54=32。递等式：86−6×9=86−54=32。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：72÷8−9", "options": null}', '0', '先算除法：72÷8=9，再算 9−9=0。递等式：72÷8−9=9−9=0。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '计算', 2, '{"stem": "用递等式计算：54+3×5", "options": null}', '69', '先算乘法：3×5=15，再算 54+15=69。递等式：54+3×5=54+15=69。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '选择', 2, '{"stem": "按四则运算的顺序，下列算式中，先计算“8−4”的是（ ）。A. 6×8−4  B. 6×(8−4)  C. 64÷8−4  D. 64÷8÷4", "options": null}', 'B', 'B 项带小括号，要先算括号里的 8−4；A 先算 6×8，C 先算 64÷8，D 按从左往右先算 64÷8。（注：B 选项括号由题干“先算 8−4”+答案 B 反推，OCR 原图括号不明显）', 'paper', '["practice", "VG-G3-1-4", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '选择', 2, '{"stem": "下列4个小伙伴计算的步骤及结果正确的是（ ）。A. 349−27+73=349−100=249  B. 3+5×2=8×2=16  C. 45−15÷5=30÷5=6  D. 75+25÷5=75+5=80", "options": null}', 'D', 'A 错在同级运算应从左往右：349−27=322，322+73=395；B、C 错在应先乘除后加减：B 应 3+10=13，C 应 45−3=42；D 先算 25÷5=5，75+5=80，正确。', 'paper', '["practice", "VG-G3-1-3", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1013, '数学', '三年级', '应用题', 2, '{"stem": "小华到商场买了5个乒乓球和1块乒乓球拍，一个乒乓球6元，小华共付了100元。问：一块乒乓球拍多少钱？", "options": null}', '70元', '先算 5 个乒乓球的钱：5×6=30（元）；拍子价钱=总价−乒乓球钱：100−30=70（元）。综合算式：100−5×6=100−30=70。', 'paper', '["practice", "VG-G3-1-5", "ykl3sx", "1.2"]', NULL, 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1013, '数学', '三年级', '应用题', 3, '{"stem": "合唱队有38人去少年宫参加演出。轿车每辆坐4人，商务车每辆坐6人。怎样安排才能使车辆没有空位？（两种车辆都要有，写出所有可能）", "options": null}', '三种方案：轿车2辆+商务车5辆；轿车5辆+商务车3辆；轿车8辆+商务车1辆', '设轿车 a 辆、商务车 b 辆，4a+6b=38。试商：b=1 时 a=8，4×8+6×1=38；b=3 时 a=5，4×5+6×3=38；b=5 时 a=2，4×2+6×5=38。共三种（b=2、4、6 时 4a 不为整数或无解）。', 'paper', '["practice", "VG-G3-1-5", "ykl3sx", "1.2"]', NULL, 0);
