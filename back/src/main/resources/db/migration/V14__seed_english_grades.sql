-- ============================================
-- V14: 种子数据 — 沪教版（牛津）英语 2/4/5 年级
-- 静态章节树：level 1=学科根 2=Unit 3=学习组件
-- parent_id 用子查询定位，不硬编码 AUTO_INCREMENT id
-- ============================================

-- 二年级 英语根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '英语', '二年级', NULL, '二年级英语（沪教版）', 1, 0);

-- 二年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 1: My morning', 'Unit 1: My morning', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 2: My room', 'Unit 2: My room', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 3: On the way', 'Unit 3: On the way', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 4: Playing sports', 'Unit 4: Playing sports', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 5: My sky', 'Unit 5: My sky', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 6: Stars in the sky', 'Unit 6: Stars in the sky', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 7: In the sea', 'Unit 7: In the sea', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 8: The world around me', 'Unit 8: The world around me', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND level=1) AS _kn), '英语', '二年级', 'Unit 10: Talking about myself', 'Unit 10: Talking about myself', 2, 9);

-- 二年级 学习组件（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 1: My morning' AND level=2) AS _kn), '英语', '二年级', 'Unit 1: My morning', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 1: My morning' AND level=2) AS _kn), '英语', '二年级', 'Unit 1: My morning', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 1: My morning' AND level=2) AS _kn), '英语', '二年级', 'Unit 1: My morning', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 1: My morning' AND level=2) AS _kn), '英语', '二年级', 'Unit 1: My morning', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 2: My room' AND level=2) AS _kn), '英语', '二年级', 'Unit 2: My room', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 2: My room' AND level=2) AS _kn), '英语', '二年级', 'Unit 2: My room', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 2: My room' AND level=2) AS _kn), '英语', '二年级', 'Unit 2: My room', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 2: My room' AND level=2) AS _kn), '英语', '二年级', 'Unit 2: My room', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 3: On the way' AND level=2) AS _kn), '英语', '二年级', 'Unit 3: On the way', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 3: On the way' AND level=2) AS _kn), '英语', '二年级', 'Unit 3: On the way', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 3: On the way' AND level=2) AS _kn), '英语', '二年级', 'Unit 3: On the way', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 3: On the way' AND level=2) AS _kn), '英语', '二年级', 'Unit 3: On the way', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 4: Playing sports' AND level=2) AS _kn), '英语', '二年级', 'Unit 4: Playing sports', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 4: Playing sports' AND level=2) AS _kn), '英语', '二年级', 'Unit 4: Playing sports', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 4: Playing sports' AND level=2) AS _kn), '英语', '二年级', 'Unit 4: Playing sports', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 4: Playing sports' AND level=2) AS _kn), '英语', '二年级', 'Unit 4: Playing sports', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 5: My sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 5: My sky', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 5: My sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 5: My sky', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 5: My sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 5: My sky', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 5: My sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 5: My sky', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 6: Stars in the sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 6: Stars in the sky', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 6: Stars in the sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 6: Stars in the sky', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 6: Stars in the sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 6: Stars in the sky', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 6: Stars in the sky' AND level=2) AS _kn), '英语', '二年级', 'Unit 6: Stars in the sky', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 7: In the sea' AND level=2) AS _kn), '英语', '二年级', 'Unit 7: In the sea', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 7: In the sea' AND level=2) AS _kn), '英语', '二年级', 'Unit 7: In the sea', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 7: In the sea' AND level=2) AS _kn), '英语', '二年级', 'Unit 7: In the sea', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 7: In the sea' AND level=2) AS _kn), '英语', '二年级', 'Unit 7: In the sea', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 8: The world around me' AND level=2) AS _kn), '英语', '二年级', 'Unit 8: The world around me', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 8: The world around me' AND level=2) AS _kn), '英语', '二年级', 'Unit 8: The world around me', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 8: The world around me' AND level=2) AS _kn), '英语', '二年级', 'Unit 8: The world around me', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 8: The world around me' AND level=2) AS _kn), '英语', '二年级', 'Unit 8: The world around me', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 10: Talking about myself' AND level=2) AS _kn), '英语', '二年级', 'Unit 10: Talking about myself', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 10: Talking about myself' AND level=2) AS _kn), '英语', '二年级', 'Unit 10: Talking about myself', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 10: Talking about myself' AND level=2) AS _kn), '英语', '二年级', 'Unit 10: Talking about myself', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='二年级' AND name='Unit 10: Talking about myself' AND level=2) AS _kn), '英语', '二年级', 'Unit 10: Talking about myself', '项目任务（Big/Small task）', 3, 4);

