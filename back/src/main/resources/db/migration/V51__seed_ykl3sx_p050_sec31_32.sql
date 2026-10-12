-- V51: ykl3sx 补录 p050(单元练习2 题7(3)(4)(5), V48漏录) + 3.1角的初步认识①(p052) + 3.2角的初步认识②(p054 判断题文本题)
-- 共 11 题。答案依据: ans_194/ans_195 答案页 OCR + 数学自证。
-- 图意题(拼角/数角) figure_ref 指向待裁剪图, tag 图意待补。

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1015, '数学', '三年级', '应用题', 2, '{"stem": "彩虹小学的教学楼有5层，每层有8间教室，现在准备为每间教室装6盏护眼灯。学校购买了250盏灯，够装所有教室吗？", "options": null}', '够', '5×8×6=40×6=240（盏），240<250，所以够装所有教室。', 'paper', '["practice", "ykl3sx", "unit2"]', '["paper_png/ykl3_sx/p050.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1019, '数学', '三年级', '应用题', 3, '{"stem": "假期里，小华和7个小伙伴一起去东方绿舟玩。宾馆双人房（一间房最多住2人）每晚要398元，他们住2个晚上，大约要准备多少元房费？", "options": null}', '约3200元', '一共1+7=8人，双人房每间最多住2人，需8÷2=4（间）；把398元看作400元，400×4×2=3200（元），所以大约要准备3200元。', 'paper', '["practice", "ykl3sx", "unit2"]', '["paper_png/ykl3_sx/p050.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1011, '数学', '三年级', '应用题', 2, '{"stem": "假期里，小华和7个小伙伴一起去东方绿舟玩。第二天去游湖，合租一条大船。如果每人出9元，则多出了2元，一条大船的租金是多少元？", "options": null}', '70元', '一共1+7=8人，每人出9元共9×8=72（元），多出了2元，所以大船租金=72−2=70（元）。', 'paper', '["practice", "ykl3sx", "unit2"]', '["paper_png/ykl3_sx/p050.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1019, '数学', '三年级', '应用题', 3, '{"stem": "某剧场一共有280个座位。三年级有6个班，每班都有38人，能不能全部坐下？如果剧场连续放映4场，能不能卖出1200张票？", "options": null}', '能全部坐下；不能卖出1200张票', '把38看作40，40×6=240（人），240<280，所以能全部坐下；280×4=1120（张），1120<1200，所以不能卖出1200张票。', 'paper', '["practice", "ykl3sx", "unit2"]', '["paper_png/ykl3_sx/p050.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '选择', 2, '{"stem": "在下面图形中，（　）一定没有锐角。", "options": ["A.直角三角形", "B.钝角三角形", "C.四边形", "D.长方形"]}', 'D', '直角三角形和钝角三角形都至少有两个锐角，不可能没有锐角；一般四边形不一定没有锐角（如梯形常含有锐角），也不能保证；长方形四个角都是直角，一定没有锐角。选D。', 'paper', '["practice", "ykl3sx", "sec3.1"]', '["paper_png/ykl3_sx/p052.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '填空', 1, '{"stem": "每个角都有（　）个顶点和（　）条直边。", "options": null}', '1；2', '角是由一个顶点和两条直边组成的图形，所以每个角有1个顶点、2条直边。', 'paper', '["practice", "ykl3sx", "sec3.1"]', '["paper_png/ykl3_sx/p052.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 2, '{"stem": "钟面上的时针和分针的夹角在下列时刻分别是什么角？2时（　）、2时半（　）、3时（　）、3时半（　）、4时（　）、4时半（　）、5时（　）、5时半（　）。", "options": null}', '锐；钝；直；锐；钝；锐；钝；锐', '钟面上相邻两个数字间是30°。2时夹角60°是锐角；2时半夹角105°是钝角；3时夹角90°是直角；3时半夹角75°是锐角；4时夹角120°是钝角；4时半夹角45°是锐角；5时夹角150°是钝角；5时半夹角15°是锐角。', 'paper', '["practice", "ykl3sx", "sec3.1"]', '["paper_png/ykl3_sx/p052.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 1, '{"stem": "右图中，两把三角尺拼出的角是（　）角。（图意：两把三角尺拼在一起组成的角，见原题图）", "options": null, "figure_ref": "p052_seg_angle.png"}', '钝', '三角尺上的角有30°、45°、60°、90°，两把三角尺按图拼出的角大于90°小于180°，是钝角。（以原题图拼法为准）', 'paper', '["practice", "ykl3sx", "sec3.1", "图意待补"]', '["paper_png/ykl3_sx/p052.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '填空', 3, '{"stem": "数一数，图中一共有（　）个角。（图意：从一点出发的多条射线组成的角，见原题图）", "options": null, "figure_ref": "p052_seg_count.png"}', '10', '从一点引出5条射线，任取两条射线组成一个角，共4+3+2+1=10（个）角。数角时按顺序数，做到不重复、不遗漏。', 'paper', '["practice", "ykl3sx", "sec3.1", "图意待补"]', '["paper_png/ykl3_sx/p052.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '判断', 1, '{"stem": "锐角比直角小，钝角比直角大。（　）", "options": null}', '√', '锐角小于90°，直角等于90°，钝角大于90°，所以锐角比直角小、钝角比直角大的说法正确。', 'paper', '["practice", "ykl3sx", "sec3.2"]', '["paper_png/ykl3_sx/p054.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '判断', 1, '{"stem": "角的两边叉开得越大，角就越大。（　）", "options": null}', '√', '角的大小与两边叉开的大小有关：叉开得越大，角就越大；角的大小与边的长短无关。说法正确。', 'paper', '["practice", "ykl3sx", "sec3.2"]', '["paper_png/ykl3_sx/p054.png"]', 0);
