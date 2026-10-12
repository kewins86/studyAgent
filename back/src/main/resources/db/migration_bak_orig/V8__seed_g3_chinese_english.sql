-- ============================================
-- V8: 种子数据 — 三年级上册语文 + 英语（沪教版/人教版·五四学制）
-- 语文：8单元 26课 + 口语交际4 + 习作8 + 语文园地7 + 快乐读书吧1
-- 英语：Starter + 10 Unit（每 Unit 5 知识点：词汇/句型/语音/阅读/项目）
-- 使用子查询引用 parent_id，不硬编码 id
-- ============================================

-- ============================================
-- 语文（人教版三上·五四学制）
-- ============================================

-- 学科根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '语文', '三年级', NULL, '三年级语文（人教版·五四学制）', 1, 0);
SET @chinese_root = LAST_INSERT_ID();

-- 8 个单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@chinese_root, '语文', '三年级', '第一单元 校园生活', '第一单元 校园生活', 2, 1),
(@chinese_root, '语文', '三年级', '第二单元 秋天', '第二单元 秋天', 2, 2),
(@chinese_root, '语文', '三年级', '第三单元 阅读策略·预测', '第三单元 阅读策略·预测', 2, 3),
(@chinese_root, '语文', '三年级', '第四单元 童话', '第四单元 童话', 2, 4),
(@chinese_root, '语文', '三年级', '第五单元 习作·观察', '第五单元 习作·观察', 2, 5),
(@chinese_root, '语文', '三年级', '第六单元 祖国山河', '第六单元 祖国山河', 2, 6),
(@chinese_root, '语文', '三年级', '第七单元 大自然', '第七单元 大自然', 2, 7),
(@chinese_root, '语文', '三年级', '第八单元 美好品质', '第八单元 美好品质', 2, 8);

-- 获取各单元 id
SET @u1 = @chinese_root + 1;
SET @u2 = @chinese_root + 2;
SET @u3 = @chinese_root + 3;
SET @u4 = @chinese_root + 4;
SET @u5 = @chinese_root + 5;
SET @u6 = @chinese_root + 6;
SET @u7 = @chinese_root + 7;
SET @u8 = @chinese_root + 8;

-- 第一单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u1, '语文', '三年级', '第一单元', '1.大青树下的小学（精读）', 3, 1),
(@u1, '语文', '三年级', '第一单元', '2.花的学校（精读）', 3, 2),
(@u1, '语文', '三年级', '第一单元', '3*.不懂就要问（略读）', 3, 3),
(@u1, '语文', '三年级', '第一单元', '口语交际：我的暑假生活', 3, 4),
(@u1, '语文', '三年级', '第一单元', '习作：猜猜他是谁', 3, 5),
(@u1, '语文', '三年级', '第一单元', '语文园地一', 3, 6);

-- 第二单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u2, '语文', '三年级', '第二单元', '4.古诗三首：望洞庭、山行、夜书所见（精读）', 3, 1),
(@u2, '语文', '三年级', '第二单元', '5.铺满金色巴掌的水泥道（精读）', 3, 2),
(@u2, '语文', '三年级', '第二单元', '6.秋天的雨（精读）', 3, 3),
(@u2, '语文', '三年级', '第二单元', '7*.听听，秋的声音（略读）', 3, 4),
(@u2, '语文', '三年级', '第二单元', '习作：写日记', 3, 5),
(@u2, '语文', '三年级', '第二单元', '语文园地二', 3, 6);

-- 第三单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u3, '语文', '三年级', '第三单元', '8.总也倒不了的老屋（精读）', 3, 1),
(@u3, '语文', '三年级', '第三单元', '9*.犟龟（略读）', 3, 2),
(@u3, '语文', '三年级', '第三单元', '10*.小狗学叫（略读）', 3, 3),
(@u3, '语文', '三年级', '第三单元', '口语交际：名字里的故事', 3, 4),
(@u3, '语文', '三年级', '第三单元', '习作：续写故事', 3, 5),
(@u3, '语文', '三年级', '第三单元', '语文园地三', 3, 6);

