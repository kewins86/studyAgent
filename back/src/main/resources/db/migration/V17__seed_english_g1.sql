-- ============================================================
-- V17: 知识树种子 — 一年级英语（上海版·沪教版·五四学制 上册）
-- 基于官方《知识梳理》目录校正：单元用官方主题名；含 Starter 单元
-- 结构: level1 学科根 -> level2 单元(Starter/Unit N: Theme) -> level3 固定4节点
-- parent_id / node_id 一律用子查询（不硬编码 AUTO_INCREMENT id）
-- ============================================================

INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  (NULL, '英语', '一年级', NULL, '一年级英语（上海版·沪教版·五四学制）', 1, 0);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Starter: Our families and friends', 'Starter: Our families and friends', 2, 0);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Starter: Our families and friends' AND level=2) AS _kn), '英语', '一年级', 'Starter: Our families and friends', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Starter: Our families and friends' AND level=2) AS _kn), '英语', '一年级', 'Starter: Our families and friends', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Starter: Our families and friends' AND level=2) AS _kn), '英语', '一年级', 'Starter: Our families and friends', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Starter: Our families and friends' AND level=2) AS _kn), '英语', '一年级', 'Starter: Our families and friends', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 1: Greetings', 'Unit 1: Greetings', 2, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 1: Greetings' AND level=2) AS _kn), '英语', '一年级', 'Unit 1: Greetings', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 1: Greetings' AND level=2) AS _kn), '英语', '一年级', 'Unit 1: Greetings', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 1: Greetings' AND level=2) AS _kn), '英语', '一年级', 'Unit 1: Greetings', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 1: Greetings' AND level=2) AS _kn), '英语', '一年级', 'Unit 1: Greetings', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 2: New friends', 'Unit 2: New friends', 2, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 2: New friends' AND level=2) AS _kn), '英语', '一年级', 'Unit 2: New friends', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 2: New friends' AND level=2) AS _kn), '英语', '一年级', 'Unit 2: New friends', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 2: New friends' AND level=2) AS _kn), '英语', '一年级', 'Unit 2: New friends', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 2: New friends' AND level=2) AS _kn), '英语', '一年级', 'Unit 2: New friends', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 3: My schoolbag', 'Unit 3: My schoolbag', 2, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 3: My schoolbag' AND level=2) AS _kn), '英语', '一年级', 'Unit 3: My schoolbag', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 3: My schoolbag' AND level=2) AS _kn), '英语', '一年级', 'Unit 3: My schoolbag', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 3: My schoolbag' AND level=2) AS _kn), '英语', '一年级', 'Unit 3: My schoolbag', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 3: My schoolbag' AND level=2) AS _kn), '英语', '一年级', 'Unit 3: My schoolbag', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 4: My classroom', 'Unit 4: My classroom', 2, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 4: My classroom' AND level=2) AS _kn), '英语', '一年级', 'Unit 4: My classroom', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 4: My classroom' AND level=2) AS _kn), '英语', '一年级', 'Unit 4: My classroom', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 4: My classroom' AND level=2) AS _kn), '英语', '一年级', 'Unit 4: My classroom', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 4: My classroom' AND level=2) AS _kn), '英语', '一年级', 'Unit 4: My classroom', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 5: Lovely faces', 'Unit 5: Lovely faces', 2, 5);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 5: Lovely faces' AND level=2) AS _kn), '英语', '一年级', 'Unit 5: Lovely faces', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 5: Lovely faces' AND level=2) AS _kn), '英语', '一年级', 'Unit 5: Lovely faces', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 5: Lovely faces' AND level=2) AS _kn), '英语', '一年级', 'Unit 5: Lovely faces', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 5: Lovely faces' AND level=2) AS _kn), '英语', '一年级', 'Unit 5: Lovely faces', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 6: My family', 'Unit 6: My family', 2, 6);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 6: My family' AND level=2) AS _kn), '英语', '一年级', 'Unit 6: My family', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 6: My family' AND level=2) AS _kn), '英语', '一年级', 'Unit 6: My family', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 6: My family' AND level=2) AS _kn), '英语', '一年级', 'Unit 6: My family', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 6: My family' AND level=2) AS _kn), '英语', '一年级', 'Unit 6: My family', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 7: Animals in our lives', 'Unit 7: Animals in our lives', 2, 7);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 7: Animals in our lives' AND level=2) AS _kn), '英语', '一年级', 'Unit 7: Animals in our lives', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 7: Animals in our lives' AND level=2) AS _kn), '英语', '一年级', 'Unit 7: Animals in our lives', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 7: Animals in our lives' AND level=2) AS _kn), '英语', '一年级', 'Unit 7: Animals in our lives', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 7: Animals in our lives' AND level=2) AS _kn), '英语', '一年级', 'Unit 7: Animals in our lives', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 8: Have a go!', 'Unit 8: Have a go!', 2, 8);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 8: Have a go!' AND level=2) AS _kn), '英语', '一年级', 'Unit 8: Have a go!', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 8: Have a go!' AND level=2) AS _kn), '英语', '一年级', 'Unit 8: Have a go!', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 8: Have a go!' AND level=2) AS _kn), '英语', '一年级', 'Unit 8: Have a go!', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 8: Have a go!' AND level=2) AS _kn), '英语', '一年级', 'Unit 8: Have a go!', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 9: Yes, I can!', 'Unit 9: Yes, I can!', 2, 9);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 9: Yes, I can!' AND level=2) AS _kn), '英语', '一年级', 'Unit 9: Yes, I can!', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 9: Yes, I can!' AND level=2) AS _kn), '英语', '一年级', 'Unit 9: Yes, I can!', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 9: Yes, I can!' AND level=2) AS _kn), '英语', '一年级', 'Unit 9: Yes, I can!', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 9: Yes, I can!' AND level=2) AS _kn), '英语', '一年级', 'Unit 9: Yes, I can!', '项目任务（Big/Small task）', 3, 4);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND level=1) AS _kn), '英语', '一年级', 'Unit 10: Fun numbers', 'Unit 10: Fun numbers', 2, 10);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 10: Fun numbers' AND level=2) AS _kn), '英语', '一年级', 'Unit 10: Fun numbers', '核心词汇（Topic words）', 3, 1);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 10: Fun numbers' AND level=2) AS _kn), '英语', '一年级', 'Unit 10: Fun numbers', '核心句型（Key sentences）', 3, 2);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 10: Fun numbers' AND level=2) AS _kn), '英语', '一年级', 'Unit 10: Fun numbers', '歌曲与儿歌（Song & rhyme）', 3, 3);
INSERT INTO knowledge_nodes (parent_id, subject, grade, chapter, name, level, sort_order) VALUES
  ((SELECT id FROM (SELECT id FROM knowledge_nodes WHERE subject='英语' AND grade='一年级' AND name='Unit 10: Fun numbers' AND level=2) AS _kn), '英语', '一年级', 'Unit 10: Fun numbers', '项目任务（Big/Small task）', 3, 4);
