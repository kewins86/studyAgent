-- ============================================
-- V12: 种子数据 — 沪教版（五四学制）数学 1/2/4/5 年级
-- 静态章节树：level 1=学科根 2=单元 3=知识点
-- parent_id 用子查询定位，不硬编码 AUTO_INCREMENT id
-- ============================================

-- 一年级 数学根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '数学', '一年级', NULL, '一年级数学（沪教版·五四学制）', 1, 0);

-- 一年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '我是小学生', '我是小学生', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '10 以内的数', '10 以内的数', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '10 以内数的加减法', '10 以内数的加减法', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '20 以内的数', '20 以内的数', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '20 以内数的加减法（一）', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '认识图形', '认识图形', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND level=1) AS _kn), '数学', '一年级', '复习', '复习', 2, 7);

-- 一年级 知识点（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='我是小学生' AND level=2) AS _kn), '数学', '一年级', '我是小学生', '数一数', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='我是小学生' AND level=2) AS _kn), '数学', '一年级', '我是小学生', '比多少', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='我是小学生' AND level=2) AS _kn), '数学', '一年级', '我是小学生', '认识位置（上下、前后、左右）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '1~5 的认识', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '0 的认识', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '6~9 的认识', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '10 的认识', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '几和第几', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内的数' AND level=2) AS _kn), '数学', '一年级', '10 以内的数', '比大小', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '加法的初步认识', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '减法的初步认识', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '5 以内加减法', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '有关 0 的加减法', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '6~10 加减法', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '连加、连减', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='10 以内数的加减法' AND level=2) AS _kn), '数学', '一年级', '10 以内数的加减法', '加减混合', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内的数' AND level=2) AS _kn), '数学', '一年级', '20 以内的数', '11~20 各数的认识', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内的数' AND level=2) AS _kn), '数学', '一年级', '20 以内的数', '个位与十位', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内的数' AND level=2) AS _kn), '数学', '一年级', '20 以内的数', '20 以内数的顺序与大小', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '20 以内不进位加法', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '20 以内不退位减法', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '9 加几', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '8、7、6 加几', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '十几减 9', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='20 以内数的加减法（一）' AND level=2) AS _kn), '数学', '一年级', '20 以内数的加减法（一）', '十几减几', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='认识图形' AND level=2) AS _kn), '数学', '一年级', '认识图形', '认识立体图形（长方体、正方体、圆柱、球）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='认识图形' AND level=2) AS _kn), '数学', '一年级', '认识图形', '认识平面图形（长方形、正方形、三角形、圆）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='认识图形' AND level=2) AS _kn), '数学', '一年级', '认识图形', '图形的拼搭', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='一年级' AND name='复习' AND level=2) AS _kn), '数学', '一年级', '复习', '整理与复习', 3, 1);

-- 二年级 数学根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '数学', '二年级', NULL, '二年级数学（沪教版·五四学制）', 1, 0);

-- 二年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1) AS _kn), '数学', '二年级', '我的学校我的家', '我的学校我的家', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '100 以内数的加减法（二）', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1) AS _kn), '数学', '二年级', '表内乘法', '表内乘法', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1) AS _kn), '数学', '二年级', '欢乐购物街', '欢乐购物街', 2, 4);

-- 二年级 知识点（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='我的学校我的家' AND level=2) AS _kn), '数学', '二年级', '我的学校我的家', '两位数加减法复习', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='我的学校我的家' AND level=2) AS _kn), '数学', '二年级', '我的学校我的家', '长度单位（厘米、米）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='我的学校我的家' AND level=2) AS _kn), '数学', '二年级', '我的学校我的家', '线段的认识', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='我的学校我的家' AND level=2) AS _kn), '数学', '二年级', '我的学校我的家', '方向与位置（东南西北）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='我的学校我的家' AND level=2) AS _kn), '数学', '二年级', '我的学校我的家', '路线与方位', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '两位数加两位数（不进位）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '两位数加两位数（进位）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '两位数减两位数（不退位）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '两位数减两位数（退位）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '连加、连减', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '加减混合', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='100 以内数的加减法（二）' AND level=2) AS _kn), '数学', '二年级', '100 以内数的加减法（二）', '求比一个数多（少）几', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '乘法的初步认识', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '5 的乘法', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '2、4 的乘法', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '3 的乘法', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '乘加、乘减', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '6 的乘法', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '7、8、9 的乘法', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='表内乘法' AND level=2) AS _kn), '数学', '二年级', '表内乘法', '乘法口诀的应用', 3, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='欢乐购物街' AND level=2) AS _kn), '数学', '二年级', '欢乐购物街', '认识人民币', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='欢乐购物街' AND level=2) AS _kn), '数学', '二年级', '欢乐购物街', '人民币的换算', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND name='欢乐购物街' AND level=2) AS _kn), '数学', '二年级', '欢乐购物街', '简单的购物问题', 3, 3);

