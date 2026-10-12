-- V19: 题目图片字段
-- 试卷/练习册中「涉图题」保留图片：images 存图片 URL 数组的 JSON 串，如 ["/static/qimg/xxx.jpg"]
-- 图片物理存放于后端静态目录 back/src/main/resources/static/question_images/，经 /static/qimg/<file> 访问
-- 依赖: V1(questions 表) 已存在；V11(reviewed 列) 已先执行
ALTER TABLE questions ADD COLUMN images TEXT NULL COMMENT '涉图题图片URL数组JSON，如 ["/static/qimg/xxx.jpg"]';