-- 第四单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u4, '语文', '三年级', '第四单元', '11.宝葫芦的秘密（节选）（精读）', 3, 1),
(@u4, '语文', '三年级', '第四单元', '12.在牛肚子里旅行（精读）', 3, 2),
(@u4, '语文', '三年级', '第四单元', '13*.一块奶酪（略读）', 3, 3),
(@u4, '语文', '三年级', '第四单元', '习作：我来编童话', 3, 4),
(@u4, '语文', '三年级', '第四单元', '语文园地四', 3, 5),
(@u4, '语文', '三年级', '第四单元', '快乐读书吧：在那奇妙的王国里', 3, 6);

-- 第五单元（习作单元）知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u5, '语文', '三年级', '第五单元', '14.搭船的鸟（精读）', 3, 1),
(@u5, '语文', '三年级', '第五单元', '15.金色的草地（精读）', 3, 2),
(@u5, '语文', '三年级', '第五单元', '习作：我们眼中的缤纷世界', 3, 3),
(@u5, '语文', '三年级', '第五单元', '例文：我家的小狗 / 我爱故乡的杨梅', 3, 4);

-- 第六单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u6, '语文', '三年级', '第六单元', '16.富饶的西沙群岛（精读）', 3, 1),
(@u6, '语文', '三年级', '第六单元', '17.海滨小城（精读）', 3, 2),
(@u6, '语文', '三年级', '第六单元', '18.美丽的小兴安岭（精读）', 3, 3),
(@u6, '语文', '三年级', '第六单元', '19*.香港，璀璨的明珠（略读）', 3, 4),
(@u6, '语文', '三年级', '第六单元', '习作：这儿真美', 3, 5),
(@u6, '语文', '三年级', '第六单元', '语文园地六', 3, 6);

-- 第七单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u7, '语文', '三年级', '第七单元', '20.古诗三首：鹿柴、望天门山、饮湖上初晴后雨（精读）', 3, 1),
(@u7, '语文', '三年级', '第七单元', '21.大自然的声音（精读）', 3, 2),
(@u7, '语文', '三年级', '第七单元', '22.读不完的大书（精读）', 3, 3),
(@u7, '语文', '三年级', '第七单元', '口语交际：身边的"小事"', 3, 4),
(@u7, '语文', '三年级', '第七单元', '习作：我有一个想法', 3, 5),
(@u7, '语文', '三年级', '第七单元', '语文园地七', 3, 6);

-- 第八单元 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@u8, '语文', '三年级', '第八单元', '23.司马光（精读）', 3, 1),
(@u8, '语文', '三年级', '第八单元', '24.一定要争气（精读）', 3, 2),
(@u8, '语文', '三年级', '第八单元', '25.手术台就是阵地（精读）', 3, 3),
(@u8, '语文', '三年级', '第八单元', '26*.一个粗瓷大碗（略读）', 3, 4),
(@u8, '语文', '三年级', '第八单元', '口语交际：请教', 3, 5),
(@u8, '语文', '三年级', '第八单元', '习作：那次经历真难忘 + 语文园地八', 3, 6);

-- ============================================
-- 英语（沪教版三上·五四学制）
-- ============================================

-- 学科根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '英语', '三年级', NULL, '三年级英语（沪教版·五四学制）', 1, 0);
SET @english_root = LAST_INSERT_ID();

