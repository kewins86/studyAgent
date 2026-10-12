-- ============================================
-- V13: 种子数据 — 部编版（五四学制）语文 1/2 年级
-- 静态章节树：level 1=学科根 2=单元 3=课文/识字课
-- parent_id 用子查询定位，不硬编码 AUTO_INCREMENT id
-- ============================================

-- 一年级 语文根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '语文', '一年级', NULL, '一年级语文（部编版·五四学制）', 1, 0);

-- 一年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '我上学了', '我上学了', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第一单元·识字', '第一单元·识字', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '第二单元·汉语拼音', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '第三单元·汉语拼音', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第四单元·汉语拼音', '第四单元·汉语拼音', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第五单元·识字', '第五单元·识字', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第六单元·识字', '第六单元·识字', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第七单元·课文', '第七单元·课文', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND level=1) AS _kn), '语文', '一年级', '第八单元·课文', '第八单元·课文', 2, 9);

-- 一年级 课文/识字课（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='我上学了' AND level=2) AS _kn), '语文', '一年级', '我上学了', '我是中国人', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='我上学了' AND level=2) AS _kn), '语文', '一年级', '我上学了', '我爱我们的祖国', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='我上学了' AND level=2) AS _kn), '语文', '一年级', '我上学了', '我是小学生', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='我上学了' AND level=2) AS _kn), '语文', '一年级', '我上学了', '我爱学语文', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '天地人', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '金木水火土', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '口耳目手足', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '日月山川', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '语文园地一', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第一单元·识字' AND level=2) AS _kn), '语文', '一年级', '第一单元·识字', '快乐读书吧', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第二单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '单韵母 a o e', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第二单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '单韵母 i u ü', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第二单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '声母 b p m f', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第二单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '声母 d t n l', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第二单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第二单元·汉语拼音', '语文园地二', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第三单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '声母 g k h', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第三单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '声母 j q x', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第三单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '声母 z c s', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第三单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '声母 zh ch sh r', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第三单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第三单元·汉语拼音', '语文园地三', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第四单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第四单元·汉语拼音', '复韵母 ai ei ui', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第四单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第四单元·汉语拼音', '复韵母 ao ou iu', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第四单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第四单元·汉语拼音', '复韵母 ie üe er', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第四单元·汉语拼音' AND level=2) AS _kn), '语文', '一年级', '第四单元·汉语拼音', '语文园地四', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '画', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '大小多少', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '小书包', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '日月明', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '升国旗', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第五单元·识字' AND level=2) AS _kn), '语文', '一年级', '第五单元·识字', '语文园地五', 3, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第六单元·识字' AND level=2) AS _kn), '语文', '一年级', '第六单元·识字', '影子', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第六单元·识字' AND level=2) AS _kn), '语文', '一年级', '第六单元·识字', '比尾巴', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第六单元·识字' AND level=2) AS _kn), '语文', '一年级', '第六单元·识字', '青蛙写诗', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第六单元·识字' AND level=2) AS _kn), '语文', '一年级', '第六单元·识字', '雨点儿', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第六单元·识字' AND level=2) AS _kn), '语文', '一年级', '第六单元·识字', '语文园地六', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '一年级', '第七单元·课文', '明天要远足', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '一年级', '第七单元·课文', '大还是小', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '一年级', '第七单元·课文', '项链', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '一年级', '第七单元·课文', '语文园地七', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '一年级', '第八单元·课文', '雪地里的小画家', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '一年级', '第八单元·课文', '乌鸦喝水', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '一年级', '第八单元·课文', '小蜗牛', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='一年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '一年级', '第八单元·课文', '语文园地八', 3, 4);

-- 二年级 语文根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '语文', '二年级', NULL, '二年级语文（部编版·五四学制）', 1, 0);

-- 二年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第一单元·课文', '第一单元·课文', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第二单元·识字', '第二单元·识字', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第三单元·课文', '第三单元·课文', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第四单元·课文', '第四单元·课文', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第五单元·课文', '第五单元·课文', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第六单元·课文', '第六单元·课文', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第七单元·课文', '第七单元·课文', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND level=1) AS _kn), '语文', '二年级', '第八单元·课文', '第八单元·课文', 2, 8);

