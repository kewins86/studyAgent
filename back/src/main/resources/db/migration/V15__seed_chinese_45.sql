-- ============================================
-- V15: 种子数据 — 部编版（五四学制）语文 4/5 年级（扫描版 OCR + 标准大纲校正）
-- 静态章节树：level 1=学科根 2=单元 3=课文/习作/语文园地
-- parent_id 用子查询定位，不硬编码 AUTO_INCREMENT id
-- ============================================

-- 四年级 语文根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '语文', '四年级', NULL, '四年级语文（部编版）', 1, 0);

-- 四年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第一单元', '第一单元', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第二单元', '第二单元', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第三单元', '第三单元', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第四单元', '第四单元', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第五单元', '第五单元', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第六单元', '第六单元', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第七单元', '第七单元', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND level=1) AS _kn), '语文', '四年级', '第八单元', '第八单元', 2, 8);

-- 四年级 课文/习作/语文园地（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '观潮', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '繁星', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '现代诗二首（秋晚的江上、花牛歌）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '口语交际：我们与环境', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '习作：推荐一个好地方', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第一单元' AND level=2) AS _kn), '语文', '四年级', '第一单元', '语文园地一', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '一个豆荚里的五粒豆', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '夜间飞行的秘密', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '呼风呼雨的世纪', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '蝙蝠和雷达', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '习作：我的家人', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第二单元' AND level=2) AS _kn), '语文', '四年级', '第二单元', '语文园地二', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '古诗三首（暮江吟、题西林壁、雪梅）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '爬山虎的脚', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '蟋蟀的住宅', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '口语交际：爱护眼睛，保护视力', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '习作：写观察日记', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第三单元' AND level=2) AS _kn), '语文', '四年级', '第三单元', '语文园地三', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '盘古开天地', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '精卫填海', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '普罗米修斯', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '女娲补天', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '习作：我和____过一天', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第四单元' AND level=2) AS _kn), '语文', '四年级', '第四单元', '语文园地四', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第五单元' AND level=2) AS _kn), '语文', '四年级', '第五单元', '麻雀', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第五单元' AND level=2) AS _kn), '语文', '四年级', '第五单元', '爬天都峰', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第五单元' AND level=2) AS _kn), '语文', '四年级', '第五单元', '例文：我家的杏熟了', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第五单元' AND level=2) AS _kn), '语文', '四年级', '第五单元', '例文：小木船', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第五单元' AND level=2) AS _kn), '语文', '四年级', '第五单元', '习作：生活万花筒', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '长城', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '颐和园', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '秦兵马俑', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '口语交际：我是小小讲解员', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '习作：中国的世界文化遗产', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第六单元' AND level=2) AS _kn), '语文', '四年级', '第六单元', '语文园地六', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '牛和鹅', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '一只窝囊的大老虎', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '陀螺', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '王戎不取道旁李', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '口语交际：安慰', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '习作：我的心儿怦怦跳', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第七单元' AND level=2) AS _kn), '语文', '四年级', '第七单元', '语文园地七', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '梅兰芳蓄须', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '为中华之崛起而读书', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '延安，我把你追寻', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '古诗三首（凉州词、出塞、夏日绝句）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '习作：写信', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='四年级' AND name='第八单元' AND level=2) AS _kn), '语文', '四年级', '第八单元', '语文园地八', 3, 6);

-- 五年级 语文根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '语文', '五年级', NULL, '五年级语文（部编版）', 1, 0);

-- 五年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第一单元', '第一单元', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第二单元', '第二单元', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第三单元', '第三单元', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第四单元', '第四单元', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第五单元', '第五单元', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第六单元', '第六单元', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第七单元', '第七单元', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND level=1) AS _kn), '语文', '五年级', '第八单元', '第八单元', 2, 8);

-- 五年级 课文/习作/语文园地（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '桂花雨', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '落花生', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '珍珠鸟', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '口语交际：制定班级公约', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '习作：我的心爱之物', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第一单元' AND level=2) AS _kn), '语文', '五年级', '第一单元', '语文园地一', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '搭石', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '将相和', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '什么比猎豹的速度更快', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '冀中的地道战', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '口语交际：讲民间故事', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '习作："漫画"老师', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第二单元' AND level=2) AS _kn), '语文', '五年级', '第二单元', '语文园地二', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '猎人海力布', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '牛郎织女（一）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '牛郎织女（二）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '口语交际：讲民间故事', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '习作：缩写故事', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '语文园地三', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第三单元' AND level=2) AS _kn), '语文', '五年级', '第三单元', '快乐读书吧：从前有座山', 3, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '古诗三首（示儿、题临安邸、己亥杂诗）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '少年中国说（节选）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '圆明园的毁灭', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '小岛', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '习作：二十年后的家乡', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第四单元' AND level=2) AS _kn), '语文', '五年级', '第四单元', '语文园地四', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第五单元' AND level=2) AS _kn), '语文', '五年级', '第五单元', '太阳', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第五单元' AND level=2) AS _kn), '语文', '五年级', '第五单元', '松鼠', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第五单元' AND level=2) AS _kn), '语文', '五年级', '第五单元', '例文：鲸', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第五单元' AND level=2) AS _kn), '语文', '五年级', '第五单元', '例文：风向袋的制作', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第五单元' AND level=2) AS _kn), '语文', '五年级', '第五单元', '习作：介绍一种事物', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '慈母情深', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '父爱之舟', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '"精彩极了"和"糟糕透了"', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '口语交际：父母之爱', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '习作：我想对您说', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第六单元' AND level=2) AS _kn), '语文', '五年级', '第六单元', '语文园地六', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '古诗三首（山居秋暝、枫桥夜泊、长相思）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '四季之美', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '鸟的天堂', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '月迹', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '习作：即景', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第七单元' AND level=2) AS _kn), '语文', '五年级', '第七单元', '语文园地七', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '古人谈读书', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '忆读书', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '我的"长生果"', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '口语交际：我喜欢的人物形象', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '习作：推荐一本书', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='五年级' AND name='第八单元' AND level=2) AS _kn), '语文', '五年级', '第八单元', '语文园地八', 3, 6);

-- 统计：2 个年级，单元 16 个，知识点 97 个