-- 四年级 数学根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '数学', '四年级', NULL, '四年级数学（沪教版·五四学制）', 1, 0);

-- 四年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '大数的认识与改写', '大数的认识与改写', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '整数的四则运算与应用题', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '运算关系与运算律', '运算关系与运算律', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '四面八方的学问', '四面八方的学问', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '度量衡的故事', '度量衡的故事', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '分数的初步认识', '分数的初步认识', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '线与角', '线与角', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '数学广场', '数学广场', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND level=1) AS _kn), '数学', '四年级', '复习', '复习', 2, 9);

-- 四年级 知识点（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='大数的认识与改写' AND level=2) AS _kn), '数学', '四年级', '大数的认识与改写', '认识计数单位（万、亿）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='大数的认识与改写' AND level=2) AS _kn), '数学', '四年级', '大数的认识与改写', '大数的读法与写法', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='大数的认识与改写' AND level=2) AS _kn), '数学', '四年级', '大数的认识与改写', '大数的改写（万、亿）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='大数的认识与改写' AND level=2) AS _kn), '数学', '四年级', '大数的认识与改写', '四舍五入求近似数', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='大数的认识与改写' AND level=2) AS _kn), '数学', '四年级', '大数的认识与改写', '大数的大小比较', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '加法与减法的运算关系', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '乘法与除法的运算关系', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '两、三步计算式题', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '文字计算题', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '整数四则混合运算', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='整数的四则运算与应用题' AND level=2) AS _kn), '数学', '四年级', '整数的四则运算与应用题', '整数应用题（数量关系）', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='运算关系与运算律' AND level=2) AS _kn), '数学', '四年级', '运算关系与运算律', '加法交换律与结合律', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='运算关系与运算律' AND level=2) AS _kn), '数学', '四年级', '运算关系与运算律', '乘法交换律与结合律', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='运算关系与运算律' AND level=2) AS _kn), '数学', '四年级', '运算关系与运算律', '乘法分配律', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='运算关系与运算律' AND level=2) AS _kn), '数学', '四年级', '运算关系与运算律', '运算律的简便计算', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='四面八方的学问' AND level=2) AS _kn), '数学', '四年级', '四面八方的学问', '认识方向与位置', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='四面八方的学问' AND level=2) AS _kn), '数学', '四年级', '四面八方的学问', '认识平面图', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='四面八方的学问' AND level=2) AS _kn), '数学', '四年级', '四面八方的学问', '描述路线', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='度量衡的故事' AND level=2) AS _kn), '数学', '四年级', '度量衡的故事', '质量单位（克、千克、吨）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='度量衡的故事' AND level=2) AS _kn), '数学', '四年级', '度量衡的故事', '质量单位换算', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='度量衡的故事' AND level=2) AS _kn), '数学', '四年级', '度量衡的故事', '容量单位（升、毫升）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='度量衡的故事' AND level=2) AS _kn), '数学', '四年级', '度量衡的故事', '容量单位换算', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='分数的初步认识' AND level=2) AS _kn), '数学', '四年级', '分数的初步认识', '分数的意义（几分之一）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='分数的初步认识' AND level=2) AS _kn), '数学', '四年级', '分数的初步认识', '几分之几', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='分数的初步认识' AND level=2) AS _kn), '数学', '四年级', '分数的初步认识', '分数各部分的名称', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='分数的初步认识' AND level=2) AS _kn), '数学', '四年级', '分数的初步认识', '同分母分数加减法', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='分数的初步认识' AND level=2) AS _kn), '数学', '四年级', '分数的初步认识', '分数的大小比较', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='线与角' AND level=2) AS _kn), '数学', '四年级', '线与角', '线段、射线、直线', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='线与角' AND level=2) AS _kn), '数学', '四年级', '线与角', '角的认识', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='线与角' AND level=2) AS _kn), '数学', '四年级', '线与角', '用量角器量角', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='线与角' AND level=2) AS _kn), '数学', '四年级', '线与角', '角的分类（锐、直、钝、平、周）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='线与角' AND level=2) AS _kn), '数学', '四年级', '线与角', '画角', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='数学广场' AND level=2) AS _kn), '数学', '四年级', '数学广场', '数射线', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='数学广场' AND level=2) AS _kn), '数学', '四年级', '数学广场', '编码（邮政编码、身份证）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='数学广场' AND level=2) AS _kn), '数学', '四年级', '数学广场', '合理安排（统筹）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='四年级' AND name='复习' AND level=2) AS _kn), '数学', '四年级', '复习', '整理与复习', 3, 1);