-- Starter + 10 Unit（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@english_root, '英语', '三年级', 'Starter', 'Starter: Our friends & The alphabet', 2, 0),
(@english_root, '英语', '三年级', 'Unit 1', 'Unit 1: A new start', 2, 1),
(@english_root, '英语', '三年级', 'Unit 2', 'Unit 2: Proud of you, proud of myself', 2, 2),
(@english_root, '英语', '三年级', 'Unit 3', 'Unit 3: Our garden', 2, 3),
(@english_root, '英语', '三年级', 'Unit 4', 'Unit 4: Water in our life', 2, 4),
(@english_root, '英语', '三年级', 'Unit 5', 'Unit 5: I can help', 2, 5),
(@english_root, '英语', '三年级', 'Unit 6', 'Unit 6: How do you feel?', 2, 6),
(@english_root, '英语', '三年级', 'Unit 7', 'Unit 7: Jobs', 2, 7),
(@english_root, '英语', '三年级', 'Unit 8', 'Unit 8: Finding places', 2, 8),
(@english_root, '英语', '三年级', 'Unit 9', 'Unit 9: Special days in China', 2, 9),
(@english_root, '英语', '三年级', 'Unit 10', 'Unit 10: Foods around the world', 2, 10);

-- 获取各 Unit id
SET @s = @english_root + 1;   -- Starter
SET @e1 = @english_root + 2;  -- Unit 1
SET @e2 = @english_root + 3;  -- Unit 2
SET @e3 = @english_root + 4;  -- Unit 3
SET @e4 = @english_root + 5;  -- Unit 4
SET @e5 = @english_root + 6;  -- Unit 5
SET @e6 = @english_root + 7;  -- Unit 6
SET @e7 = @english_root + 8;  -- Unit 7
SET @e8 = @english_root + 9;  -- Unit 8
SET @e9 = @english_root + 10; -- Unit 9
SET @e10 = @english_root + 11;-- Unit 10

-- Starter 知识点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@s, '英语', '三年级', 'Starter', '核心词汇：Shenshen/Minmin/Xiaopu/Xiaojiang 等人物名', 3, 1),
(@s, '英语', '三年级', 'Starter', 'The alphabet（26个字母认读与书写）', 3, 2);

-- Unit 1: A new start
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e1, '英语', '三年级', 'Unit 1', '词汇：school/classmate/teacher/play sports/read/book/study/friend', 3, 1),
(@e1, '英语', '三年级', 'Unit 1', '句型：What''s your goal? I want to ...', 3, 2),
(@e1, '英语', '三年级', 'Unit 1', '语音：Sound b (book)', 3, 3),
(@e1, '英语', '三年级', 'Unit 1', '阅读：Minmin''s goal（故事）', 3, 4),
(@e1, '英语', '三年级', 'Unit 1', '项目：My goal leaf', 3, 5);

-- Unit 2: Proud of you
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e2, '英语', '三年级', 'Unit 2', '词汇：draw/tell a story/dance/sing/use the computer/run/jump', 3, 1),
(@e2, '英语', '三年级', 'Unit 2', '句型：I''m/You are good at (doing) ...', 3, 2),
(@e2, '英语', '三年级', 'Unit 2', '语音：Sound d (dance)', 3, 3),
(@e2, '英语', '三年级', 'Unit 2', '阅读：Snail''s little house（故事）', 3, 4),
(@e2, '英语', '三年级', 'Unit 2', '项目：A class meeting', 3, 5);

-- Unit 3: Our garden
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e3, '英语', '三年级', 'Unit 3', '词汇：garden/flower/vegetable/plant/orange tree/tomato/carrot', 3, 1),
(@e3, '英语', '三年级', 'Unit 3', '句型：What''s this/that? It''s ...', 3, 2),
(@e3, '英语', '三年级', 'Unit 3', '语音：Sound g (garden)', 3, 3),
(@e3, '英语', '三年级', 'Unit 3', '阅读：Grandpa''s garden（故事）', 3, 4),
(@e3, '英语', '三年级', 'Unit 3', '项目：My school garden report', 3, 5);

-- Unit 4: Water in our life
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e4, '英语', '三年级', 'Unit 4', '词汇：water/river/lake/sea/water vapour/cloud/rain/snow/ice', 3, 1),
(@e4, '英语', '三年级', 'Unit 4', '句型：Where is ... from? It''s from ...', 3, 2),
(@e4, '英语', '三年级', 'Unit 4', '语音：Sound s (sea)', 3, 3),
(@e4, '英语', '三年级', 'Unit 4', '阅读：Water in nature（信息类文本）', 3, 4),
(@e4, '英语', '三年级', 'Unit 4', '项目：My lab report', 3, 5);

