-- V49: ykl3sx 3.3 三角形与四边形的初步认识① + 3.4 初步认识②（书p52-55 / PDF p055-058）
-- 32 题：p055 基础9 + p056 拓展6 + p057 基础9 + p058 拓展8
-- 图意题 figure_ref 指向待裁剪图（图意待补）

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 1, '{"stem": "把下面的图形分分类，把编号填在括号里。（图意：一组平面图形按编号①～⑪排列）三角形有（　），四边形有（　），五边形有（　）。", "options": null, "figure_ref": "p055_seg1.png"}', '三角形：③⑤⑨；四边形：①②④⑧⑩⑪；五边形：⑥⑦', '三角形由3条线段围成：③⑤⑨；四边形由4条线段围成：①②④⑧⑩⑪（其中⑩⑪为长方形/正方形等特殊四边形，都是四边形）；五边形由5条线段围成：⑥⑦。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 1, '{"stem": "三角形是由（　）条线段围成的图形，有（　）条边、（　）个角。", "options": null}', '3；3；3', '三角形由3条线段首尾相接围成，有3条边、3个角、3个顶点。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 1, '{"stem": "四边形是由（　）条线段围成的图形，有（　）条边、（　）个角。", "options": null}', '4；4；4', '四边形由4条线段围成，有4条边、4个角。长方形、正方形、梯形等都是四边形。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 1, '{"stem": "长方形的对边（　），有（　）个直角。", "options": null}', '相等；4', '长方形对边相等，4个角都是直角。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 1, '{"stem": "正方形的四条边都（　），四个角都（　）。", "options": null}', '相等；相等', '正方形四条边都相等，四个角都相等（都是直角）。正方形是特殊的长方形。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '判断', 1, '{"stem": "有三个角的图形一定是三角形。", "options": null}', '×', '错。还要看是否由3条线段首尾相接围成的封闭图形；若三条线段没有围拢或有缺口，就不一定是三角形。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '判断', 1, '{"stem": "正方形、长方形都是四边形。", "options": null}', '√', '对。正方形、长方形都由4条线段围成，都是四边形。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '判断', 1, '{"stem": "长方形是特殊的正方形。", "options": null}', '×', '错。说反了：正方形是特殊的长方形（正方形满足长方形的全部特征：对边相等、4个直角，还多出四条边都相等）。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '判断', 2, '{"stem": "有两个角是直角的四边形是长方形。", "options": null}', '×', '错。反例：直角梯形也有两个直角（上下底平行、一侧腰垂直的四边形，另两个角一个锐角一个钝角），但不是长方形。判断长方形必须同时满足四个角都是直角。', 'paper', '["practice", "ykl3sx", "sec3.3"]', '["paper_png/ykl3_sx/p055.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '填空', 2, '{"stem": "数一数：下图中有（　）个三角形。（图意：由多条线段交叉组成的图形，需按大小分类数）", "options": null, "figure_ref": "p056_seg1.png"}', '8', '按从小到大的顺序数：单个小三角形4个、由2个小三角形拼成的2个、由4个小三角形拼成的2个，共4+2+2=8个。数图形要做到不重复、不遗漏。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '填空', 2, '{"stem": "数一数：下图中有（　）个长方形。（图意：由多个小长方形拼成的大长方形组合图）", "options": null, "figure_ref": "p056_seg2.png"}', '5', '按从小到大的顺序数：单个小长方形3个、由2个小长方形拼成的1个、由3个小长方形拼成的1个，共3+1+1=5个。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '作图', 3, '{"stem": "在右边的方格图上继续画，画出一个有直角的四边形。（图意：方格图中已有部分线段，在此基础上补画完整）", "options": null, "figure_ref": "p056_seg3.png"}', '答案不唯一（画出长方形或正方形均可）', '只要画出的四边形四个角中有一个（或全部）是直角即可，如沿格线画长方形或正方形。图见原卷，答案不唯一。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '作图', 3, '{"stem": "在画出的四边形上再画一条线段，把它分成一个直角三角形和一个五边形。（图意：在上题所画图形基础上操作）", "options": null, "figure_ref": "p056_seg3.png"}', '答案不唯一（参考：从四边形一个顶点向对边上一点连一条线段）', '从四边形的一个顶点向对边（不经过其他顶点）连一条线段，可把四边形分成一个三角形和一个五边形；若该三角形恰好含一个直角即为所求。答案不唯一，具体以原图为准。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1022, '数学', '三年级', '简答', 2, '{"stem": "观察七巧板，说一说七巧板中的每块板是什么形状，上面各有哪些角？（图意：一套七巧板的7块板：5块三角形板、1块正方形板、1块平行四边形板）", "options": null, "figure_ref": "p056_seg4.png"}', '七巧板由7块板组成：5块三角形板、1块正方形板、1块平行四边形板。三角形板各有1个直角和2个锐角；正方形板有4个直角；平行四边形板有2个锐角和2个钝角。', '七巧板共7块：大三角形2块、中三角形1块、小三角形2块（共5块三角形板，每块都是等腰直角三角形，有1个直角、2个锐角）、正方形板1块（4个直角）、平行四边形板1块（2个锐角、2个钝角）。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1020, '数学', '三年级', '简答', 2, '{"stem": "观察七巧板：比一比5块三角形板的各个角的大小，你有什么发现？（图意：七巧板中5块三角形板按大小排列）", "options": null, "figure_ref": "p056_seg4.png"}', '5块三角形板的角分别相等：每块都是等腰直角三角形，三个角分别是45°、45°、90°。', '5块三角形板形状相同（都是等腰直角三角形），只是大小不同，所以各个角的大小分别相等：两个锐角都是45°，直角都是90°。', 'paper', '["practice", "ykl3sx", "sec3.3", "图意待补"]', '["paper_png/ykl3_sx/p056.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '填空', 1, '{"stem": "把下面的三角形按要求分类，填编号。（图意：7个三角形按编号①～⑦排列）有一个角是直角的三角形是（　）。", "options": null, "figure_ref": "p057_seg1.png"}', '①⑦', '①⑦中都有一个直角，它们是直角三角形（直角三角形中有一个角是直角）。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '填空', 1, '{"stem": "把下面的三角形按要求分类，填编号。有一个角是钝角的三角形是（　）。", "options": null, "figure_ref": "p057_seg1.png"}', '③④', '③④中都有一个钝角，它们是钝角三角形（钝角三角形中有一个角是钝角）。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '填空', 1, '{"stem": "把下面的三角形按要求分类，填编号。三个角都是锐角的三角形是（　）。", "options": null, "figure_ref": "p057_seg1.png"}', '②⑤⑥', '②⑤⑥的三个角都是锐角，它们是锐角三角形。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 1, '{"stem": "一个三角形至少有（　）个锐角。", "options": ["A.1个", "B.2个", "C.3个", "D.4个"]}', 'B', '三角形内角和是180°：若只有1个锐角，另外2个角的和至少90°+90°=180°（等于180°时第三个角为0°，不可能），所以另外两个角不可能都是直角或钝角，三角形至少有2个锐角。选B。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 2, '{"stem": "两个大小、形状完全相同的直角三角形能拼成一个（　）。", "options": ["A.直角三角形", "B.钝角三角形", "C.锐角三角形", "D.以上都有可能"]}', 'D', '两个完全相同的直角三角形，拼法不同结果不同：沿斜边拼成长方形（含正方形）；沿直角边拼可得到等腰三角形、锐角三角形、钝角三角形或平行四边形。因此直角三角形、钝角三角形、锐角三角形都有可能，选D。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 2, '{"stem": "如图，被遮住的这个三角形一定是（　）三角形。（图意：三角形中间部分被纸片遮住，三个角都露在外面且都是锐角）", "options": ["A.锐角", "B.直角", "C.钝角", "D.以上都有可能"], "figure_ref": "p057_seg2.png"}', 'A', '图中三个角都未被遮挡，露出的三个角都是锐角，所以这个三角形一定是锐角三角形。选A。注意：若只露出一个角是无法判断的，本题三个角均可见。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '选择', 1, '{"stem": "下列选项中，（　）一定没有直角。", "options": ["A.正方形", "B.长方形", "C.钝角三角形", "D.直角三角形"]}', 'C', '钝角三角形有一个角是钝角（大于90°），其余两个角都是锐角，一定没有直角。正方形、长方形都有4个直角；直角三角形有1个直角。选C。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '选择', 2, '{"stem": "用（　）根相同的小棒可以围成一个正方形。", "options": ["A.6", "B.9", "C.10", "D.12"]}', 'D', '正方形4条边都相等，所用小棒总数必须是4的倍数。6、9、10都不是4的倍数，12=4×3，每边用3根小棒，可以围成正方形。选D。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '填空', 2, '{"stem": "数一数，填一填：图中有（　）个三角形，其中有（　）个锐角三角形，有（　）个直角三角形，有（　）个钝角三角形。（图意：多个三角形拼成的组合图形）", "options": null, "figure_ref": "p057_seg3.png"}', '10；4；4；2', '先按大小数出共10个三角形，再逐个判断每个三角形的角：锐角三角形4个、直角三角形4个、钝角三角形2个。数图形按一定顺序（从小到大、从左到右）数，避免遗漏。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p057.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '判断', 1, '{"stem": "三角形按角可以分为锐角三角形、直角三角形和钝角三角形。", "options": null}', '√', '对。按角分，三角形分为三类：三个角都是锐角的锐角三角形、有一个角是直角的直角三角形、有一个角是钝角的钝角三角形。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '判断', 1, '{"stem": "所有的直角三角形都一样大。", "options": null}', '×', '错。直角三角形只是都有一个直角，但它们的大小（边的长短）可以不同。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '判断', 2, '{"stem": "四条边都相等的四边形是正方形。", "options": null}', '×', '错。反例：菱形四条边都相等，但角不一定是直角，所以不一定是正方形。正方形还要满足四个角都是直角。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '判断', 1, '{"stem": "三个角都相等的三角形一定是锐角三角形。", "options": null}', '√', '对。三个角都相等，每个角=180°÷3=60°，都是锐角，所以一定是锐角三角形（等边三角形）。', 'paper', '["practice", "ykl3sx", "sec3.4"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '作图', 3, '{"stem": "画一条线段，将图1的三角形分成1个锐角三角形和1个钝角三角形。（图意：一个三角形，要求用一条线段分割）", "options": null, "figure_ref": "p058_seg1.png"}', '答案不唯一（参考：从三角形的一个顶点向对边作线段，使分出的两个三角形分别含钝角和三个锐角）', '从三角形一个顶点向对边连一条线段即可分成两个三角形；要使其中一个为钝角三角形、另一个为锐角三角形，需结合图1原三角形的形状选择分割点，答案不唯一。具体见图1裁剪图。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '作图', 2, '{"stem": "画一条线段，将图2的三角形分成2个直角三角形。（图意：一个三角形，用一条线段分成两个直角三角形）", "options": null, "figure_ref": "p058_seg2.png"}', '从三角形的一个顶点向对边作垂线（作高）', '过三角形一个顶点向它的对边作垂线段，垂线与对边相交，就把原三角形分成了2个直角三角形（作高法）。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1024, '数学', '三年级', '作图', 3, '{"stem": "画一条线段，将图3的三角形分成1个三角形和1个四边形。（图意：一个三角形，用一条线段分成三角形和四边形各一个）", "options": null, "figure_ref": "p058_seg3.png"}', '答案不唯一（参考：从三角形一条边上任取一点，向另一条边上的点连一条线段）', '在三角形两条边上各取一点（都不取顶点），连接这两点，就把三角形分成1个小三角形和1个四边形。答案不唯一，具体见图3裁剪图。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p058.png"]', 0);

INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 1023, '数学', '三年级', '作图', 3, '{"stem": "把一个正方形剪一刀，使它变成2个形状、大小一样的图形，你能想出几种剪法？在下面的图中表示。（图意：正方形示意图，供画出多种剪法）", "options": null, "figure_ref": "p058_seg4.png"}', '无数种（过正方形中心即两条对角线交点的任意一条直线，都能把正方形分成2个形状、大小一样的图形）', '沿两条对角线剪、沿对边中点的连线（横或竖）剪都可以；更一般地，只要剪痕是过正方形中心的一条直线，分成的两个图形就形状、大小完全一样，这样的直线有无数条。答案不唯一，画出几种即可。', 'paper', '["practice", "ykl3sx", "sec3.4", "图意待补"]', '["paper_png/ykl3_sx/p058.png"]', 0);