-- 五年级 数学根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '数学', '五年级', NULL, '五年级数学（沪教版·五四学制）', 1, 0);

-- 五年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '小数的乘法与除法', '小数的乘法与除法', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '小数的应用', '小数的应用', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '平均数', '平均数', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '制订旅行方案', '制订旅行方案', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '面积的计算', '面积的计算', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '课间体育活动', '课间体育活动', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '因数与倍数', '因数与倍数', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '数学广场', '数学广场', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND level=1) AS _kn), '数学', '五年级', '复习', '复习', 2, 9);

-- 五年级 知识点（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '小数乘整数', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '小数乘小数', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '积的近似数', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '小数除以整数', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '一个数除以小数', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '循环小数', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的乘法与除法' AND level=2) AS _kn), '数学', '五年级', '小数的乘法与除法', '小数四则混合运算', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的应用' AND level=2) AS _kn), '数学', '五年级', '小数的应用', '小数乘除法的实际问题', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的应用' AND level=2) AS _kn), '数学', '五年级', '小数的应用', '用近似数解决问题（进一法、去尾法）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='小数的应用' AND level=2) AS _kn), '数学', '五年级', '小数的应用', '简易方程（列方程解应用题）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='平均数' AND level=2) AS _kn), '数学', '五年级', '平均数', '平均数的意义', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='平均数' AND level=2) AS _kn), '数学', '五年级', '平均数', '平均数的计算', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='平均数' AND level=2) AS _kn), '数学', '五年级', '平均数', '平均数的应用', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='制订旅行方案' AND level=2) AS _kn), '数学', '五年级', '制订旅行方案', '行程问题', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='制订旅行方案' AND level=2) AS _kn), '数学', '五年级', '制订旅行方案', '方案设计与优化', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='面积的计算' AND level=2) AS _kn), '数学', '五年级', '面积的计算', '平行四边形的面积', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='面积的计算' AND level=2) AS _kn), '数学', '五年级', '面积的计算', '三角形的面积', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='面积的计算' AND level=2) AS _kn), '数学', '五年级', '面积的计算', '梯形的面积', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='面积的计算' AND level=2) AS _kn), '数学', '五年级', '面积的计算', '组合图形的面积', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='面积的计算' AND level=2) AS _kn), '数学', '五年级', '面积的计算', '公顷与平方千米', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='课间体育活动' AND level=2) AS _kn), '数学', '五年级', '课间体育活动', '折线统计图', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='课间体育活动' AND level=2) AS _kn), '数学', '五年级', '课间体育活动', '数据的收集与整理', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='因数与倍数' AND level=2) AS _kn), '数学', '五年级', '因数与倍数', '因数和倍数', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='因数与倍数' AND level=2) AS _kn), '数学', '五年级', '因数与倍数', '2、5、3 的倍数特征', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='因数与倍数' AND level=2) AS _kn), '数学', '五年级', '因数与倍数', '奇数与偶数', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='因数与倍数' AND level=2) AS _kn), '数学', '五年级', '因数与倍数', '质数与合数', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='因数与倍数' AND level=2) AS _kn), '数学', '五年级', '因数与倍数', '公因数与公倍数', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='数学广场' AND level=2) AS _kn), '数学', '五年级', '数学广场', '密铺', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='数学广场' AND level=2) AS _kn), '数学', '五年级', '数学广场', '找规律', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='数学广场' AND level=2) AS _kn), '数学', '五年级', '数学广场', '编码', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='五年级' AND name='复习' AND level=2) AS _kn), '数学', '五年级', '复习', '整理与复习', 3, 1);

-- 统计：4 个年级，单元 29 个，知识点 119 个