-- 四年级 英语根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '英语', '四年级', NULL, '四年级英语（沪教版）', 1, 0);

-- 四年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 1: My school', 'Unit 1: My school', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 2: My classmates', 'Unit 2: My classmates', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 3: Animals', 'Unit 3: Animals', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 4: Our birthday', 'Unit 4: Our birthday', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 5: My neighbourhood', 'Unit 5: My neighbourhood', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 6: Autumn', 'Unit 6: Autumn', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 7: A healthy breakfast', 'Unit 7: A healthy breakfast', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 8: Being honest', 'Unit 8: Being honest', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 9: Time', 'Unit 9: Time', 2, 9),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND level=1) AS _kn), '英语', '四年级', 'Unit 10: Weather', 'Unit 10: Weather', 2, 10);

-- 四年级 学习组件（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 1: My school' AND level=2) AS _kn), '英语', '四年级', 'Unit 1: My school', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 1: My school' AND level=2) AS _kn), '英语', '四年级', 'Unit 1: My school', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 1: My school' AND level=2) AS _kn), '英语', '四年级', 'Unit 1: My school', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 1: My school' AND level=2) AS _kn), '英语', '四年级', 'Unit 1: My school', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 2: My classmates' AND level=2) AS _kn), '英语', '四年级', 'Unit 2: My classmates', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 2: My classmates' AND level=2) AS _kn), '英语', '四年级', 'Unit 2: My classmates', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 2: My classmates' AND level=2) AS _kn), '英语', '四年级', 'Unit 2: My classmates', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 2: My classmates' AND level=2) AS _kn), '英语', '四年级', 'Unit 2: My classmates', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 3: Animals' AND level=2) AS _kn), '英语', '四年级', 'Unit 3: Animals', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 3: Animals' AND level=2) AS _kn), '英语', '四年级', 'Unit 3: Animals', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 3: Animals' AND level=2) AS _kn), '英语', '四年级', 'Unit 3: Animals', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 3: Animals' AND level=2) AS _kn), '英语', '四年级', 'Unit 3: Animals', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 4: Our birthday' AND level=2) AS _kn), '英语', '四年级', 'Unit 4: Our birthday', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 4: Our birthday' AND level=2) AS _kn), '英语', '四年级', 'Unit 4: Our birthday', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 4: Our birthday' AND level=2) AS _kn), '英语', '四年级', 'Unit 4: Our birthday', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 4: Our birthday' AND level=2) AS _kn), '英语', '四年级', 'Unit 4: Our birthday', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 5: My neighbourhood' AND level=2) AS _kn), '英语', '四年级', 'Unit 5: My neighbourhood', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 5: My neighbourhood' AND level=2) AS _kn), '英语', '四年级', 'Unit 5: My neighbourhood', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 5: My neighbourhood' AND level=2) AS _kn), '英语', '四年级', 'Unit 5: My neighbourhood', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 5: My neighbourhood' AND level=2) AS _kn), '英语', '四年级', 'Unit 5: My neighbourhood', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 6: Autumn' AND level=2) AS _kn), '英语', '四年级', 'Unit 6: Autumn', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 6: Autumn' AND level=2) AS _kn), '英语', '四年级', 'Unit 6: Autumn', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 6: Autumn' AND level=2) AS _kn), '英语', '四年级', 'Unit 6: Autumn', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 6: Autumn' AND level=2) AS _kn), '英语', '四年级', 'Unit 6: Autumn', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 7: A healthy breakfast' AND level=2) AS _kn), '英语', '四年级', 'Unit 7: A healthy breakfast', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 7: A healthy breakfast' AND level=2) AS _kn), '英语', '四年级', 'Unit 7: A healthy breakfast', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 7: A healthy breakfast' AND level=2) AS _kn), '英语', '四年级', 'Unit 7: A healthy breakfast', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 7: A healthy breakfast' AND level=2) AS _kn), '英语', '四年级', 'Unit 7: A healthy breakfast', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 8: Being honest' AND level=2) AS _kn), '英语', '四年级', 'Unit 8: Being honest', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 8: Being honest' AND level=2) AS _kn), '英语', '四年级', 'Unit 8: Being honest', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 8: Being honest' AND level=2) AS _kn), '英语', '四年级', 'Unit 8: Being honest', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 8: Being honest' AND level=2) AS _kn), '英语', '四年级', 'Unit 8: Being honest', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 9: Time' AND level=2) AS _kn), '英语', '四年级', 'Unit 9: Time', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 9: Time' AND level=2) AS _kn), '英语', '四年级', 'Unit 9: Time', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 9: Time' AND level=2) AS _kn), '英语', '四年级', 'Unit 9: Time', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 9: Time' AND level=2) AS _kn), '英语', '四年级', 'Unit 9: Time', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 10: Weather' AND level=2) AS _kn), '英语', '四年级', 'Unit 10: Weather', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 10: Weather' AND level=2) AS _kn), '英语', '四年级', 'Unit 10: Weather', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 10: Weather' AND level=2) AS _kn), '英语', '四年级', 'Unit 10: Weather', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='四年级' AND name='Unit 10: Weather' AND level=2) AS _kn), '英语', '四年级', 'Unit 10: Weather', '项目任务（Big/Small task）', 3, 4);