-- Unit 5: I can help
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e5, '英语', '三年级', 'Unit 5', '词汇：help/cook/do the dishes/clean the table/walk the dog/chore/give your seat', 3, 1),
(@e5, '英语', '三年级', 'Unit 5', '句型：... can (do) ...', 3, 2),
(@e5, '英语', '三年级', 'Unit 5', '语音：Sound i (dish)', 3, 3),
(@e5, '英语', '三年级', 'Unit 5', '阅读：The ant and the bird（故事）', 3, 4),
(@e5, '英语', '三年级', 'Unit 5', '项目：Our good helpers'' star chart', 3, 5);

-- Unit 6: How do you feel?
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e6, '英语', '三年级', 'Unit 6', '词汇：happy/sad/good/bad/excited/scared/tired/unhappy', 3, 1),
(@e6, '英语', '三年级', 'Unit 6', '句型：How do you feel? I''m ...', 3, 2),
(@e6, '英语', '三年级', 'Unit 6', '语音：Sound a (happy)', 3, 3),
(@e6, '英语', '三年级', 'Unit 6', '阅读：Minmin''s bad feelings（故事）', 3, 4),
(@e6, '英语', '三年级', 'Unit 6', '项目：A note to Mr Tree', 3, 5);

-- Unit 7: Jobs
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e7, '英语', '三年级', 'Unit 7', '词汇：driver/police officer/engineer/author/doctor/chef/astronaut', 3, 1),
(@e7, '英语', '三年级', 'Unit 7', '句型：What''s ...? ... is ...', 3, 2),
(@e7, '英语', '三年级', 'Unit 7', '语音：Sound t (teacher)', 3, 3),
(@e7, '英语', '三年级', 'Unit 7', '阅读：Astronauts（信息类文本）', 3, 4),
(@e7, '英语', '三年级', 'Unit 7', '项目：My group interview', 3, 5);

-- Unit 8: Finding places
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e8, '英语', '三年级', 'Unit 8', '词汇：library/find the way/get to/walk along/road/left/right/get lost/museum', 3, 1),
(@e8, '英语', '三年级', 'Unit 8', '句型：Walk along ... Turn left/right at ...', 3, 2),
(@e8, '英语', '三年级', 'Unit 8', '语音：Sound m (many)', 3, 3),
(@e8, '英语', '三年级', 'Unit 8', '阅读：Getting lost at the museum（故事）', 3, 4),
(@e8, '英语', '三年级', 'Unit 8', '项目：Finding the places', 3, 5);

-- Unit 9: Special days in China
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e9, '英语', '三年级', 'Unit 9', '词汇：special days/the Double Ninth Festival/celebrate/Chinese New Year/the Spring Festival/the Lantern Festival/holiday', 3, 1),
(@e9, '英语', '三年级', 'Unit 9', '句型：Let''s ...', 3, 2),
(@e9, '英语', '三年级', 'Unit 9', '语音：Sound e (festival)', 3, 3),
(@e9, '英语', '三年级', 'Unit 9', '阅读：Chinese New Year（信息类文本）', 3, 4),
(@e9, '英语', '三年级', 'Unit 9', '项目：My plan for New Year celebration', 3, 5);

-- Unit 10: Foods around the world
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(@e10, '英语', '三年级', 'Unit 10', '词汇：food/noodles/pizza/sandwich/hot dog/meatball/fish and chips/beef/bread/cake', 3, 1),
(@e10, '英语', '三年级', 'Unit 10', '句型：There is ...', 3, 2),
(@e10, '英语', '三年级', 'Unit 10', '语音：Sound n (noodles)', 3, 3),
(@e10, '英语', '三年级', 'Unit 10', '阅读：Magic Flour（故事）', 3, 4),
(@e10, '英语', '三年级', 'Unit 10', '项目：My food card', 3, 5);
