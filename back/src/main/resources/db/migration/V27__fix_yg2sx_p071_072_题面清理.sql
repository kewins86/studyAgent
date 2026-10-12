-- V27: 清理 p071-p072 分类题 content 中的「图意待补」占位注释
-- V26 已补 7431-7437 的 answer/analysis/tags，本题清理 stem 残留的内部占位文字，
-- 换成面向学生的提示语，避免展示脏文字与统计误判

UPDATE questions
SET content = '{"stem":"看图，把每行不是同类的圈起来。","options":null}'
WHERE id = 7431;

UPDATE questions
SET content = '{"stem":"分一分（填序号）：玩具（ ）、文具（ ）、服装鞋帽（ ）。","options":null}'
WHERE id = 7432;

UPDATE questions
SET content = '{"stem":"按水果种类分一分，填个数：桃子（ ）个、苹果（ ）个、梨（ ）个。","options":null}'
WHERE id = 7433;

UPDATE questions
SET content = '{"stem":"按卡片形状分一分，填个数：三角形（ ）张、正方形（ ）张、圆（ ）张。","options":null}'
WHERE id = 7434;

UPDATE questions
SET content = '{"stem":"按图形分一分填个数：正方形（ ）个、长方形（ ）个、三角形（ ）个、圆（ ）个、正方体（ ）个、长方体（ ）个、圆柱（ ）个。","options":null}'
WHERE id = 7435;

UPDATE questions
SET content = '{"stem":"分好了吗？还可以怎样分？请你动手试一试。","options":null}'
WHERE id = 7436;

UPDATE questions
SET content = '{"stem":"逐层分类：观察图中图形，按由大到小的类别逐层分类，写出每层图形所含序号及各类个数。","options":null}'
WHERE id = 7437;