-- 五年级 英语根节点
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
(NULL, '英语', '五年级', NULL, '五年级英语（沪教版）', 1, 0);

-- 五年级 单元（level 2）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 1: Clubs in our school', 'Unit 1: Clubs in our school', 2, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 2: Traditional games', 'Unit 2: Traditional games', 2, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 3: Amazing plants', 'Unit 3: Amazing plants', 2, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 4: Together with animals', 'Unit 4: Together with animals', 2, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 5: Seeing a doctor', 'Unit 5: Seeing a doctor', 2, 5),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 6: Rise to the challenge', 'Unit 6: Rise to the challenge', 2, 6),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 7: Great scientists', 'Unit 7: Great scientists', 2, 7),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 8: Useful inventions', 'Unit 8: Useful inventions', 2, 8),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 9: Using computers', 'Unit 9: Using computers', 2, 9),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND level=1) AS _kn), '英语', '五年级', 'Unit 10: Reuse and recycle', 'Unit 10: Reuse and recycle', 2, 10);

-- 五年级 学习组件（level 3）
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 1: Clubs in our school' AND level=2) AS _kn), '英语', '五年级', 'Unit 1: Clubs in our school', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 1: Clubs in our school' AND level=2) AS _kn), '英语', '五年级', 'Unit 1: Clubs in our school', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 1: Clubs in our school' AND level=2) AS _kn), '英语', '五年级', 'Unit 1: Clubs in our school', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 1: Clubs in our school' AND level=2) AS _kn), '英语', '五年级', 'Unit 1: Clubs in our school', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 2: Traditional games' AND level=2) AS _kn), '英语', '五年级', 'Unit 2: Traditional games', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 2: Traditional games' AND level=2) AS _kn), '英语', '五年级', 'Unit 2: Traditional games', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 2: Traditional games' AND level=2) AS _kn), '英语', '五年级', 'Unit 2: Traditional games', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 2: Traditional games' AND level=2) AS _kn), '英语', '五年级', 'Unit 2: Traditional games', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 3: Amazing plants' AND level=2) AS _kn), '英语', '五年级', 'Unit 3: Amazing plants', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 3: Amazing plants' AND level=2) AS _kn), '英语', '五年级', 'Unit 3: Amazing plants', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 3: Amazing plants' AND level=2) AS _kn), '英语', '五年级', 'Unit 3: Amazing plants', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 3: Amazing plants' AND level=2) AS _kn), '英语', '五年级', 'Unit 3: Amazing plants', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 4: Together with animals' AND level=2) AS _kn), '英语', '五年级', 'Unit 4: Together with animals', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 4: Together with animals' AND level=2) AS _kn), '英语', '五年级', 'Unit 4: Together with animals', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 4: Together with animals' AND level=2) AS _kn), '英语', '五年级', 'Unit 4: Together with animals', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 4: Together with animals' AND level=2) AS _kn), '英语', '五年级', 'Unit 4: Together with animals', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 5: Seeing a doctor' AND level=2) AS _kn), '英语', '五年级', 'Unit 5: Seeing a doctor', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 5: Seeing a doctor' AND level=2) AS _kn), '英语', '五年级', 'Unit 5: Seeing a doctor', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 5: Seeing a doctor' AND level=2) AS _kn), '英语', '五年级', 'Unit 5: Seeing a doctor', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 5: Seeing a doctor' AND level=2) AS _kn), '英语', '五年级', 'Unit 5: Seeing a doctor', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 6: Rise to the challenge' AND level=2) AS _kn), '英语', '五年级', 'Unit 6: Rise to the challenge', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 6: Rise to the challenge' AND level=2) AS _kn), '英语', '五年级', 'Unit 6: Rise to the challenge', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 6: Rise to the challenge' AND level=2) AS _kn), '英语', '五年级', 'Unit 6: Rise to the challenge', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 6: Rise to the challenge' AND level=2) AS _kn), '英语', '五年级', 'Unit 6: Rise to the challenge', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 7: Great scientists' AND level=2) AS _kn), '英语', '五年级', 'Unit 7: Great scientists', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 7: Great scientists' AND level=2) AS _kn), '英语', '五年级', 'Unit 7: Great scientists', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 7: Great scientists' AND level=2) AS _kn), '英语', '五年级', 'Unit 7: Great scientists', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 7: Great scientists' AND level=2) AS _kn), '英语', '五年级', 'Unit 7: Great scientists', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 8: Useful inventions' AND level=2) AS _kn), '英语', '五年级', 'Unit 8: Useful inventions', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 8: Useful inventions' AND level=2) AS _kn), '英语', '五年级', 'Unit 8: Useful inventions', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 8: Useful inventions' AND level=2) AS _kn), '英语', '五年级', 'Unit 8: Useful inventions', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 8: Useful inventions' AND level=2) AS _kn), '英语', '五年级', 'Unit 8: Useful inventions', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 9: Using computers' AND level=2) AS _kn), '英语', '五年级', 'Unit 9: Using computers', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 9: Using computers' AND level=2) AS _kn), '英语', '五年级', 'Unit 9: Using computers', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 9: Using computers' AND level=2) AS _kn), '英语', '五年级', 'Unit 9: Using computers', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 9: Using computers' AND level=2) AS _kn), '英语', '五年级', 'Unit 9: Using computers', '项目任务（Big/Small task）', 3, 4),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 10: Reuse and recycle' AND level=2) AS _kn), '英语', '五年级', 'Unit 10: Reuse and recycle', '核心词汇（Topic words）', 3, 1),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 10: Reuse and recycle' AND level=2) AS _kn), '英语', '五年级', 'Unit 10: Reuse and recycle', '核心句型（Key sentences）', 3, 2),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 10: Reuse and recycle' AND level=2) AS _kn), '英语', '五年级', 'Unit 10: Reuse and recycle', '歌曲与儿歌（Song & rhyme）', 3, 3),
((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='五年级' AND name='Unit 10: Reuse and recycle' AND level=2) AS _kn), '英语', '五年级', 'Unit 10: Reuse and recycle', '项目任务（Big/Small task）', 3, 4);

-- 统计：3 个年级，单元 29 个，知识点 116 个