-- 二年级 课文/识字课（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第一单元·课文' AND level=2) AS _kn), '语文', '二年级', '第一单元·课文', '小蝌蚪找妈妈', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第一单元·课文' AND level=2) AS _kn), '语文', '二年级', '第一单元·课文', '我是什么', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第一单元·课文' AND level=2) AS _kn), '语文', '二年级', '第一单元·课文', '植物妈妈有办法', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第一单元·课文' AND level=2) AS _kn), '语文', '二年级', '第一单元·课文', '语文园地一', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第一单元·课文' AND level=2) AS _kn), '语文', '二年级', '第一单元·课文', '快乐读书吧', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第二单元·识字' AND level=2) AS _kn), '语文', '二年级', '第二单元·识字', '场景歌', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第二单元·识字' AND level=2) AS _kn), '语文', '二年级', '第二单元·识字', '树之歌', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第二单元·识字' AND level=2) AS _kn), '语文', '二年级', '第二单元·识字', '拍手歌', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第二单元·识字' AND level=2) AS _kn), '语文', '二年级', '第二单元·识字', '田家四季歌', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第二单元·识字' AND level=2) AS _kn), '语文', '二年级', '第二单元·识字', '语文园地二', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第三单元·课文' AND level=2) AS _kn), '语文', '二年级', '第三单元·课文', '曹冲称象', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第三单元·课文' AND level=2) AS _kn), '语文', '二年级', '第三单元·课文', '玲玲的画', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第三单元·课文' AND level=2) AS _kn), '语文', '二年级', '第三单元·课文', '一封信', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第三单元·课文' AND level=2) AS _kn), '语文', '二年级', '第三单元·课文', '妈妈睡了', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第三单元·课文' AND level=2) AS _kn), '语文', '二年级', '第三单元·课文', '语文园地三', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第四单元·课文' AND level=2) AS _kn), '语文', '二年级', '第四单元·课文', '古诗二首（登鹳雀楼、望庐山瀑布）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第四单元·课文' AND level=2) AS _kn), '语文', '二年级', '第四单元·课文', '黄山奇石', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第四单元·课文' AND level=2) AS _kn), '语文', '二年级', '第四单元·课文', '日月潭', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第四单元·课文' AND level=2) AS _kn), '语文', '二年级', '第四单元·课文', '葡萄沟', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第四单元·课文' AND level=2) AS _kn), '语文', '二年级', '第四单元·课文', '语文园地四', 3, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第五单元·课文' AND level=2) AS _kn), '语文', '二年级', '第五单元·课文', '坐井观天', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第五单元·课文' AND level=2) AS _kn), '语文', '二年级', '第五单元·课文', '寒号鸟', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第五单元·课文' AND level=2) AS _kn), '语文', '二年级', '第五单元·课文', '我要的是葫芦', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第五单元·课文' AND level=2) AS _kn), '语文', '二年级', '第五单元·课文', '语文园地五', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第六单元·课文' AND level=2) AS _kn), '语文', '二年级', '第六单元·课文', '大禹治水', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第六单元·课文' AND level=2) AS _kn), '语文', '二年级', '第六单元·课文', '朱德的扁担', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第六单元·课文' AND level=2) AS _kn), '语文', '二年级', '第六单元·课文', '难忘的泼水节', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第六单元·课文' AND level=2) AS _kn), '语文', '二年级', '第六单元·课文', '语文园地六', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '二年级', '第七单元·课文', '古诗二首（夜宿山寺、敕勒歌）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '二年级', '第七单元·课文', '雾在哪里', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '二年级', '第七单元·课文', '雪孩子', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第七单元·课文' AND level=2) AS _kn), '语文', '二年级', '第七单元·课文', '语文园地七', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '二年级', '第八单元·课文', '狐假虎威', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '二年级', '第八单元·课文', '狐狸分奶酪', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '二年级', '第八单元·课文', '纸船和风筝', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '二年级', '第八单元·课文', '风娃娃', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='语文' AND grade='二年级' AND name='第八单元·课文' AND level=2) AS _kn), '语文', '二年级', '第八单元·课文', '语文园地八', 3, 5);

-- 统计：2 个年级，单元 17 个，知识点 80 个
