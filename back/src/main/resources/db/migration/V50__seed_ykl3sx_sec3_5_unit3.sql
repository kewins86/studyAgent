-- V50: ykl3sx 3.5 小练习(4) + 单元练习3（书p56-61 / PDF p059-064）
-- 35 题：p059 基础5 + p060 拓展8 + p062 单元练习3前9 + p063 单元练习3续9 + p064 单元练习3尾4
-- 图意题 figure_ref 指向待裁剪图（图意待补）

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '选择', 1, '{"stem": "以下时刻中，钟面上的时针与分针的夹角是直角的是（　）。", "options": ["A.12时", "B.3时半", "C.6时", "D.9时"]}', 'D', '9时整：时针指向9、分针指向12，相差3大格，每大格30°，夹角90°为直角。3时半时针在3和4中间、分针指向6，夹角75°是锐角；12时两针重合夹角0°；6时两针成一条直线夹角180°。选D。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p059.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 1, '{"stem": "一个三角形中，最大的一个角是锐角，那么这个三角形是（　）三角形。", "options": ["A.直角", "B.锐角", "C.钝角", "D.无法确定"]}', 'B', '最大的角都是锐角，说明三个角全是锐角，这个三角形一定是锐角三角形。选B。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p059.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '选择', 1, '{"stem": "下列说法中正确的是（　）。", "options": ["A.四边形中只有正方形和长方形", "B.角的两边越长，角就越大", "C.正方形是特殊的四边形", "D.有锐角的三角形就是锐角三角形"]}', 'C', 'A错：四边形还包括梯形、菱形等，不止正方形和长方形；B错：角的大小与边的长短无关，只与两边张开的大小有关；C对：正方形（以及长方形、梯形等）都由4条线段围成，都是四边形，正方形是特殊的四边形；D错：任意三角形都有锐角，必须三个角都是锐角才是锐角三角形。选C。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p059.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 1, '{"stem": "任意画一个三角形，这个三角形一定有（　）。", "options": ["A.1个直角", "B.3个锐角", "C.2个锐角", "D.1个钝角"]}', 'C', '任意三角形至少有2个锐角（若只有1个锐角，另两个角都是直角或钝角，角度和就达到或超过180°，不可能组成三角形）。选C。注意不是每个三角形都有3个锐角（直角三角形、钝角三角形只有2个锐角），所以不选B。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p059.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 1, '{"stem": "想一想，填一填：把下面8个角的编号填入相应的括号。（图意：8个角按编号①～⑧排列，含锐角、直角、钝角）直角有（　）；比直角小的角有（　）；比直角大的角有（　）。", "options": null, "figure_ref": "p059_seg1.png"}', '②⑤；①③⑧；④⑥⑦', '直角是90°：②⑤；比直角小的是锐角：①③⑧；比直角大的是钝角：④⑥⑦。8个角正好分成锐角3个、直角2个、钝角3个。', 'paper', '["practice", "ykl3sx", "sec3.5", "图意待补"]', '["paper_png/ykl3_sx/p059.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '填空', 1, '{"stem": "用放大镜看角，角的大小（　）。", "options": null}', '不变', '放大镜只把角的两条边（线段）放大了，但两边张开的大小没有变，所以角的大小不变。角的大小与边的长短无关。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '填空', 1, '{"stem": "3时半，钟面上的时针与分针的夹角是一个（　）角。", "options": null}', '锐', '3时半：分针指向6，时针在3和4的正中间，时针与分针相差2.5大格，每大格30°，夹角2.5×30°=75°，小于90°，是锐角。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 1, '{"stem": "（　）是特殊的长方形。", "options": null}', '正方形', '正方形有长方形的所有特征（对边相等、四个角都是直角），还满足四条边都相等，所以正方形是特殊的长方形。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '填空', 1, '{"stem": "三角形按角分可以分为（　）、（　）和（　）。", "options": null}', '锐角三角形；直角三角形；钝角三角形', '三角形按角分类：三个角都是锐角的是锐角三角形；有一个角是直角的是直角三角形；有一个角是钝角的是钝角三角形。', 'paper', '["practice", "ykl3sx", "sec3.5"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 2, '{"stem": "数一数，填一填：图中一共有（　）个三角形，有（　）个四边形。（图意：由多个图形拼成的组合图形）", "options": null, "figure_ref": "p060_seg1.png"}', '4；6', '按从小到大、从左到右的顺序数：三角形4个；四边形6个（含正方形、长方形等）。数图形按一定顺序数，不重复、不遗漏。', 'paper', '["practice", "ykl3sx", "sec3.5", "图意待补"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 3, '{"stem": "数一数，填一填：图中一共有（　）个三角形，有（　）个四边形。（图意：多层组合图形，图形较复杂）", "options": null, "figure_ref": "p060_seg2.png"}', '8；9', '按从小到大的顺序数：三角形8个；四边形9个（注意大图形套小图形，要分层数）。数图形按一定顺序数，不重复、不遗漏。', 'paper', '["practice", "ykl3sx", "sec3.5", "图意待补"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '作图', 3, '{"stem": "在下图中画两条线段，将长方形分成一个锐角三角形、一个钝角三角形和一个直角三角形。（图意：一个长方形，用两条线段分成3个三角形）", "options": null, "figure_ref": "p060_seg3.png"}', '答案不唯一（参考：在长方形内取一点，从该点向长方形的两个相邻顶点连线，再结合另一组顶点连线分割）', '两条线段把长方形分成3个三角形，分割时注意三个三角形分别要含钝角、直角、锐角：可先过长方形一个顶点向对边作垂线得到直角三角形，再分割剩余部分。答案不唯一，具体以原图为准。', 'paper', '["practice", "ykl3sx", "sec3.5", "图意待补"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '简答', 2, '{"stem": "纸片下的三角形可能是什么三角形？为什么？（图意：三角形大部分被纸片遮住，只露出一个锐角）", "options": null, "figure_ref": "p060_seg4.png"}', '锐角三角形、直角三角形、钝角三角形都有可能。因为只露出一个锐角，另外两个角无法确定：可能都是锐角（锐角三角形），也可能有一个直角（直角三角形）或一个钝角（钝角三角形）。', '仅露出一个角（锐角）时，另两个角的和为180°减去这个锐角，可以是两个锐角、一直角一锐角或一钝角一锐角三种情况，所以三种三角形都有可能。若要确定，必须再多露出一个角。', 'paper', '["practice", "ykl3sx", "sec3.5", "图意待补"]', '["paper_png/ykl3_sx/p060.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 1, '{"stem": "观察下面的图形，把正确的编号填在括号中。（图意：一组角按编号①～⑧排列）锐角有（　）；直角有（　）；钝角有（　）。", "options": null, "figure_ref": "p062_seg1.png"}', '①④⑦；③⑥；②⑤⑧', '按角的大小分类：锐角（小于直角）①④⑦；直角③⑥；钝角（大于直角）②⑤⑧。8个角正好分成锐角3个、直角2个、钝角3个。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 2, '{"stem": "根据要求填表：数一数下面每个图形中锐角、直角、钝角的个数，填入表中。（图意：3个图形各占表格一行，需对照裁剪图确认图形形状与行序）图形一：锐角（　）个、直角（　）个、钝角（　）个；图形二：锐角（　）个、直角（　）个、钝角（　）个；图形三：锐角（　）个、直角（　）个、钝角（　）个。", "options": null, "figure_ref": "p062_seg2.png"}', '第1行图形：1、2、1；第2行图形：2、1、0；第3行图形：1、2、2', '三个图形的角数分布：第1行图形有1个锐角、2个直角、1个钝角（4个角，是直角梯形类）；第2行图形有2个锐角、1个直角、0个钝角（直角三角形：三角形内角和180°，2个锐角+1个直角）；第3行图形有1个锐角、2个直角、2个钝角（5个角，五边形类）。每行角数之和等于该图形的角的个数，可用来检验。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 2, '{"stem": "数一数：图中三角形有（　）个，四边形有（　）个。（图意：多种图形混合的组合图形）", "options": null, "figure_ref": "p062_seg3.png"}', '7；8', '按顺序数：三角形7个，四边形8个。数的时候可先按图形种类分开数，再按大小分层数，做到不重复、不遗漏。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '判断', 1, '{"stem": "角的边越长说明这个角越大，边越短角就越小。", "options": null}', '×', '错。角的大小与边的长短无关，只与两边张开的大小有关。边画得很长但张开很小，角仍然很小。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '判断', 1, '{"stem": "窗上的直角和三角尺上的直角一样大。", "options": null}', '√', '对。所有的直角都一样大，都是90°。窗框上的直角虽然边更长，但大小与三角尺上的直角相同。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '判断', 1, '{"stem": "直角三角形只有一个直角。", "options": null}', '√', '对。三角形内角和是180°，若有两个直角就超过180°了，所以直角三角形只有一个直角，另外两个角都是锐角。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '判断', 1, '{"stem": "三个角相等的三角形一定是锐角三角形。", "options": null}', '√', '对。三个角相等，每个角是180°÷3=60°，都是锐角，所以一定是锐角三角形。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '判断', 1, '{"stem": "比钝角小的角是直角。", "options": null}', '×', '错。比钝角（大于90°）小的角，除了直角（90°），还有锐角（小于90°），所以说法不完整，是错的。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p062.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '作图', 2, '{"stem": "在格点图上分别画出一个钝角三角形、一个正方形和一个长方形。（图意：格点图，供画3个图形）", "options": null, "figure_ref": "p063_seg1.png"}', '答案不唯一（参考：钝角三角形含一个大于90°的角；正方形、长方形沿格线画）', '钝角三角形要有一个钝角（大于90°的角）；正方形四条边相等且四个角都是直角；长方形对边相等、四个角都是直角。在格点图上沿格线（或连接格点）画出即可，答案不唯一。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '作图', 2, '{"stem": "按要求在下面的图形中分别再画一条线段：增加1个直角和1个锐角。（图意：一个折线形多边形，画一条线段后角数增加，新角为1个直角和1个锐角）", "options": null, "figure_ref": "p063_seg2.png"}', '答案不唯一（参考：从图形的一个顶点向对边作垂线段，可同时产生1个直角；再配合原图形形状可得到1个锐角）', '从图形内部的一个顶点向对边作垂线，会形成直角；结合原图形的角，使新增的角分别为1个直角和1个锐角。答案不唯一，具体以原图为准。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '作图', 2, '{"stem": "按要求在下面的图形中分别再画一条线段：增加2个直角。（图意：一个三角形，画一条线段后增加2个直角）", "options": null, "figure_ref": "p063_seg3.png"}', '过三角形的一个顶点向对边作垂线（作高）', '从三角形一个顶点向对边作垂线段，垂足在对边上，垂线两侧各形成一个直角，正好增加2个直角，同时把三角形分成2个直角三角形。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '填空', 1, '{"stem": "三角尺上每一个角都有（　）个顶点，（　）条边。每把三角尺上都有（　）个直角，（　）个锐角。（图意：一把三角尺）", "options": null, "figure_ref": "p063_seg4.png"}', '1；2；1；2', '每个角都有1个顶点、2条边。三角尺是三角形，有3个角：其中1个是直角，另外2个都是锐角（两把三角尺分别是45°、45°、90°和30°、60°、90°）。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 1, '{"stem": "直角比锐角（　），但比钝角（　）。", "options": null}', '大；小', '直角是90°，锐角小于90°，钝角大于90°。所以直角比锐角大，比钝角小。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '填空', 2, '{"stem": "用两把完全相同的三角尺按如下的方式拼角，标出的分别是什么角？（图意：3个拼角图，标出的角从左到右依次为（　）、（　）、（　））", "options": null, "figure_ref": "p063_seg5.png"}', '直角；锐角；钝角', '两把三角尺拼在一起：标出的角依次为直角（两把三角尺的直角拼合或单独成直角）、锐角、钝角。图序以原图为准（本答案按参考答案顺序录入，拼角图形待裁剪复核）。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 2, '{"stem": "下面的图形是由（　）条线段围成的，有（　）个角。（图意：一个五边形图形）", "options": null, "figure_ref": "p063_seg6.png"}', '5；5', '图形由5条线段首尾相接围成，是五边形，所以有5条边、5个角。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '选择', 2, '{"stem": "下面的图形中有（　）个直角。（图意：由线段组成的组合图形，需数出其中直角的个数）", "options": ["A.3", "B.4", "C.5", "D.6"], "figure_ref": "p063_seg7.png"}', 'C', '在组合图形中按位置逐个找直角：共5个直角。数的时候可以给每个直角做标记，避免重复或遗漏。选C。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '选择', 2, '{"stem": "一个正方形剪去一个角后，还剩下（　）个角。", "options": ["A.3", "B.4", "C.5", "D.不能确定"]}', 'D', '剪法不同结果不同：沿对角线剪，剩3个角（三角形）；过顶点向对边剪，剩4个角；不过顶点剪去一个小角，剩5个角。所以不能确定，选D。', 'paper', '["practice", "ykl3sx", "unit3"]', '["paper_png/ykl3_sx/p063.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '选择', 2, '{"stem": "将一张圆形纸片如图对折三次，得到的角是（　）。（图意：圆形纸片对折3次的示意图）", "options": ["A.锐角", "B.直角", "C.钝角", "D.不能确定"], "figure_ref": "p064_seg1.png"}', 'A', '一张圆形纸片对折1次得到180°的角（半圆），对折2次得到90°（直角），对折3次得到45°的角。45°小于90°，是锐角。选A。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p064.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '选择', 1, '{"stem": "蜂巢是由一个个小房间组合在一起的，每个小房间表面可以近似地看作六边形（如图所示），这样的巢不但节省材料，而且结实坚固。我们发现像这样的六边形，它的角都是（　）。（图意：蜂巢六边形示意图）", "options": ["A.锐角", "B.直角", "C.钝角", "D.不能确定"], "figure_ref": "p064_seg2.png"}', 'C', '正六边形的每个内角都是120°，大于90°，是钝角。所以蜂巢小房间的角都是钝角。选C。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p064.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '简答', 2, '{"stem": "小华画了一个角，小海将角的两边延长后跟小华说：这个角变大了。你觉得小海的说法对吗？为什么？（图意：小海延长角的两边）", "options": null, "figure_ref": "p064_seg3.png"}', '不对。角的大小与边的长短无关，只与两边张开的大小有关。把角的两边延长，角的两边张开的大小没有变，所以角的大小不变。', '角的大小由两边张开程度决定。延长边只让边变长，没有改变两边张开的大小，角的大小不变。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p064.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1021, '数学', '三年级', '作图', 3, '{"stem": "剪一剪（画线表示剪的位置）：怎样剪正方形纸片，使剪后剩下的图形分别剩下1个直角、2个直角、3个直角？（图意：3个正方形，分别标注剩一个直角、剩两个直角、剩三个直角）", "options": null, "figure_ref": "p064_seg4.png"}', '答案不唯一（参考：剩下1个直角——剪成直角梯形；剩下2个直角——剪成直角三角形或保持两个直角；剩下3个直角——剪去一个小角使五边形保留3个直角等）', '在3个正方形上分别画一条剪线：使剩余图形含1个直角、2个直角、3个直角。剪法多样，答案不唯一。例：把正方形剪成两个直角梯形，其中一个可含1个直角或2个直角；从角上斜剪一小块，剩余五边形可含3个直角。具体画法以原图标注为准。', 'paper', '["practice", "ykl3sx", "unit3", "图意待补"]', '["paper_png/ykl3_sx/p064.png"]', 0);
