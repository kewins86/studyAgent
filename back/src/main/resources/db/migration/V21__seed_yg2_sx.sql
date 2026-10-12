-- V21: 一卷搞定（新）-上海2上数学（118页，二年级）入库
-- 来源: paper（扫描PDF，本地 macOS Vision OCR 抽文字，手工转写）
-- 依赖: V1(questions 表), V19(images 列), knowledge_nodes 已存在 数学/二年级/level=1 根节点
-- 转写规则: 纯计算/比大小/文字填空/应用题 由助手按语境还原运算符并自算答案；
--          看图/方框逻辑/价目表等 OCR 无法还原者，answer/analysis 标 【图意待补】，images=NULL。
-- node_id 统一挂 (subject='数学', grade='二年级', level=1) 根节点。
-- 本文件按卷、按页、按题号顺序追加；每卷结束有分隔注释。

-- ==================== 第一单元 100以内数的加减法（二）基础测试卷 (p005-p008) ====================

-- 一、直接写出得数（12分） type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"43+9=","options":null}', '52', '直接计算：43+9=52', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"54-18=","options":null}', '36', '直接计算：54-18=36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"7+36=","options":null}', '43', '直接计算：7+36=43', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"23+35=","options":null}', '58', '直接计算：23+35=58', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"53+47=","options":null}', '100', '直接计算：53+47=100', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"72-50=","options":null}', '22', 'OCR 运算符缺失，按加减法语境复原为 72-50=22', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"68+9=","options":null}', '77', '直接计算：68+9=77', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"78+4=","options":null}', '82', '直接计算：78+4=82', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"56-20=","options":null}', '36', '直接计算：56-20=36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"62-39=","options":null}', '23', '直接计算：62-39=23', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"25+40=","options":null}', '65', '直接计算：25+40=65', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"45+8=","options":null}', '53', 'OCR 识别为 45十8，复原为 45+8=53', 'paper', '[]', NULL, 0);

-- 二、用竖式计算（18分） type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"68-47=","options":null}', '21', '竖式计算：68-47=21', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"80-21=","options":null}', '59', '竖式计算：80-21=59', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"73-56=","options":null}', '17', 'OCR 运算符缺失，复原为 73-56=17', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"81-32-27=","options":null}', '22', 'OCR 运算符缺失，复原为 81-32-27=22', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"43+39-56=","options":null}', '26', 'OCR 运算符缺失，复原为 43+39-56=26', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"94-49+21=","options":null}', '66', 'OCR 运算符缺失，复原为 94-49+21=66', 'paper', '[]', NULL, 0);

-- 三、填空题（32分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"比47多19的数是（ ），比40少8的数是（ ），72比（ ）少10。","options":null}',
 '66；32；62', '47+19=66；40-8=32；72-10=62', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在每组得数大的算式后面画“√”。（算式对，OCR 未完整识别运算符，图意待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填入“＞”“＜”或“=”：\\n36-7○26　78-19○69　30-8○51-29　9+62○69　32-18○50　99-45○45+9","options":null}',
 '＞；＜；=；＞；＜；=', '36-7=29＞26；78-19=59＜69；30-8=22，51-29=22，相等；9+62=71＞69；32-18=14＜50；99-45=54，45+9=54，相等', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"算一算，填一填。（方框序列 OCR 未识别，图意待补；卷：第一单元基础 p005-p008）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如果“68-3□”是一道退位减法算式，那么差是（ ）。","options":null}',
 '29（此时□=9）', '退位减法要求个位 8＜□，故□=9，68-39=29', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"填表：\\n《数学故事》原有53本、借出25本、还剩（ ）本；\\n《童话大王》原有（ ）本、借出26本、还剩14本；\\n《森林王国》原有60本、借出（ ）本、还剩3本。","options":null}',
 '28；40；57', '53-25=28；26+14=40；60-3=57', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"看图填空：小林有42张画片，小丽有28张画片。小林比小丽多（ ）张画片，小林送给小丽（ ）张画片后，两人的画片就同样多。","options":null}',
 '14；7', '42-28=14；14÷2=7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"已知□-□=64，则□=（ ），△=（ ）。（相同的图形代表相同的数，图意待补：方框与图形 OCR 未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 四、森林医生（对的打√，错的打×并改正） type=判断
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"森林医生：判断下列各题是否正确，错的打“×”并改正。（题目算式 OCR 未完整识别，图意待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 五、看图列式计算（4分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算。（图意待补：已知 56个、24个、46只、19只 等分组信息，具体图示待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 六、解决问题（28分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"学校足球社需要招25人，现在招了9人，还差多少人？","options":null}',
 '16人', '25-9=16（人）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"菜市场原来有83个冬瓜，运走了35个，现在有多少个冬瓜？","options":null}',
 '48个', '83-35=48（个）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"欢欢拿50元买礼物，找回了29元。买这份礼物花了多少元？","options":null}',
 '21元', '50-29=21（元）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"车上原来有86人，下来24人，又上去了19人，现在车上有多少人？","options":null}',
 '81人', '86-24+19=81（人）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小小商店：台灯25元、文具盒2元、闹钟52元。买一盏台灯、一个文具盒和一个闹钟，一共需要多少元？","options":null}',
 '79元', '25+2+52=79（元）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小小商店：一个书包比一辆玩具汽车贵29元。一辆玩具汽车多少元？","options":null}',
 '17元', '书包46元，玩具汽车17元，46-17=29。', 'paper', '[]', '["paper_png/yg2_sx/p008.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小小商店：买了一个足球和一个文具盒，付给售货员100元，应找回多少元？","options":null}',
 '30元', '足球68元，文具盒2元。100-68-2=30（元）。', 'paper', '[]', '["paper_png/yg2_sx/p008.png"]', 0);

-- ==================== 第一单元 100以内数的加减法（二）拓展提高卷 (p009-p012) ====================

-- 一、直接写出得数（12分） type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"75+9=","options":null}', '84', '直接计算：75+9=84', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"43-7=","options":null}', '36', 'OCR 将减号识为“一”，复原为 43-7=36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"85-30=","options":null}', '55', '直接计算：85-30=55', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"60-30+8=","options":null}', '38', '直接计算：60-30+8=38', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"68-33=","options":null}', '35', '直接计算：68-33=35', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"75-8=","options":null}', '67', 'OCR 运算符缺失，按加减法语境复原为 75-8=67', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"29+40=","options":null}', '69', '直接计算：29+40=69', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"28+4+40=","options":null}', '72', '直接计算：28+4+40=72', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"61+25=","options":null}', '86', '直接计算：61+25=86', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"100-33=","options":null}', '67', '直接计算：100-33=67', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"75-38=","options":null}', '37', '直接计算：75-38=37', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"52-5-30=","options":null}', '17', 'OCR 运算符缺失，按加减法语境复原为 52-5-30=17', 'paper', '[]', NULL, 0);

-- 二、用竖式计算（18分） type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"96-54=","options":null}', '42', '竖式计算：96-54=42', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"83-38=","options":null}', '45', '竖式计算：83-38=45', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"90-56=","options":null}', '34', 'OCR 将减号识为“一”，复原为 90-56=34', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"60-19-37=","options":null}', '4', '竖式计算：60-19-37=4', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"35+55-76=","options":null}', '14', 'OCR 运算符缺失，复原为 35+55-76=14', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"71-34+26=","options":null}', '63', 'OCR 运算符缺失，复原为 71-34+26=63', 'paper', '[]', NULL, 0);

-- 三、填空题（32分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"47再加（ ）就和60同样大，（ ）比51多8。","options":null}',
 '13；59', '60-47=13；51+8=59', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填入“＋”或“－”：\n81○7=74　54○9=45　35○5=40　46○6=52　63○7=56　83○8=84○9","options":null}',
 '－；－；＋；＋；－；－（最后 83-8=84-9=75）', '81-7=74；54-9=45；35+5=40；46+6=52；63-7=56；83-8=84-9=75', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"算一算，填一填。（方框序列 OCR 未识别，图意待补；卷：第一单元拓展 p009-p012）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"80-□>76，□里最大填（ ）；73-□=6□，□里最小填（ ）。","options":null}',
 '3；4', '80-□>76→□<4，最大填3；73-□=6□（6□为60~69），□最小则右边最大69，73-□=69→□=4', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"连环画40本，故事书56本。故事书与连环画相差（ ）本，故事书给连环画（ ）本后，两种书的本数同样多。","options":null}',
 '16；8', '56-40=16；16÷2=8', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"有48名同学参加文化节演出，每人至少参加大合唱和集体舞中的一项。其中有33人表演大合唱，28人表演集体舞，两项都参加的有（ ）人。","options":null}',
 '13', '容斥：33+28-48=13（人）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"在同一个算式的括号里填上相同的数。（方框逻辑 OCR 未完整识别，图意待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"一个两位数，将它的十位数字和个位数字对调，得到的数比原来的数大27，这样的两位数可以是（ ）。","options":null}',
 '14、25、36、47、58、69（答案不唯一）', '设原数10a+b，对调10b+a，差9(b-a)=27→b-a=3，故14/25/36/47/58/69', 'paper', '[]', NULL, 0);

-- 四、选择题（8分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"计算“55-3□”时，□里填（ ）要退位。","options":["①6、7、8、9","②5","③0、1、2、3、4"]}',
 '①', '退位要求个位 5<□，故□>5，即6、7、8、9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"学校体育器材室有57个篮球，____。足球有多少个？根据算式“57-18=39（个）”选择的合适信息是（ ）。","options":["①足球比篮球少18个","②足球比篮球多18个","③足球有18个"]}',
 '①', '57-18=39，说明足球比篮球少18个', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"端午节实践活动，一、二年级参加人数（每人只参加一个项目）：一年级做香囊27人、包粽子18人；二年级做香囊36人、包粽子？人。二年级至少要有（ ）人参加“包粽子”项目，总人数才能超过一年级。","options":["①9","②45","③10"]}',
 '③', '一年级共27+18=45；二年级做香囊36，要36+x>45→x>9→至少10', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"根据右边的减法竖式，可以知道△和○的大小关系是（ ）。（竖式 OCR 未识别，图意待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 五、看图列式计算（6分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算。（图意待补：含 15元/32米/43元/18朵 等图文信息，具体图示待补）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 六、解决问题（24分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"张大叔家饲养了三种兔子：灰兔33只、白兔46只、黑兔？只。（1）白兔比灰兔多多少只？","options":null}',
 '13只', '46-33=13（只）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"张大叔家饲养了三种兔子：灰兔33只、白兔46只、黑兔？只。（2）黑兔比白兔少29只，黑兔有多少只？","options":null}',
 '17只', '46-29=17（只）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"乐乐想买一个足球（43元），还差5元。乐乐带了多少元？","options":null}',
 '38元', '43-5=38（元）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"购物：玩具飞机、玩具熊、玩具汽车、文具盒标价 OCR 未识别（图意待补）。（1）玩具飞机比玩具熊贵多少元？（2）玩具汽车+文具盒付50元找回3元，玩具汽车多少元？（3）提出其他数学问题并解答。","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"三只动物一共收了91根玉米。小熊收了36根、小猴收了28根、狐狸收了？根。狐狸收了多少根？","options":null}',
 '27根', '91-36-28=27（根）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"天天原来有27支铅笔，给聪聪8支铅笔后两人的铅笔就一样多了。聪聪原来有多少支铅笔？","options":null}',
 '11支', '27-8=19（支），聪聪现有19支，原有19-8=11（支）', 'paper', '[]', NULL, 0);

-- ==================== 第二单元 欢乐购物街 基础测试卷 (p013-p016)  【认识人民币，图依赖高，占位多】 ====================

-- 一、连一连（8分） type=连线（图意待补：硬币与面值配对）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '连线', 2,
 '{"stem":"连一连：把左边的人民币与右边对应的钱数连起来。（图意待补：硬币/纸币图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 二、填空题（29分）
-- #1 写出钱数（图意待补：硬币图像）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"写出下面的钱数：（ ）元（ ）角；（ ）元（ ）角。（图意待补：硬币组合图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- #2 单位换算（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"5元=（ ）角；26分=（ ）角（ ）分；7元4角=（ ）角；1元=（ ）角=（ ）分","options":null}',
 '50；2、6；74；10、100', '5元=50角；26分=2角6分；7元4角=74角；1元=10角=100分', 'paper', '[]', NULL, 0);
-- #3 换钱（图意待补：纸币面额图像）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"换钱：（1）一张□可以换（ ）枚□，也可以换（ ）张□；（2）一张□可以换（ ）张□，也可以换（ ）张□，还可以换（ ）张□。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- #4 比大小（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填入“＞”“＜”或“=”：\n4元○50角　38角○60分　3元2角○10角　1元2角○2元1角　15角○15分　56角○5元6角","options":null}',
 '＜；＞；＞；＜；＞；＝', '4元=40角<50角；38角=380分>60分；3元2角=32角>10角；1元2角=12角<21角；15角>15分；56角=5元6角', 'paper', '[]', NULL, 0);
-- #5 购物应付（图意待补：物品-价格对应）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"购物：根据物品价格算出应付的钱。（图意待补：物品与价格对应图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- #6 书包58元用10元付几张（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小海要买一个58元的书包，如果只用10元的人民币付款，那么要付（ ）张。","options":null}',
 '6', '58÷10=5…8，需6张（共60元）', 'paper', '[]', NULL, 0);

-- 三、选择题（8分） type=单选（纸币图像未识别，均图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"这些钱正好能买下面的（ ）。（图意待补：所给硬币图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"欢欢买一个玩具要付8元4角，下面付钱方式正确的是（ ）。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"妈妈用一张□买一个玩具，找回6元，这个玩具（ ）。（图意待补：纸币面额图像未识别）","options":["①40元","②44元","③46元"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"乐乐买了一个书包，付了3张□，找回的钱比5元多，比10元少。书包的价格可能是（ ）。（图意待补：纸币面额图像未识别）","options":["①55元","②53元","③50元"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 四、判断题（10分） type=判断
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"一张□可以换5张□。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"小红买一本16元的故事书，她付了两张8元的人民币。（ ）","options":null}',
 '√', '8+8=16（元），正好付清', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"5张10元的钱和10张5元的钱同样多。（ ）","options":null}',
 '√', '5×10=50（元），10×5=50（元），同样多', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"一只玩具狗的价钱是9元，我付了一张□，找回的钱比10元少。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"妈妈买白菜用去3元，买萝卜用去9元，一共花了12角。（ ）","options":null}',
 '×', '3+9=12（元），不是12角', 'paper', '[]', NULL, 0);

-- 五、算一算（12分） type=计算（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"算一算：\n9角-4角=（ ）角　8角+3角=（ ）元（ ）角　1元-3角=（ ）角\n2元7角-7角=（ ）元　6元+8元=（ ）元　3角+4元2角=（ ）元（ ）角","options":null}',
 '5；1、1；7；2；14；4、5', '9-4=5角；8+3=11角=1元1角；10-3=7角；27-7=20角=2元；6+8=14元；3角+42角=45角=4元5角', 'paper', '[]', NULL, 0);

-- 六、把买左边商品要用的钱圈起来（8分） type=操作（图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"把买左边商品要用的钱圈起来。（图意待补：商品与钱币图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 七、解决问题（25分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"想一想，算一算：买一个羽毛球和一本笔记本，应付（ ）元（ ）角；足球比文具盒贵（ ）元。（图意待补：物品-价格对应图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"物品标价：8元、25元、4元、4元8角、32元。芳芳有40元，正好可以买（ ）和（ ）两件物品。","options":null}',
 '8元、32元', '8+32=40（元），正好', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"买玩具（价：36元、5元5角、12元、3元5角）。（1）乐乐买玩具汽车付两张□应找回几元；（2）小华买玩具狗付一张□还差几元。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"文具商店（价：1角、8角、5角、1元2角、2角、6元5角、1元、19元8角）。（1）买一块橡皮、一把尺子和一支铅笔需几元几角；（2）买笔记本+文具盒+画笔付17元应找回几角；（3）提出一个数学问题并解答。（图意待补：物品-价格对应图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"明明有5元、10元、20元的人民币各5张，他要买一只25元的玩具熊，有哪几种付钱方式可以正好付清？","options":null}',
 '4种：20元+5元；10元+10元+5元；10元+5元+5元+5元；5元×5', '25元组合：20+5；10+10+5；10+5+5+5；5×5（每种≤5张）', 'paper', '[]', NULL, 0);

-- ==================== 第二单元 欢乐购物街 拓展提高卷 (p017-p020) ====================

-- 一、填空题（35分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"看图填空：（ ）元（ ）角；（ ）元（ ）角。（图意待补：人民币图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"换钱：（1）1张□可以换（ ）张□和（ ）张□；（2）1张□可以换（ ）张□或（ ）张□，还可以换（ ）张□和（ ）张□。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"8元3角=（ ）角；52角=（ ）元（ ）角；100分=（ ）角=（ ）元；6角7分-4角2分=（ ）角（ ）分；7元-6角=（ ）元（ ）角；3元8角+5元1角=（ ）元（ ）角；9元-2元4角=（ ）元（ ）角；7元4角-1元2角=（ ）元（ ）角","options":null}',
 '83；5、2；10、1；2、5；6、4；8、9；6、6；6、2', '8元3角=83角；52角=5元2角；100分=10角=1元；6角7分-4角2分=2角5分；7元-6角=6元4角；3元8角+5元1角=8元9角；9元-2元4角=6元6角；7元4角-1元2角=6元2角', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"买文具：根据物品价格填写应付的钱、付的钱、找回的钱。（图意待补：物品-价格对应及表格图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"小海买一架65元的物品，付的都是□，最少应该付（ ）张；如果付的都是□，那么最少应该付（ ）张。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"买这个书包，乐乐付了4张□，找回的钱比10元少，这个书包（ ）元。（图意待补：纸币面额图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 二、选择题（10分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"用1元正好可以买下面的（ ）。（图意待补：物品与价格图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"欢欢付出20元买了下面的两件不同的文具，（ ）没有买。（图意待补：物品与价格图像未识别）","options":["①12元","②16元","③5元"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"小亮带了2张□和3张□的纸币去买文具盒。超市阿姨说：“还差1元就够了。”要买一个文具盒需要（ ）。（图意待补：纸币面额图像未识别）","options":["①12元","②13元","③14元"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"有一些硬币，一共2元2角，至少有（ ）枚。","options":["①4","②5","③6"]}',
 '①', '22角最少枚数：尽量用大面额，1元+1元+1角+1角=4枚（或1元+5角+5角+2×1角），至少4枚', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"乐乐有相同数量的5元和1元纸币若干张，乐乐可能有（ ）。","options":["①28元","②38元","③48元"]}',
 '③', '5n+1n=6n，48=6×8，故48元（8张5元+8张1元）', 'paper', '[]', NULL, 0);

-- 三、判断题（10分） type=判断（全可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"65角与5元6角同样多。（ ）","options":null}',
 '×', '65角=6元5角，5元6角=56角，不等', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"妈妈给小明一张3元的人民币去买铅笔。（ ）","options":null}',
 '×', '人民币没有3元面额', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"妈妈给小华买了一个生日蛋糕，花了48元，妈妈给售货员2张20元的、1张5元和3张1元的，钱正好够。（ ）","options":null}',
 '√', '20×2+5+1×3=48（元），正好', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"17元8角+19角=36元8角。（ ）","options":null}',
 '×', '17元8角+19角=19元7角，不是36元8角', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"从一些1元和5元的纸币中拿走10元，共有3种不同的拿法。（ ）","options":null}',
 '√', '10元=5+5=5+1×5=1×10，共3种', 'paper', '[]', NULL, 0);

-- 四、哪两种物品价格合起来是10元？连一连（8分） type=连线（可重建）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '连线', 2,
 '{"stem":"哪两种物品的价格合起来是10元？连一连。\n（物品价：9元5角、1元、4元5角、5角、2元、9元、5元5角）","options":null}',
 '9元5角+5角；1元+9元；4元5角+5元5角（2元无配对）', '两两相加=10元：9.5+0.5；1+9；4.5+5.5', 'paper', '[]', NULL, 0);

-- 五、想一想，填一填（6分） type=解答（可重建）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小明要买一辆玩具车和一架玩具飞机（价：28元、60元），他可以怎样付钱？（写两种方法，可用纸币：50元、20元、10元、5元、1元）","options":null}',
 '玩具车28元：20+5+1×3（或10+10+5+1×3）；玩具飞机60元：50+10（或20×3、20+20+10+10）', '用给定面额凑出28与60', 'paper', '[]', NULL, 0);

-- 六、解决问题（31分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"购物（价：2元、10元5角、5角、30元、60元）。（1）买一块橡皮和一个订书机，要（ ）元（ ）角；（2）买两样不同的东西最少要花（ ）元（ ）角；（3）篮球比铅笔贵（ ）元（ ）角；（4）小丽买一盏台灯和一块橡皮，付50元应找回（ ）元。（图意待补：物品-价格对应图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"玩具店（价：34元、？元、59元）。（1）一个篮球的价格比一个乒乓球拍和一个玩具熊的总价格便宜26元，一个篮球多少钱？可以怎样付钱？（图意待补：球拍/玩具熊价格图像未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"玩具店（价：34元、？元、59元）。（2）小天买一件商品，付给售货员100元，找回41元，小天买的是什么商品？","options":null}',
 '59元的商品', '100-41=59（元）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小红和小华一起来买书，她们想买一本连环画。小红差2元4角，小华差3元6角。两人的钱合起来，刚好可以买这本连环画。买这本连环画需要多少钱？","options":null}',
 '6元', '书价=小红差+小华差=2.4+3.6=6（元）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"妈妈给了宁宁10元零花钱。猜一猜，这10元钱可能是哪些纸币组成的？（写出四种）","options":null}',
 '四种：10元×1；5元+5元；5元+1元×5；1元×10', '10元的不同纸币组合', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"红红有一些10元、5元、1元、5角、1角的人民币，她想买一本11元2角的故事书，她可以怎样付钱？（至少写两种方法）","options":null}',
 '两种：10元+1元+1角+1角；5元+5元+1元+1角+1角（或10元+5角×2+1角×2等）', '凑11元2角', 'paper', '[]', NULL, 0);

-- ==================== 第三单元 表内乘法 基础测试卷 (p021-p024) ====================

-- 一、直接写出得数（12分） type=计算（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"直接写出得数：\n7×7=　48+8=　9×5-8=　6×6+6=　20+17=　1×8+18=\n3×4=　82-50=　74-34=　90-6=　56-7+9=　63+25+17=","options":null}',
 '49；56；37；42；37；26；12；32；40；84；58；105', '7×7=49；48+8=56；9×5-8=37；6×6+6=42；20+17=37；1×8+18=26；3×4=12；82-50=32；74-34=40；90-6=84；56-7+9=58；63+25+17=105', 'paper', '[]', NULL, 0);

-- 二、填空题（35分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"上图表示（ ）个（ ）相加，列加法算式为（ ），列乘法算式为（ ）或（ ），乘法口诀是（ ）。（图意待补：点子图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"2个9相加，和是（ ）；2个9相乘，积是（ ）。","options":null}',
 '18；81', '2×9=18；9×9=81', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"从2、3、4、5、6、12、24中选出3个数，写出3个不同的乘法算式。","options":null}',
 '3×4=12；4×6=24；2×12=24（答案不唯一）', '用给定数组成积在集合内的乘法算式', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填入“＞”“＜”或“=”：\n5×4○24　2×4○3×3　19○6×3　4×3○3+4　20○5×5　5×6○6×5","options":null}',
 '＜；＜；＞；＞；＜；＝', '5×4=20<24；2×4=8<9=3×3；19>18=6×3；12>7；20<25；30=30', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填入“+”“-”或“×”：\n4○4=16　2○2=4　2○9=6○3　6○3=18　9×9○9=9×10　25○5=30","options":null}',
 '×；+（或×）；×、×；×；+；+', '4×4=16；2+2=4（或2×2）；2×9=6×3=18；6×3=18；81+9=90=9×10；25+5=30', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在□内填入合适的数：\n2+2+2+4=□×2；4×□=8×□（开放）；3+6+9=□×3。","options":null}',
 '2+2+2+4=5×2；4×2=8×1（答案不唯一）；3+6+9=6×3', '2+2+2+4=10，10÷2=5，故5×2；4×2=8×1（开放题，答案不唯一，最简整数解）；3+6+9=18，18÷3=6，故6×3。', 'paper', '[]', NULL, 0);

-- 三、选择题（10分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"用画图的方法表示“3×2”，不正确的是（ ）。（图意待补：图形选项未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下列口诀中，只能写出一个乘法算式的是（ ）。","options":["①三四十二","②七七四十九","③五六三十"]}',
 '②', '七七四十九只有7×7一个算式；三四十二可写3×4与4×3；五六三十可写5×6与6×5', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面算式中，结果与5×4相同的是（ ）。","options":["①3×5+5","②4×5-4","③4×5+4"]}',
 '①', '5×4=20；3×5+5=20；4×5-4=16；4×5+4=24', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"在“□×4<16”中，□里最大能填（ ）。","options":["①4","②3","③9"]}',
 '②', '□×4<16 → □<4，最大填3', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"不能用算式“3×6=18”解决的实际问题是（ ）。","options":["①每盒有6瓶牛奶，3盒有多少瓶","②一个货架有6罐饮料，另一个货架有3罐，共多少罐","③蚂蚁一分钟爬6米，3分钟爬多少米"]}',
 '②', '②是6+3=9，不是3个6；①③都是3×6', 'paper', '[]', NULL, 0);

-- 四、作图题（16分） type=操作/连线
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"照样子，画一画：3×2、4×3、5×4。（图意待补：需画点子图）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '连线', 2,
 '{"stem":"连一连：左边 5×3、3乘2、6个2相加、3+3、2×3 与右边 5乘3、6×2、6+6、3+3+3+3+3、5+5+5、3个2相加 中相等的相连。","options":null}',
 '5×3—5乘3—5+5+5—3+3+3+3+3；3乘2—2×3—3个2相加—3+3；6个2相加—6×2—6+6', '同值表达式相连', 'paper', '[]', NULL, 0);

-- 五、看图列式计算（7分） type=解答（图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算。（图意待补：图形/点子图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 六、解决问题（20分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"乘坐轿车。（1）每辆轿车可以坐5人，3辆这样的轿车一共可以坐多少人？","options":null}',
 '15人', '5×3=15（人）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"乘坐轿车。（2）有两辆轿车，一辆坐了5人，另一辆坐了3人，一共坐了多少人？","options":null}',
 '8人', '5+3=8（人）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"缝纫工王阿姨负责给衣服钉扣子，每件衣服需要5个扣子，8件衣服需要多少个扣子？","options":null}',
 '40个', '5×8=40（个）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"搭6个这样的图形，要多少个？（图意待补：图形未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"二（1）班同学去郊游，租了5辆面包车，每辆面包车坐6人，所有人都上车后还有2个空座位。这次一共去了多少人？","options":null}',
 '28人', '5×6-2=28（人）', 'paper', '[]', NULL, 0);

-- ==================== 第三单元 表内乘法 拓展提高卷 (p025-p028) ====================

-- 一、直接写出得数（12分） type=计算（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"直接写出得数：\n6×9=　64-8=　4×8=　7×4+7=　8×6=　7×9=\n43+8=　9×2+36=　22+48=　40+6×2=　3×7=　9×4=","options":null}',
 '54；56；32；35；48；63；51；54；70；52；21；36', '6×9=54；64-8=56；4×8=32；7×4+7=35；8×6=48；7×9=63；43+8=51；9×2+36=54；22+48=70；40+12=52；3×7=21；9×4=36', 'paper', '[]', NULL, 0);

-- 二、填空题（30分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"如图，要求一共有多少个桃子，可以列算式（ ）。（图意待补：桃子图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"9个7相加的和是（ ），可以写成乘法算式（ ）或（ ），口诀是（ ）。","options":null}',
 '63；9×7；7×9；七九六十三', '9个7相加=63', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"两个相同加数的和是18，这两个数的积是（ ）。","options":null}',
 '81', '18÷2=9，9×9=81', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大能填几？\n（ ）×8≤65　30＞5×（ ）　53＞（ ）×9\n（ ）×6≤27　4×（ ）≤15　35＞7×（ ）","options":null}',
 '8；5；5；4；3；4', '8×8=64≤65；5×5=25<30；9×5=45<53；6×4=24≤27；4×3=12≤15；7×4=28<35', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"看得数写乘法算式（每个写2道）：36、18。","options":null}',
 '36：4×9、6×6（或9×4）；18：2×9、3×6（或9×2、6×3）', '积为36与18的乘法算式', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把10米长的木头锯成4段，每锯一次要2分钟，一共需要（ ）分钟。","options":null}',
 '6', '锯4段需锯3次，3×2=6（分）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"有23根小棒，要摆5个这样独立的图形，还差（ ）根小棒。（图意待补：单图形所需小棒数未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"二（1）班同学排成正方形的队伍参加表演。从前、后、左、右数，小明都是排第4，参加表演的共有（ ）人。","options":null}',
 '49', '每边4+4-1=7人，7×7=49人', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"张叔叔在一个正方形池塘的四周种树，每条边上都种了5棵树，张叔叔最少种了（ ）棵树。","options":null}',
 '16', '4边×5-4角重复=16棵', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"爷爷买了一筐苹果，个数比20多、比30少，4个4个地数多2个，5个5个地数少3个，一共有（ ）个苹果。","options":null}',
 '22', '22÷4=5余2，22÷5=4余3（即少3），且20<22<30', 'paper', '[]', NULL, 0);

-- 三、选择题（10分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"积是27的算式是（ ）。","options":["①9+9+9","②20+7","③9×3"]}',
 '③', '9×3=27是积；①②都是和', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面不能用“二四得八”计算解决的问题是（ ）。（图意待补：图形选项未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面能用算式“3×4-1”计算的是（ ）。（图意待补：图形选项未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"如图，每两面旗间隔6米，从第1面旗到第6面旗间隔（ ）。","options":["①30米","②36米","③42米"]}',
 '①', '第1到第6面有5个间隔，5×6=30米', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"乐乐用围棋子摆出下面三个图案。如果像这样摆下去，第5个图案一共要用（ ）围棋子。（图意待补：图案规律图未识别）","options":["①13枚","②17枚","③21枚"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 四、作图题（12分） type=操作（图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"圈一圈，分别用两种方法在图中表示“3×6”。（图意待补：需圈画）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '连线', 2,
 '{"stem":"连一连：2×9+10、26+14、3+34+9、6×9+9 分别与右边相等的算式相连。（图意待补：OCR右侧算式识别不全）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 五、看图列式计算（6分） type=解答（图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算。（图意待补：图形未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 六、解决问题（20分） type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"东东家一共养了8只兔子，每只兔子每天吃9根胡萝卜，8只兔子每天要吃多少根胡萝卜？","options":null}',
 '72根', '8×9=72（根）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"如图，25人前来就餐，座位够吗？（图意待补：座位示意图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"欢欢从一楼到二楼用了7秒，按照这样的速度，从一楼到九楼，一共需要多少秒？","options":null}',
 '56秒', '1→9楼有8层，8×7=56（秒）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"庆祝“元旦”，同学们做了红、黄、绿、蓝四种颜色的花各9朵，还做了5朵紫色的花，一共做了多少朵花？","options":null}',
 '41朵', '4×9+5=41（朵）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"一种客车的座位示意图如下，二（3）班准备租这种车去参观博物馆。2位老师和30名学生，坐得下吗？（图意待补：座位示意图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 七、思考题（10分） type=解答（可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 4,
 '{"stem":"奇妙的“9”：2×9=18、1+8=9；3×9=27、2+7=9；4×9=36、□+□=□；5×9=□、□+□=9。根据你发现的规律，接着写出两组。","options":null}',
 '4×9=36，3+6=9；5×9=45，4+5=9；续写：6×9=54，5+4=9；7×9=63，6+3=9', '9的乘法：积的个位+十位=9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 4,
 '{"stem":"一群猫和一群狗进行拔河比赛，虽然猫比狗多8只，但最终双方打成平手。如果2只猫与1只狗的力气相等，那么共有（ ）只猫。","options":null}',
 '16只', '设狗d只、猫c只：c=d+8，且0.5c=d（力气相等），解得c=16', 'paper', '[]', NULL, 0);

-- ==================== 第四单元 我的学校我的家（方向与位置） 基础测试卷 (p029-p032) ====================

-- 一、填空题（50分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"地图或平面图通常按上（ ）、下（ ）、左（ ）、右（ ）绘制。","options":null}',
 '北；南；西；东', '地图通用方向规则：上北下南左西右东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"早晨，当你面对太阳时，你的左边是（ ）面，右边是（ ）面，背对着的是（ ）方。","options":null}',
 '北；南；西', '早晨太阳在东，前东→左北右南，背面西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"面对北极星时，我们的前面是（ ）面，后面是（ ）面，左边是（ ）面，右边是（ ）面。","options":null}',
 '北；南；西；东', '北极星在正北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"傍晚太阳落山时，面对夕阳，你的右面是（ ）面，左面是（ ）面。","options":null}',
 '北；南', '傍晚太阳在西，面向西→左南右北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"刮东风时，烟囱里冒出的烟飘向（ ）面；刮南风时，小树向（ ）面弯腰。","options":null}',
 '西；北', '风从东来吹向西；风从南来吹向北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"丽丽家在学校的东面，丽丽去上学要向（ ）面走。","options":null}',
 '西', '家在东，上学回学校即向西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"体育课上，小明面朝东而站，老师让他向左转，他转后应该面朝（ ）而站。","options":null}',
 '北', '面东左转90°→北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小海和乐乐面对面站立，小海面向北面，则乐乐面向（ ）面。","options":null}',
 '南', '面对面方向相反，北对南', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"看图填一填（含北指针的街区图：商业街、观景台、果园、清水河、政务中心、儿童城、银行、动物园、古塔）。\n（1）商业街在古塔的（ ）面，商业街在果园的（ ）面；\n（2）银行在清水河的（ ）面，古塔在银行的（ ）面；\n（3）政务中心在果园的（ ）面，果园在政务中心的（ ）面；\n（4）儿童城的北面有（ ），动物园的西面有（ ）和（ ）。（图意待补：地图各要素相对位置未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如图是小红家的平面图（卧室1、卧室2、客厅、厨房、阳台、卫生间等）。\n小红家卧室1在卧室2的（ ）面，厨房在卧室2的（ ）面；阳台的东面是（ ），客厅的南面是（ ）。（图意待补：平面图布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如图是某小学的平面图（校门、水池、食堂、教学楼、风雨操场、办公楼、花圃、操场）。\n（1）从校门向（ ）走到水池，再向（ ）走到食堂；\n（2）从风雨操场先向（ ）、再向（ ）走到办公楼（不经过教学楼），最后向（ ）走到花圃；\n（3）从食堂向西走到（ ），再向（ ）走到校门。（图意待补：平面图布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- 二、选择题（10分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"指南针是我国古代四大发明之一，不论把它放到地球上的什么地方，它总是一端指南，另一端指（ ）。","options":["①东","②北","③西"]}',
 '②', '指南针一端指南一端指北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"图书馆在学校的西面，学校在图书馆的（ ）面。","options":["①南","②北","③东"]}',
 '③', '西的对面是东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"一面彩旗随风飘扬，如果吹南风，彩旗就往（ ）方向飘。","options":["①南","②北","③西"]}',
 '②', '南风从南来吹向北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"傍晚，玲玲转头看到左侧有一轮红红的夕阳，玲玲正在往（ ）方向走。","options":["①东","②南","③北"]}',
 '③', '左侧为西→面朝北→往北走', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面说法错误的是（ ）。","options":["①北的对面是南","②在陌生的地方，知道东、西、南、北中的一个方向就能判断出其他三个方向","③面向早晨的太阳，你的右面是北"]}',
 '③', '面向东右面是南，不是北', 'paper', '[]', NULL, 0);

-- 三、判断题（10分） type=判断（全可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"在地图上的方向，上面是北方，右边是南方。（ ）","options":null}',
 '×', '上北右东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"周一升国旗时，琳琳面朝北向国旗敬礼，她的右面是东面。（ ）","options":null}',
 '√', '面北时左西右东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"我国四大发明之一的指南针，可以帮助人们辨认方向。（ ）","options":null}',
 '√', '指南针用途', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"教学楼在操场的西面，操场就在教学楼的东面。（ ）","options":null}',
 '√', '相对方向相反', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"小赵坐在东面，小钱坐在西面，小孙坐在南面，小孙和小赵是相对的。（ ）","options":null}',
 '×', '东与西相对，小孙在南，与小赵(东)不相对', 'paper', '[]', NULL, 0);

-- 四、操作题（30分） type=操作（画方向图，图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"在教学楼/办公楼/大门/图书室分别画到操场的北、西、南、东面。（图意待补：需在操场平面图上标注）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"在指定图形的南面、西面、东面分别画指定符号。（图意待补：需在图上按方向作画）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"根据描述，把建筑物序号标在适当位置：走进大门正北是办公楼，再往北是操场，大门东是教学楼，艺术楼和阶梯教室分别在操场西面和东面，图书馆东是大门，会议室东是办公楼，展览室西是办公楼。（图意待补：需在平面图标号）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第四单元 我的学校我的家（方向与位置） 拓展提高卷 (p033-p036) ====================

-- 一、填空题（44分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"古诗词中“恰似一江春水向东流”，这里的水是由（ ）面流向（ ）面。","options":null}',
 '东；西', '水性向东，由东流向西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"下午放学，贝贝朝着太阳方向走，他的后面是（ ）面，右面是（ ）面。","options":null}',
 '东；北', '下午太阳在西，前西→后东，左南右北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"爸爸开车向南行驶，在十字路口左转了，此时他向（ ）面行驶。","options":null}',
 '西', '面南左转→西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"傍晚，乐乐和同学一起看日落，这时他们面向（ ）方，右边是（ ）方。","options":null}',
 '西；北', '傍晚面西，左南右北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小海从家先向西走，又向北走。他想沿原路回家，应先向（ ）走，再向（ ）走。","options":null}',
 '南；东', '来路反向：北→南，西→东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"红红卧室示意图：推开卧室门正好面对窗户，窗户在南面墙上。\n（1）门在（ ）面的墙上；\n（2）床靠着（ ）面的墙，（ ）面的墙上挂着钟。","options":null}',
 '(1)北；(2)需卧室布局图（图意待补）', '窗户在南面墙上，门正对窗户，故门在北面的墙上。(2)需根据卧室布局图判断，图意待补。', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"看图填路线（含北指针的街区图：超市、笑笑家、少年宫、体育馆、书店、邮局、学校、乐乐家、明明家、植物园等）。\n（1）欢欢从家到邮局向（ ）走；明明从家到植物园向（ ）走；\n（2）笑笑从家到学校应先向（ ）走再向（ ）走；乐乐从家到学校应先向（ ）走再向（ ）走。（图意待补：地图相对位置未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"小朋友们面朝南站，先向右转1次，再向左转2次，这时他们面朝（ ）；如果再向后转3次，这时他们面朝（ ）。","options":null}',
 '东；西', '面南→右转1(西)→左转2(东)→向后转3次(西)', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"在野外，可以通过观察树的年轮来辨别方向。树的年轮较密处向着（ ）面，较疏处向着（ ）面。","options":null}',
 '北；南', '北半球年轮南疏北密', 'paper', '[]', NULL, 0);

-- 二、选择题（12分） type=单选
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"二（1）班黑板在教室的西面，那么老师讲课时面向（ ）面。","options":["①东","②南","③西"]}',
 '①', '黑板在西→老师面向东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"如图，1号楼在游泳池的北面，（ ）在游泳池的西面。（图意待补：泳池周边建筑图，OCR显示游泳池西侧为文化中心）","options":["①2号楼","②健身中心","③文化中心"]}',
 '③', '游泳池西侧是文化中心', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"刮了一夜北风，黄叶落了一地，落在（ ）面的黄叶多一些。","options":["①南","②西","③东"]}',
 '①', '北风从北来吹向南，叶落南面多', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"如图，小莉的房间窗户朝南。她的床在桌子的（ ）面。（图意待补：房间布局图未识别）","options":["①东","②西","③北"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"如图，乐乐从家去公园，先向东走，又向北走，最后再向东走到公园。乐乐行走的路线图是（ ）。（图意待补：三条路线选项图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"“立竿测日影”，影子在竹竿的西面，那么太阳在竹竿的（ ）面。","options":["①东","②西","③南"]}',
 '①', '影子与太阳方向相反', 'paper', '[]', NULL, 0);

-- 三、判断题（10分） type=判断（全可答）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"人的影子在西方，太阳应在东方。（ ）","options":null}',
 '√', '影子与太阳相反', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"在森林中可以利用树叶的疏密来识别方向。（ ）","options":null}',
 '√', '树叶南密北疏（受光差异）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"小红面向南时，她的左面是北面。（ ）","options":null}',
 '×', '面南左东右西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"一天早晨，丽丽面向镜子，在镜子中看到了正在升起的太阳，此时她的前面是东。（ ）","options":null}',
 '×', '镜中见东方日出说明她背后是东、面朝西，前面是西', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '判断', 2,
 '{"stem":"一条小河从西向东流，一群鱼逆流而上，鱼尾指向西面。（ ）","options":null}',
 '×', '逆流=向西游，头西尾东，鱼尾朝东', 'paper', '[]', NULL, 0);

-- 四、操作题（19分） type=操作（方向作图，图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"辨认方向：文文家在图书馆北面，苗家在医院东面，童童家在图书馆南面，童童家在乐乐家西面；苗苗家西面有（ ）和（ ），电影院在文文家（ ）面。（图意待补：街区平面图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"如图是玲玲家的房屋平面图，把房间名称标在适当位置：主卧在客厅东面；主卧在次卧南面；厨房和卫生间在客厅北面；卫生间在厨房东面。（图意待补：需在平面图标号）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"小兔子和小绵羊的棋子最后各跳到了什么地方？请画出来。（图意待补：棋盘与跳跃指令图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- （p036 五、解决问题 图意待补）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"早晨的时候，一列火车由山洞开来，请你判断一下火车是向东开还是向西开，为什么？请写出理由。（图意待补：火车与山洞朝向图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"根据二年级14个班教学楼紧急疏散平面图，回答：\n（1）7班师生应先向（ ）面走，再向（ ）面走；\n（2）9班师生应先向（ ）面走，再向（ ）面走；\n（3）10班师生应先向（ ）面走，再向（ ）面走；\n（4）若8班有火情，你该如何逃生并通知其他班级？（图意待补：楼层疏散平面图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第五单元 分类 基础测试卷 (p037-p040) —— 全卷看图分类，100% 图依赖，占位 ====================
-- 一、操作题（24分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"把每行中不同类的圈出来（共3行，每行若干物品图）。（图意待补：各行物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"在交通工具下面画“V”，在厨房用具下面画“〇”（一组物品图）。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"分一分，连一连（将物品按类别连线）。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 二、选择题（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"在若干物品图中，蔬菜有（ ）。①7种 ②6种 ③5种（图意待补：物品图未识别）","options":["①7种","②6种","③5种"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"与其他两个不同类的图形是（ ）。（图意待补：图形图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面各组物品中，两种不是同一类的是（ ）。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面分法正确的是（ ）。① ② ③（图意待补：分法示意图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"把下面铅笔分成两组，不可以（ ）。①按涂色和没涂色分 ②按长的和短的分 ③按削和没削分（图意待补：铅笔图未识别，需看图判断）","options":["①按涂色和没涂色分","②按长的和短的分","③按削和没削分"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"如图所示的图形按照形状分，可以分成（ ）类。①2 ②3 ③5（图意待补：图形图未识别）","options":["①2","②3","③5"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 三、分一分（64分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求分一分（填序号）：将①~⑩号物品分到 水果/玩具/文具 三类。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"分一分（填序号）：（1）分成两类；（2）分成三类。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求分一分：（1）按颜色分，填各类个数；（2）按形状分，填各类个数。（图意待补：图形图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"逐层分类：有把手/没有把手；盛水的/没有盛水的，填各类个数。（图意待补：容器图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"看图解答：（1）按不同活动分类（踢毽子/跳绳/玩皮球/打乒乓球）填人数；（2）分成两组，表示分组结果。（图意待补：活动图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第五单元 分类 拓展提高卷 (p041-p044) —— 全卷看图分类，100% 图依赖，占位 ====================
-- 一、选择题（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"和（ ）不同类的是（ ）。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"图形“S”按（ ）分类。①大小 ②形状 ③颜色（图意待补：图形图未识别）","options":["①大小","②形状","③颜色"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"将下面这些图形分类整理，不合理的方案是（ ）。①按照涂色和不涂色进行分类整理 ②按照三角形、圆和四边形进行分类整理 ③按照长方形、正方形和三角形进行分类整理（图意待补：图形图未识别，方案合理性依实际图形判断）","options":["①涂色不涂色","②三角圆四边形","③长方正方三角"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下图可以分为（ ）。①三角形和圆 ②立体图形和平面图形 ③正方形和圆（图意待补：图形图未识别）","options":["①三角形和圆","②立体和平面","③正方形和圆"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"给下面卡片分类，可以有（ ）种分法。①2 ②1 ③不确定（图意待补：卡片图未识别）","options":["①2","②1","③不确定"]}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 二、分一分（90分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把下面的物品放入合适的位置（填序号）。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求分一分（填序号）：（1）按形状分；（2）按点数分；（3）按颜色分。（图意待补：图形卡片图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求分一分：（1）按 动物/交通工具 填个数；（2）按 天上飞的/地上跑的/水里游的 填个数。（图意待补：物品图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按不同的标准分下面的图形。（图意待补：图形图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求填一填：（1）数出图形个数：长方形/三角形/圆/圆柱/长方体；（2）将上面的图形分成两大类。（图意待补：图形图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按要求逐层分类：形状（圆/三角形/正方形）张数；动物 张数。（图意待补：图形/动物图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"把下面这些花插在两个花瓶里，可以怎样分？（图意待补：花图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第六单元 数学广场 基础测试卷 (p045-p048) ====================
-- 一、直接写出得数（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n46+9=   30-6=   7×8=   5×4+2=\n5×3=   4+5=   75-68=   6×2-3=\n80-15=   4×2=   6×5=   4×4+12=","options":null}',
 '55；24；56；22；15；9；7；9；65；8；30；28', '逐题计算：46+9=55,30-6=24,7×8=56,5×4+2=22,5×3=15,4+5=9,75-68=7,6×2-3=9,80-15=65,4×2=8,6×5=30,4×4+12=28', 'paper', '[]', NULL, 0);
-- 二、用竖式计算（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n52-9=   92-67=   100-46=\n87-29+49=   54-46+32=   38+15+26=","options":null}',
 '43；25；54；107；40；79', '52-9=43,92-67=25,100-46=54,87-29+49=107,54-46+32=40,38+15+26=79（末题运算符OCR缺失，按+处理）', 'paper', '[]', NULL, 0);
-- 三、选择题（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面是幻方的是（ ）。（图意待补：三个3×3数字方阵图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"找规律：10、15、20、25、____。横线上应填（ ）。","options":["①40","②35","③30"]}',
 '③', '每次+5：25+5=30', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"找规律：1、4、9、16、____。横线上应填（ ）。","options":["①25","②24","③23"]}',
 '①', '平方数列：1²,2²,3²,4²,5²=25', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"要使下图中每行和每列的图片各不相同，空格里应该放（ ）。（图意待补：含A、□、○的方阵图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"观察每幅图的数字规律，想一想“？”处应该填（ ）。（图意待补：数字规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、填空题（35分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：\n（1）1、3、5、7、（ ）\n（2）2、3、5、8、12、（ ）、（ ）\n（3）24、32、40、（ ）、（ ）、（ ）、（ ）\n（4）63、56、（ ）、42、（ ）、（ ）、（ ）","options":null}',
 '（1）9；（2）17,23；（3）48,56,64,72；（4）49,35,28,21', '（1）+2；（2）差1,2,3,4,5,6→17,23；（3）+8；（4）-7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按规律填一填：55、46、37、（ ）、（ ）。观察这组数的个位与十位数字，发现（ ）。","options":null}',
 '28；19；个位与十位数字之和都是10（十位每次-9、个位每次+9）', '55-9=46,46-9=37,37-9=28,28-9=19；5+5=10,4+6=10,...', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"根据下面的排列规律想一想，第⑤幅图形中有（ ）个点。（图意待补：点阵规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、解决问题（25分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"想一想，算一算，在□里填数，使连线上三个数的和都等于15。（图意待补：连线圆圈图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"按规律画一画。（图意待补：规律画图题图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"在空格中填入适当的数，使横行、竖列、斜行上的数相加的和都相等。（图意待补：部分填数的3×3方阵图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"将九个连续的数填入如下空格图中，制成一个幻方，使其横行、竖列、斜行上几个数的和均为30。（图意待补：3×3空格图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第六单元 数学广场 拓展提高卷 (p049-p052) ====================
-- 一、直接写出得数（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n5×6=   54-6=   72-35=   8×4+22=\n98-46=   8×7=   84-40=   5×4+7=\n9×6=   47+23=   4×6=   2×3+19=","options":null}',
 '30；48；37；54；52；56；44；27；54；70；24；25', '5×6=30,54-6=48,72-35=37,8×4+22=54,98-46=52,8×7=56,84-40=44,5×4+7=27,9×6=54,47+23=70,4×6=24,2×3+19=25', 'paper', '[]', NULL, 0);
-- 二、用竖式计算（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n47+29=   80-27=   63-48=\n23+47-39=   85-18-29=   39+18+35=","options":null}',
 '76；53；15；31；38；92', '47+29=76,80-27=53,63-48=15,23+47-39=31,85-18-29=38,39+18+35=92', 'paper', '[]', NULL, 0);
-- 三、选择题（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"下列不是幻方的是（ ）。（图意待补：三组数字方阵图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"找规律：36、32、28、24、____。横线上应填（ ）。","options":["①22","②20","③16"]}',
 '②', '每次-4：24-4=20', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"如图，爱心和笑脸在方格中有规律的移动，“？”处应是（ ）。（图意待补：移动规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"找规律，空白处应填（ ）。（图意待补：数字规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"如图，填上合适的数，使横行、竖列、斜行上的三个数相加的和都相等，那么?=（ ）。（图意待补：含A、?的3×3方阵图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、填空题（30分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：（1）10、19、28、（ ）、（ ）、（ ）、（ ）。","options":null}',
 '37；46；55；64', '每次+9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：（2）1、2、4、7、（ ）、（ ）、（ ）、29。","options":null}',
 '11；16；22', '相邻差依次为1、2、3、4、5、6、7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：（3）1、2、3、5、8、13、（ ）、（ ）。","options":null}',
 '21；34', '斐波那契数列：前两项之和等于后一项（1+2=3,2+3=5,3+5=8,5+8=13,8+13=21,13+21=34）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律，画一画：（1）○△○△○△○△ ____ ____","options":null}',
 '○△（按○△交替重复）', '周期为2的重复图案：○△○△……', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律，画一画：（2）（图意待补：规律画图题图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律，画一画：（3）（图意待补：规律画图题图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"找规律，填一填。（图意待补：数字规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"根据下面三幅图的规律，第七幅图中有（ ）个白色圆，（ ）个黑色圆。（图意待补：圆点规律图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如图，要用4、5、6、7、8、9、10、11、12构成幻方，图中有些数已经填入，?处填（ ）。（图意待补：部分填数幻方图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如图是一个幻方，根据已知数，A处填（ ）。（图意待补：含A的幻方图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、解决问题（30分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"按规律接着画一画。（图意待补：规律画图题图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"用3~11这九个数补全图中的幻方。（图意待补：部分填数幻方图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"在下面的幻方中的空格里填数，使横行、竖列、斜行上的三个数的和均为30。（图意待补：部分填数幻方图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"用2、4、6、8、…、32这16个数制成一个幻方。（图意待补：4×4幻方图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第七单元 复习 基础测试卷 (p053-p056) ====================
-- 一、直接写出得数（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n41-30=   85-55=   19+31=   50+22-9=\n4×2=   3×6=   5×7=   4×6-4=\n9×9=   2×6=   3×8=   7×4+20=","options":null}',
 '11；30；50；63；8；18；35；20；81；12；24；48', '41-30=11,85-55=30,19+31=50,50+22-9=63（运算符OCR缺失，按-处理）,4×2=8,3×6=18,5×7=35,4×6-4=20,9×9=81,2×6=12,3×8=24,7×4+20=48', 'paper', '[]', NULL, 0);
-- 二、用竖式计算（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n45-19=   80-24=   34+49=\n86-28-32=   75-7+24=   35+33-39=","options":null}',
 '26；56；83；26；92；29', '45-19=26,80-24=56,34+49=83,86-28-32=26,75-7+24=92,35+33-39=29', 'paper', '[]', NULL, 0);
-- 三、填空题（30分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"比36多9的数是（ ）；比50少12的数是（ ）；比84少（ ）的数是39。","options":null}',
 '45；38；45', '36+9=45；50-12=38；84-39=45', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把口诀补充完整。\n二六（ ）   （ ）九五十四   （ ）八四十","options":null}',
 '十二；六；五', '二六十二；六九五十四；五八四十', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"求图中一共有多少个○，加法算式是（ ）；乘法算式是（ ）或（ ），所用口诀是（ ）。（图意待补：○排列图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"两个乘数都是7，积是（ ），列式为（ ）。","options":null}',
 '49；7×7=49', '7×7=49', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一只手有5根手指，一双手有（ ）根手指，两双手有（ ）根手指。","options":null}',
 '10；20', '5×2=10；5×4=20', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"8□-32的差的十位上是4，□里最大填（ ）。","options":null}',
 '1', '8□-32=48+□，十位为4需结果≤49，故□最大为1（80-32=48，81-32=49）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○内填入“>”“<”或“=”。\n9×4 ○ 40     2×9 ○ 8+8     34+15 ○ 50","options":null}',
 '<；>；<', '9×4=36<40；2×9=18>8+8=16；34+15=49<50', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○内填入“+”“-”或“×”。\n7○3>20；8○4=24○8；24○20○2=3；6○6（图意待补：后两处OCR残缺）","options":null}',
 '【存疑】', '7×3=21>20→×；8×4=32=24+8→×与+；"24□20□2=3"及"6□6"OCR残缺，无法可靠还原，存疑', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大能填几？\n（ ）×6<23   65>8×（ ）   （ ）×7<56【存疑：原题OCR残缺，按7×□<56还原】   46>7×（ ）   3×（ ）<20   （ ）×4<29","options":null}',
 '3；8；7；6；6；7', '3×6=18<23(4×6=24>23)；8×8=64<65(9×8=72>)；7×7=49<56(8×7=56不<)；7×6=42<46(7×7=49>)；3×6=18<20(3×7=21>)；7×4=28<29(8×4=32>)', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"买6支标价为8元的钢笔，全部用10元的现金付，至少要付（ ）张。","options":null}',
 '5', '6×8=48元，5张10元=50元≥48元，故至少5张', 'paper', '[]', NULL, 0);
-- 四、选择题（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"比41少19的数是（ ）。","options":["①38","②60","③22"]}',
 '③', '41-19=22', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"有2行小树，一行有4棵，另一行有5棵，一共有多少棵小树？正确的算式是（ ）。","options":["①4+5","②4×5","③5×4"]}',
 '①', '两行数量不同，用加法：4+5=9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面不能用“三五十五”来计算的算式是（ ）。","options":["①3+3+3+3+3=15","②3×5=15","③5+5+5+5+5=25"]}',
 '③', '“三五十五”对应3×5=15（或5×3、3个5相加、5个3相加）；③是5个5相加=25，用“五五二十五”', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下面得数比50小的算式是（ ）。","options":["①27+16","②95-28","③36+18"]}',
 '①', '27+16=43<50；95-28=67>50；36+18=54>50', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"丽丽和冬冬跳绳比赛，丽丽第一次跳26下、第二次24下（共50下）；冬冬第一次跳17下，他要想超过丽丽，第二次至少要跳（ ）。","options":["①34下","②33下","③23下"]}',
 '①', '丽丽共50下；冬冬需>50，已17，需>33，至少34下', 'paper', '[]', NULL, 0);
-- 五、看图列式计算（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：松树35棵，柏树？棵，一共？棵（另含 7棵 等图示）。（图意待补：线段/图示数量关系未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：黑兔82只，白兔39只，？只（求总数或相差）。（图意待补：图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（22分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"同学们要种93棵树，已经种了29棵，还要种多少棵？","options":null}',
 '64棵', '93-29=64', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"聪聪买一套《数学趣味故事》还差26元，一套70元。聪聪有多少钱？","options":null}',
 '44元', '70-26=44', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"电器市场原来有48台冰箱，卖出39台后，又运进了31台。现在有多少台冰箱？","options":null}',
 '40台', '48-39+31=40', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小军一个星期（7天）刚好读完一本故事书，他每天读9页。这本书一共有多少页？","options":null}',
 '63页', '7×9=63', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"二（1）班38名学生和3位老师一起去电影院看电影，电影院座位示意图如下。电影院的座位坐得下吗？（图意待补：座位示意图未识别，需数座位数与41人比较）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第七单元 复习 拓展提高卷 (p057-p060) ====================
-- 一、直接写出得数（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n78-50=   2×5=   70-5=   2×4+18=\n6+39=   36-7=   3×8=   6×7-33=\n66-9=   8×9=   32+40=   50-3×5=","options":null}',
 '28；10；65；26；45；29；24；9；57；72；72；35', '78-50=28,2×5=10,70-5=65,2×4+18=26,6+39=45,36-7=29,3×8=24,6×7-33=9,66-9=57,8×9=72,32+40=72,50-15=35', 'paper', '[]', NULL, 0);
-- 二、用竖式计算（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n38+59=   63-18=   90-11=\n66-27-18=   52+44-38=   86-57+25=","options":null}',
 '97；45；79；21；58；54', '38+59=97,63-18=45,90-11=79,66-27-18=21,52+44-38=58,86-57+25=54', 'paper', '[]', NULL, 0);
-- 三、填空题（27分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"比25多45的数是（ ）；（ ）比73少37；26比50少（ ）。","options":null}',
 '70；36；24', '25+45=70；73-37=36；50-26=24', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"上图中表示有（ ）个（ ），用加法算式表示为（ ），用乘法算式表示为（ ）或（ ）。（图意待补：图形排列图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一个乘数是9，另一个乘数是3，积是（ ）；4个6相加，和是（ ）。","options":null}',
 '27；24', '9×3=27；4×6=24', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"7个5相加的和是（ ）；它比6个5多（ ）；比7个9少（ ）。","options":null}',
 '35；5；28', '7×5=35；6×5=30，35-30=5；7×9=63，63-35=28', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大填几？\n（ ）×5≤50   20+（ ）≤6×6   3×6>（ ）×4\n5×5<30-（ ）   17<35-（ ）   （ ）×8<25+30","options":null}',
 '10；16；4；4；17；6', '×5≤50→10；20+□≤36→16；18>4×□→4；25<30-□→□<5→4；17<35-□→□<18→17；8×□<55→6', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"填一填（数字谜/算式谜，○△□代表数字）。（图意待补：竖式数字谜图OCR残缺，无法还原）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"丽丽在计算39+□时，不小心把□里两位数的个位数和十位数看反了，得到的结果是52，正确的结果应该是（ ）。","options":null}',
 '70', '看反后39+13=52→原数应为31→39+31=70', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小明有23支铅笔，小李有31支铅笔。\n（1）小明再买（ ）支铅笔就和小李同样多。\n（2）小李送给小明（ ）支铅笔后，两人的铅笔支数就同样多。","options":null}',
 '8；4', '31-23=8；两人相差8支，各让4支后相等', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"有一些水果，比40个多，比50个少（原题OCR把50误识为550），把这些水果平均分给8个小朋友正好分完。这些水果有（ ）个。","options":null}',
 '48', '40~50之间8的倍数只有48', 'paper', '[]', NULL, 0);
-- 四、选择题（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 3,
 '{"stem":"下面的计算错误的是（ ）。（图意待补：三个竖式图未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"5+5+5+4，不可以改写成算式（ ）。","options":["①5×4","②5×3+4","③4×5-1"]}',
 '①', '5+5+5+4=19；①5×4=20≠19，②5×3+4=19，③4×5-1=19', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"下列算式中，得数一定比60小的是（ ）。","options":["①2□+4","②72-24","③8□-20"]}',
 '②', '②72-24=48<60恒成立；①2□+4范围24~94；③8□-20范围60~69', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"小红买一本书，付给营业员6张5元（共30元），找回的钱不到10元，这本书可能是（ ）。","options":["①30元","②23元","③36元"]}',
 '②', '付30元，找回不到10元→书价在20~30之间，仅23元符合（①找回0边界，③超预算）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '单选', 2,
 '{"stem":"一辆出租车最多能坐4位乘客，4辆出租车（ ）一次坐下18名学生。","options":["①能","②不能","③无法确定"]}',
 '②', '4辆×4座=16<18，不能', 'paper', '[]', NULL, 0);
-- 五、看图列式计算（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：菊花60枝，月季？枝；或 26枝、52个等图示数量关系。（图意待补：图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：？颗、？个等图示数量关系。（图意待补：图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（25分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一共要洗58个盘子，还有9个没洗，已经洗了多少个盘子？","options":null}',
 '49个', '58-9=49', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小朋友们比赛跳绳，分成了8组，每组4人，一共有多少人参加了跳绳比赛？","options":null}',
 '32人', '8×4=32', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"购物（价格：①11元 ②65元 ③？元 ④56元，按图示推断①帽子②飞机③玩具熊④玩具车）：\n（1）一个玩具熊比一架玩具飞机便宜19元，玩具熊多少元？\n（2）乐乐买了一顶帽子和一辆玩具车，付出100元，应找回多少元？\n（3）你还能提出其他数学问题并解答吗？","options":null}',
 '(1)46元（65-19）；(2)33元（100-(11+56)=33）；(3)示例：买玩具飞机和帽子共多少元？65+11=76元', '价格映射依题中文字推断（玩具熊比飞机便宜19→飞机65→熊46；帽子+车=11+56）。', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"一队共有8名男同学，每2名男同学中间插入3名女同学，这一队一共有多少名同学？","options":null}',
 '29名', '8名男生有7个间隔，每间隔3名女生→7×3=21名女生，共8+21=29名', 'paper', '[]', NULL, 0);

-- ==================== 第三部分 专项卷（一）计算应用卷 (p061-p064) ====================
-- 一、口算（29分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n54+10= 5×8= 88-7= 71-17-13=（OCR缺减号，按此推断）\n56-12= 32+17= 2×9= 65-13+17=\n9×9= 22+34+8= 3×8+4= 7×7-18=","options":null}',
 '64；40；81；41；44；49；18；69；81；64；28；31', '54+10=64,5×8=40,88-7=81,71-17-13=41,56-12=44,32+17=49,2×9=18,65-13+17=69,9×9=81,22+34+8=64,3×8+4=28,7×7-18=31', 'paper', '[]', NULL, 0);
-- 一、2 填数（17分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在括号里填上适当的数：\n（ ）+12=43  32+（ ）=60  90-（ ）=34\n（ ）+32=32  （ ）×7=28  （ ）×8=64\n8=（ ）-14  18=（ ）×6  81=（ ）×（ ）\n50-36=（ ）×（ ）  4×6=6+（ ）\n6×6=（ ）×（ ）  3×8=（ ）×（ ）","options":null}',
 '31；28；56；0；4；8；22；3；9,9；2,7；18；4,9；4,6', '43-12=31；60-32=28；90-34=56；0+32=32；28÷7=4；64÷8=8；8+14=22；18÷6=3；9×9=81；50-36=14=2×7；24-6=18；6×6=36=4×9；3×8=24=4×6', 'paper', '[]', NULL, 0);
-- 二、巧算（11分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"27+59=（ ）+（ ）=（ ）。（凑整巧算）","options":null}',
 '30；56；86', '27+59=(27+3)+(59-3)=30+56=86（或26+60）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"63-39=（ ）-（ ）=（ ）。（凑整巧算）","options":null}',
 '64；40；24', '63-39=(63+1)-(39+1)=64-40=24', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"5+5+5+5+5+5+5=（ ）×5","options":null}',
 '7', '7个5相加=7×5', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"1+3+5+7+9+11=（ ）×6","options":null}',
 '6', '1+3+5+7+9+11=36=6×6', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"7×3+7×7=7×（ ）=（ ）","options":null}',
 '10；70', '乘法分配律：7×(3+7)=7×10=70', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"9×5-9×3=9×（ ）=（ ）","options":null}',
 '2；18', '9×(5-3)=9×2=18', 'paper', '[]', NULL, 0);
-- 三、括号里最大能填几（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大能填几？\n9×（ ）<30  （ ）×5<40  5×5>（ ）-17\n7×（ ）<36  （ ）-18<24+8  （ ）×8≤46+19","options":null}',
 '3；7；41；5；49；8', '9×3=27<30；7×5=35<40；25>□-17→□<42→41；7×5=35<36；□-18<32→□<50→49；8×8=64≤65', 'paper', '[]', NULL, 0);
-- 四、乘法口诀（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把乘法口诀补充完整，并写成2个乘法算式：三九（ ）。","options":null}',
 '二十七；3×9=27，9×3=27', '三九二十七', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把乘法口诀补充完整，并写成2个乘法算式：（ ）九五十四。","options":null}',
 '六；6×9=54，9×6=54', '六九五十四', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把乘法口诀补充完整，并写成2个乘法算式：四（ ）二十八。","options":null}',
 '七；4×7=28，7×4=28', '四七二十八', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把乘法口诀补充完整，并写成2个乘法算式：五（ ）四十。","options":null}',
 '八；5×8=40，8×5=40', '五八四十', 'paper', '[]', NULL, 0);
-- 五、用竖式计算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n23+58=  86-59=  50-36=\n81-62+19=（其余两题OCR残缺，疑似6+77-38与73-16+29）","options":null}',
 '81；27；14；38', '23+58=81，86-59=27，50-36=14，81-62+19=38', 'paper', '[]', NULL, 0);
-- 六、看图列式计算（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：苹果70个/45个与价格35元/74元图示数量关系。（图意待补：图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：图形组合（如 AAA/厶厶 等）数量关系。（图意待补：图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 七、解决问题（22分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"进入冬季后，园林工人要给树干刷白石灰水，第一天给66棵树干刷了白石灰水，第二天比第一天少刷了17棵。第二天给多少棵树干刷了白石灰水？","options":null}',
 '49棵', '66-17=49', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"二（1）班图书角原来有54本图书，借出38本，又还回来23本。现在图书角有多少本图书？","options":null}',
 '39本', '54-38+23=39', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一共有46根胡萝卜，第一次运走了15根，第二次运走了19根。还剩多少根萝卜？","options":null}',
 '12根', '46-15-19=12', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"公园的小路左边有6个长椅，每个长椅上坐了4人；右边有2个长椅，一个坐了6人，另一个坐了4人。\n（1）左边长椅上一共坐了多少人？\n（2）右边长椅上一共坐了多少人？","options":null}',
 '(1)24人；(2)10人', '左边6×4=24；右边6+4=10', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"买文具：标价 4元、8元、6元。买8支（单价4元）需要多少元？","options":null}',
 '32元', '假设4元为单价，8支→4×8=32（物品对应以图示为准）', 'paper', '[]', NULL, 0);

-- ==================== 第三部分 专项卷（二）认识人民币 (p065-p068) ====================
-- 一、兑换人民币（12分）纯图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"兑换人民币：1张（图示面额）可以换（ ）枚（图示面额），还可以换（ ）枚（图示面额）。（图意待补：票面/硬币图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"兑换人民币：1张（图示面额）可以换（ ）张（图示面额），还可以换（ ）张（图示面额）。（图意待补：票面图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"兑换人民币：一张（图示面额）可以换（ ）张（图示面额）。（图意待补：票面图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 二、填空题（24分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"写出下面的钱数：（图意待补：硬币/纸币组合图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在括号里填入合适的数：\n8元=（ ）角  35角=（ ）元（ ）角\n40分=（ ）角  7元3角=（ ）角\n3元=（ ）角  84角=（ ）元（ ）角\n20角=（ ）元  2元8角=（ ）角","options":null}',
 '80；3,5；4；73；30；8,4；2；28', '1元=10角，1角=10分：8元=80角；35角=3元5角；40分=4角；7元3角=73角；3元=30角；84角=8元4角；20角=2元；2元8角=28角', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在圆圈内填入“＞”“＜”或“=”：\n6角○60分  35角○3元5角  9元8角○10元\n5角○50分  3角8分○38分  61元7角○67角\n10分○9角  50角○9分  5角2分○5角1分","options":null}',
 '=；=；<；=；=；>；<；>；>', '6角=60分；35角=3元5角；9元8角<10元；5角=50分；3角8分=38分；61元7角=617角>67角；10分=1角<9角；50角=5元>9分；5角2分>5角1分', 'paper', '[]', NULL, 0);
-- 三、写出物品价格（12分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"写出下列物品的价格（图意待补：物品及标价图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、先看价格再计算（10分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"先看价格，再计算（图意待补：物品与价格对应关系图示未识别，仅知标价含7元5角、5元、2元5角）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、连一连（8分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '连线', 2,
 '{"stem":"连一连：价格（2元5角、15元、6元5角）与对应图示连线（图意待补：图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、填一填（16分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"按表格付钱：商品单价（14元3角5分、28元6角5分、49元7角、31元8角）用张/枚凑出（图意待补：需可用面额表，未给出）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 七、购物（18分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"购物：商品价格（9角、8元、38元、3元5角、5元5角）填写买的物品/付出的钱/找回的钱表（图意待补：物品图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第三部分 专项卷（三）几何与统计卷 (p069-p072) ====================
-- 一、认识方向（48分，文字可解）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"根据地图辨方向（北在上：超市在北侧、学校居中、电影院在西、少年宫在东、公园在南）：\n（1）学校在超市的（ ）面，在少年宫的（ ）面。\n（2）学校的北面是（ ），东面是（ ）。","options":null}',
 '(1)南；西 (2)超市；少年宫', '超市在北、学校在南；少年宫在东、学校在西；故学校北邻超市、东邻少年宫', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"动物园局部图（北在上：上排老虎馆、狮子馆；中排猩猩馆；下排海豹馆、孔雀馆）：\n（1）孔雀馆在海豹馆的（ ）面，海豹馆在老虎馆的（ ）面，狮子馆的（ ）面是猩猩馆。","options":null}',
 '东；南；南', '海豹馆在西、孔雀馆在东；老虎馆在上、海豹馆在下；狮子馆在上、猩猩馆在下', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"在平面图上标出：老虎馆南面是河马馆，熊猫馆在狮子馆南面、海豹馆东面。（图意待补：平面图布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"乐乐现在在海豹馆，想去狮子馆：他应该先向（ ）走到孔雀馆，接着走到（ ）馆，最后一直向（ ）路过猩猩馆就到狮子馆了。（依网格布局推断）","options":null}',
 '东；猩猩；北', '海豹馆→东→孔雀馆→北经猩猩馆→狮子馆（布局依文字推断）', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"根据描述在合适位置填序号：操场东面是体育馆①，西面是报告厅②，北面是教学楼③，南面是食堂④。\n操场东面（ ） 西面（ ） 北面（ ） 南面（ ）","options":null}',
 '①；②；③；④', '依“上北下南左西右东”填对应序号', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"四个小朋友分别站在东、西、南、北4个不同方向。明明在北面；小华站在明明对面；小红说“我不在东面”；小丽在剩下的方向。\n明明在（ ）面，小华在（ ）面，小红在（ ）面，小丽在（ ）面。","options":null}',
 '北；南；西；东', '明明北→小华南（对面）；剩东、西，小红不在东→小红西，小丽东', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"按要求找到每个人的家并在格子图里标出来（图意待补：格子图及起始位置图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 二、分类（52分，纯图依赖）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"把每行不是同类的圈起来。（图意待补：各行物品图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"分一分（填序号）：玩具（ ）、文具（ ）、服装鞋帽（ ）。（图意待补：物品图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按水果种类分一分，填个数：桃子、苹果、梨。（图意待补：水果图示及数量未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按卡片形状分一分，填个数：三角形、正方形、圆。（图意待补：卡片图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按图形分一分填个数：正方形、长方形、三角形、圆、正方体、长方体、圆柱。（图意待补：图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"还可以怎样分？请你动手试一试。（图意待补：分类方式需图示引导）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"逐层分类：图形所含序号及各类个数。（图意待补：分层图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第三部分 专项卷（四）综合拓展卷 (p073-p076) ====================
-- 一、填空题（52分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"算式谜：相同汉字代表相同数字，不同汉字代表不同数字（图意待补：竖式布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"把下面的6个数填入□中，使算式成立（每个数用一次）：□-□-□=3，□-□-□=3。（图意待补：待填6个数未给出）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"下面哪些算式可以直接改写成乘法算式？请写出来。\n5+5+3  4+2+4+1  3+3+3+6  18+9+18+9  5+5+2+3+5  2+7+7+2+9","options":null}',
 '可改写：3+3+3+6=5×3；18+9+18+9=6×9；5+5+2+3+5=4×5', '3+3+3+6=3+3+3+3+3=5个3=5×3；18+9+18+9=(18+9)×2=27×2=6×9；5+5+2+3+5=5+5+5+5=4×5。其余不是同数连加，不能改写。', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"下面的图形各代表几？（OCR部分不清，按可识别项作答）\n(1)△×△=36，△=（ ）\n(3)□+□+□+□=32，□=（ ）","options":null}',
 '(1)6 (3)8', '△×△=36→△=6；4个□=32→□=8', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"蚂蚱哥哥从0开始每次跳5格，蚂蚱弟弟从8开始每次跳3格，同时起跳。跳到（ ）时，哥哥就抓到弟弟了。（数线0~25）","options":null}',
 '20', '哥哥位置：0,5,10,15,20,25…；弟弟位置：8,11,14,17,20,23…；第一次共同落在20', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"按规律填空并计算：\n32-23=9×1=9\n42-24=9×2=18\n63-36=9×（ ）=（ ）\n51-15=9×（ ）=（ ）\n94-49=9×（ ）=（ ）\n71-17=9×（ ）=（ ）\n81-18=9×（ ）=（ ）","options":null}',
 '3,27；4,36；5,45；6,54；7,63', '规律：两位数减其倒序数=9×(十位与个位数字之差)', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"在算式中的○内填入“+”或“-”使等式成立（图意待补：原题数字串及规则未识别，经典100题通常需连写或含×）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 二、画一画（12分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"怎样使下面两行“○”的个数同样多？在图中画一画（画“○”表示添上，画“Q”表示去掉）。（图意待补：两行○图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"根据前三个图形的变化规律，画出第四个图形。（图意待补：图形序列图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 三、填一填（14分）图依赖
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"在每个图中的（ ）里填上相同的数，使它们的和等于中间的数（32、35、36）。（图意待补：各组括号个数图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"把24、25、26、27、28分别填入（ ）里，使每条线上的3个数的和都是78。（图意待补：图形布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、解决问题（22分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"根据给出的信息和算式提出相应的问题。\n一个足球45元，篮球比足球便宜9元。\n（1）问题：______  算式：45-9=36（元）\n（2）问题：______  算式：45-9+45=81（元）","options":null}',
 '(1)篮球多少元？(2)买一个足球和一个篮球共多少元？', '(1)篮球=45-9=36元；(2)足球+篮球=45+36=81元', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"先从材料中摘录相关信息，再提出一个数学问题并解答。\n材料：13名同学，小华、笑笑这学期每人读5本书，欢欢、乐乐、亮亮每人读7本，其余8人每人读2本。\n摘录信息：______\n问题：______  解答：______","options":null}',
 '示例：一共读多少本？5×2+7×3+2×8=10+21+16=47（本）', '摘录：2人各5本、3人各7本、8人各2本；问题可提“共读多少本”，合计47本', 'paper', '[]', NULL, 0);

-- （p076 四、解决问题③ 图意待补：两图各画若干“○”，比多少）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"想一想，哪个图形中的“○”个数多？（图意待补：图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期中基础测试卷 (p077-p080) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n3×5= 23+37= 48+5= 61-29=\n85-40= 78-15= 5×6= 32-8=\n6×9= 36-9= 4×5= 63-7=","options":null}',
 '15；60；53；32；45；63；30；24；54；27；20；56', '3×5=15,23+37=60,48+5=53,61-29=32,85-40=45,78-15=63,5×6=30,32-8=24,6×9=54,36-9=27,4×5=20,63-7=56', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n67-54= 84-28= 60-31=\n44+38-15= 70-35+15= 84-59+11=","options":null}',
 '13；56；29；67；50；36', '67-54=13,84-28=56,60-31=29,44+38-15=67,70-35+15=50,84-59+11=36', 'paper', '[]', NULL, 0);
-- 三、填空（31分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"（ ）比46多38，（ ）比82少27。","options":null}',
 '84；55', '46+38=84；82-27=55', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"上图表示（ ）个（ ）相加的和是（ ），加法算式为（ ），乘法算式为（ ）或（ ）。（图意待补：图中分组图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"苹果有24个。橘子比苹果多24个，梨比苹果少8个。\n橘子有（ ）个，梨有（ ）个。","options":null}',
 '48；16', '橘子=24+24=48；梨=24-8=16', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"人民币兑换：1张（图示面额）可以换（ ）张20和（ ）张（ ）；3枚（图示）可以换（ ）枚（图示）。（图意待补：票面/硬币图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○内填入“＞”“＜”或“=”：\n30+9○90+3  5×5○5+5  6×4○4×6\n28+37○70  65-8○60  5×3○2×6\n35+18○45-18  18+22○40  30角○1元","options":null}',
 '<；>；=；<；<；>；>；=；>', '30+9=39<93；25>10；24=24；65<70；57<60；15>12；53>27；40=40；30角=3元>1元', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把加法算式写成乘法算式：\n8+8+8+8+8=（ ）×（ ）\n4+4+4+4=（ ）×（ ）\n7+7+7+7+7+7+7+7=（ ）×（ ）","options":null}',
 '5,8；4,4；8,7', '5个8=5×8；4个4=4×4；8个7=8×7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"两行图形：第一行（ ）个，第二行（ ）个。\n（1）第一行拿走（ ）个，就和第二行同样多。\n（2）第二行添上（ ）个，就和第一行同样多。\n（3）从第一行拿（ ）个摆到第二行，两行同样多。\n（图意待补：图形个数图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下面不能正确表示算式57-23的是（ ）。（图意待补：三个十位/个位图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"二（2）班买99个气球，布置教室用34个，做游戏用27个。下面竖式中箭头所指的“38”表示（ ）。\n①两次一共用的个数  ②剩下的个数  ③气球的总个数","options":null}',
 '②', '99-34=65,65-27=38,38是减完两次后剩下的个数', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"一个文具盒价格14元，下面付钱方式不正确的是（ ）。\n①付1张14元  ②付1张10元和4张1元  ③付14张1元","options":null}',
 '①', '没有14元面额，①不正确', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"在点子图上表示“3×5”的含义，正确的是（ ）。（图意待补：点子图选项未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、画一画填一填（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"在横线上画△，使△比○多3个。○有4个（○○○○），△有（ ）个。","options":null}',
 '7', '4+3=7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 2,
 '{"stem":"在横线上画□，使□比○少3个。○有9个（○○○○○○○○○），□有（ ）个。","options":null}',
 '6', '9-3=6', 'paper', '[]', NULL, 0);
-- 六、看图列式（4分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：足球/篮球与故事书/漫画书的个数与本数关系（图意待补：图示及数量对应关系未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 七、解决问题（21分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"我有28本故事书，借走了9本。还剩多少本？","options":null}',
 '19本', '28-9=19', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小兔子拔了82棵白菜，卖了两天后还剩下18棵。卖出了多少棵？","options":null}',
 '64棵', '82-18=64', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"现在有多少颗松果？原来有56颗，吃了17颗，妈妈又采来32颗。","options":null}',
 '71颗', '56-17+32=71', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"逛商场：商品价格68元、36元、29元（物品以图示标出）。\n（1）明明买一顶（图示）付了50元，营业员找回29元，一顶多少元？\n（2）一件（图示）比一个（图示）贵多少元？\n（3）买一顶（图示）和一个（图示），至少要带（ ）张（面额）。","options":null}',
 '(1)21元；(2)(3)需物品-价格映射图示（图意待补）', '(1)50-29=21元；(2)(3)需图示确定物品对应价格后计算', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期中拓展提高卷 (p081-p084) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n28+12= 42-9= 4×2= 51+19-20=\n15+30= 39-20= 3×7= 59-25+30=\n18+22= 97-27= 8×9= 86-22-30=","options":null}',
 '40；33；8；50；45；19；21；64；40；70；72；34', '28+12=40,42-9=33,4×2=8,51+19-20=50,15+30=45,39-20=19,3×7=21,59-25+30=64,18+22=40,97-27=70,8×9=72,86-22-30=34', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n66-24= 74-37= 90-55=\n85-35+27= 85+9-48= 64-36+28=","options":null}',
 '42；37；35；77；46；56', '66-24=42,74-37=37,90-55=35,85-35+27=77,85+9-48=46,64-36+28=56', 'paper', '[]', NULL, 0);
-- 三、填空（24分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"“88-36”的得数的十位上是（ ）。","options":null}',
 '5', '88-36=52，十位是5', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"35比42少（ ），18再加（ ）就和46同样多。","options":null}',
 '7；28', '42-35=7；46-18=28', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"上图中有（ ）个花盆，每个花盆有（ ）株花，一共有（ ）株花。加法算式为（ ），乘法算式为（ ）或（ ）。（图意待补：花盆与花的分组图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在〇内填入“＞”“＜”或“=”：\n45+6○50  78+10○9+78  43+27○90-20\n64○55+16  80-31○50  90-28○60\n10元○9元9角  76分○7角6分  80角○7元9角","options":null}',
 '>；>；=；<；<；>；>；=；>', '45+6=51>50；88>87；70=70；64<71；49<50；62>60；10元>9元9角；76分=7角6分；80角=8元>7元9角', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"算一算：商品价格（3元5角、1元5角、23元2角）对应的付出的钱与找回的钱（图意待补：价格-付款表未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"二年级（1）班买99个气球，第一次吹好35个，第二次吹好27个。竖式中箭头所指“64”表示（ ）。\n①两次一共吹好的个数  ②第二次吹好后还剩下的个数  ③第一次吹好后还剩下的个数","options":null}',
 '③', '99-35=64，是第一次吹好后剩下的个数', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下面算式可以表示3个4相加的和的是（ ）。\n①3+4  ②3+3+3+3  ③4×3","options":null}',
 '③', '3个4相加=4×3或3×4', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"欢欢买一顶帽子（8元9角），最简单的付钱方式（纸币或硬币个数最少）是（ ）。\n①8张1元，9枚1角  ②8张1元，1枚5角，4枚1角  ③1张5元，3张1元，1枚5角，4枚1角","options":null}',
 '③', '③共9个钱币，少于①②的17、13个', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"如果74-2□的差是四十多，那么□里的数字（ ）。\n①比4大  ②比4小  ③比2大","options":null}',
 '①', '74-2□在40~49之间需2□在25~34之间，故□比4大（5~9）', 'paper', '[]', NULL, 0);
-- 五、看图列式（4分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式：菊花/月季与黑兔/白兔的数量关系（图意待补：图示及总数/部分数对应未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（34分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"儿童节二（2）班要准备64个气球做游戏，已经买了51个，还要买多少个气球？","options":null}',
 '13个', '64-51=13', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小玉一共剪了42个皮影人，送给了小美14个。小玉还剩多少个皮影人？","options":null}',
 '28个', '42-14=28', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"玩具商店：布娃娃、玩具小汽车、玩具飞机价格分别为12元、71元、34元。\n（1）一个布娃娃比一辆玩具小汽车便宜多少元？\n（2）小明付出50元买一架玩具飞机，应找回多少元？","options":null}',
 '(1)71-12=59(元)；(2)50-34=16(元)', '布娃娃12元、玩具小汽车71元、玩具飞机34元。(1)71-12=59元；(2)50-34=16元。', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"爸爸带了100元，买了下面两种物品（51元、38元），还剩多少元？","options":null}',
 '11元', '100-51-38=11', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"根据已知条件提出两个不同的问题，并解答。\n苹果30个，橘子17个，香蕉9个。\n问题1：______  算式：______  答：______\n问题2：______  算式：______  答：______","options":null}',
 '示例1：一共多少个？30+17+9=56（个）。示例2：苹果比橘子多几个？30-17=13（个）', '可提“总数”“两类之差”等问题，算式与解答对应', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期中冲刺满分卷 (p085-p088) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n4×5= 36+7= 17+9+6= 70-26=\n27+33= 3×6= 60+28= 3+37-4=\n100-45= 78-30= 9×7= 35-9+20=","options":null}',
 '20；43；32；44；60；18；88；36；55；48；63；46', '4×5=20,36+7=43,17+9+6=32,70-26=44,27+33=60,3×6=18,60+28=88,3+37-4=36,100-45=55,78-30=48,9×7=63,35-9+20=46', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n64-39= 93-78= 100-76=\n68+25-39= 72-48+28= 90-46+32=","options":null}',
 '25；15；24；54；52；76', '64-39=25,93-78=15,100-76=24,68+25-39=54,72-48+28=52,90-46+32=76', 'paper', '[]', NULL, 0);
-- 三、填空（23分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"姐姐有31块糖，给妹妹8块后，两人的块数就一样多了。妹妹原来有（ ）块糖。","options":null}',
 '15', '姐姐给后31-8=23，妹妹得后也是23，原来=23-8=15', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"算一算：买的物品与应付的钱（物品：22元、2元、5角、9角、9元）（图意待补：物品-价格表未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"上图表示（ ）个（ ），加法算式为（ ），乘法算式为（ ）或（ ）。（图意待补：分组图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在〇内填入“＞”“＜”或“=”：\n33+7○45-8  56+20○26+50  8角9分○9角\n35+9○53+8  82-30○72-30  6元5角○5元6角","options":null}',
 '>；=；<；<；>；>', '40>37；76=76；89分<90分；44<61；52>42；65角>56角', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"○和△各代表一个数，如果○-△=46，那么○=（ ），△=（ ）。（条件不足以唯一确定）","options":null}',
 '【图意待补】', '单方程两未知数，无法唯一确定', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"填一填：\n3+6+9=（ ）×9\n3+6+9=（ ）×3","options":null}',
 '2；6', '3+6+9=18=2×9=6×3', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"70-□<63，□里最小填（ ）。\n①7  ②8  ③9","options":null}',
 '②', '70-□<63 → □>7，最小填8', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下面图形中，能用4×3表示的是（ ）。（图意待补：图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"爸爸买一本书（58元5角），下面付钱方式正确的是（ ）。\n①5张10元，1张5元和1枚5角  ②5张10元，8枚1元和1枚5角  ③2张20元，1张10元，1张5元，2张2元和1枚5角","options":null}',
 '②', '①=55.5元不够；②=58.5元正好；③=59.5元多了', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"东东折了40只千纸鹤，明明折了18只。要想超过东东，明明至少要再折（ ）。\n①22只  ②32只  ③23只","options":null}',
 '③', '40-18=22，要超过需至少22+1=23只', 'paper', '[]', NULL, 0);
-- 五、看图列式（4分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式：杨树/柳树与两条鱼的数量关系（图意待补：图示及总数/部分数对应未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（35分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"球类价格：足球43元、排球32元、篮球49元、皮球17元。\n（1）一个皮球比一个足球便宜多少元？\n（2）小青带了80元，想买一个排球和一个篮球，带的钱够吗？\n（3）请你提出一个数学问题并解答。","options":null}',
 '(1)26元 (2)不够 (3)示例：买足球和皮球共多少元？43+17=60元', '(1)43-17=26；(2)32+49=81>80不够；(3)示例合理即可', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一共要植65棵树。昨天植了26棵，今天植了24棵。还要植多少棵树？","options":null}',
 '15棵', '65-26-24=15', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小明想买一个物品（64元），还差25元。小明带了多少元？","options":null}',
 '39元', '64-25=39', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"跳绳比赛成绩表：\n乐乐：第一次24、第二次30、第三次？、总成绩90\n欢欢：第一次29、第二次29、第三次？、总成绩94\n小海：第一次26、第二次30、第三次？、获第二名\n（1）乐乐第三次跳了多少下？欢欢呢？\n（2）小海获得第二名，他的总成绩可能是多少？他第三次最多跳了多少下？","options":null}',
 '(1)乐乐36下，欢欢36下 (2)总成绩可能91/92/93，第三次最多37下', '(1)乐乐90-24-30=36，欢欢94-29-29=36；(2)第二名在90与94之间，故91~93，第三次=总数-56，最多93-56=37', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期末基础测试卷 (p089-p092) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n17+6= 5×3= 8×6= 9×5-9=\n97-27= 8×9= 64-27= 86-22-30=\n60-12= 100-55= 22+38= 5×7-16=","options":null}',
 '23；15；48；36；70；72；37；34；48；45；60；19', '17+6=23,5×3=15,8×6=48,45-9=36,97-27=70,8×9=72,64-27=37,86-22-30=34,60-12=48,100-55=45,22+38=60,35-16=19', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n44+9= 77-21= 83-47=\n36+59-64= 58-27+29= 90-33+15=","options":null}',
 '53；56；36；31；60；72', '44+9=53,77-21=56,83-47=36,36+59-64=31,58-27+29=60,90-33+15=72', 'paper', '[]', NULL, 0);
-- 三、填空（28分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"把算式6+6+6+6+6写成乘法算式是（ ）或（ ），计算时用到的口诀是（ ）。","options":null}',
 '5×6；6×5；五六三十', '5个6相加', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一个乘数是8，另一个乘数是3，积是（ ）。","options":null}',
 '24', '8×3=24', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在〇内填入“＞”“＜”或“=”：\n4×2○4+2  5×3○4×4  38+5○87-44\n95角○1元  32+45○87  100分○1元\n56-28○7×4  21+36○5×6+6","options":null}',
 '>；<；=；>；<；=；=；>', '8>6；15<16；43=43；9.5元>1元；77<87；100分=1元；28=28；57>36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"校园平面图（北在上）：\n实验楼 教学楼 综合楼\n食堂 学校操场 科技楼\n植物园 大门 图书馆\n（1）大门在学校操场的（ ）面，植物园在食堂的（ ）面。\n（2）综合楼在教学楼的（ ）面，实验楼在教学楼的（ ）面。\n（3）学校操场在食堂的（ ）面，在科技楼的（ ）面。","options":null}',
 '(1)南；南 (2)东；西 (3)东；西', '依“上北下南左西右东”按布局判断', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在括号里填入适当的数：\n3×4+15=3×（ ）=（ ）\n5×7-10=（ ）×5=（ ）","options":null}',
 '9；27；5；25', '12+15=27=3×9；35-10=25=5×5', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"按规律填数：\n（1）19、26、33、（ ）、47、（ ）、（ ）\n（2）83、78、（ ）、68、（ ）、58、（ ）","options":null}',
 '(1)40；54；61 (2)73；63；53', '(1)每次+7；(2)每次-5', 'paper', '[]', NULL, 0);
-- 四、选择题（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下面口诀中，只能用来计算一个乘法算式的是（ ）。\n①四五二十  ②五七三十五  ③五五二十五","options":null}',
 '③', '③两个乘数相同，只能写一个算式', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"1支钢笔8元，1个笔记本4元，乐乐有10元，要买这两样东西，还差（ ）。\n①2分  ②2角  ③2元","options":null}',
 '③', '8+4=12元，12-10=2元', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"把这些杯子分成两组，分法有（ ）。（图意待补：杯子图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、按要求分类（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按点数分（2、3的张数）与按花色分（梅花、方块、黑桃的张数）。（图意待补：扑克牌图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、填幻方（7分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"填幻方，使横行、竖列、斜行上三个数的和都等于15。（图意待补：幻方初始数字布局未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 七、看图列式（4分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：两组数量关系（图意待补：图示及数量对应未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 八、解决问题（13分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"买衣服：帽子9元、短袖17元、裙子80元（依价格推断物品）。\n（1）一顶帽子比一件短袖便宜多少元？\n（2）妈妈想买一条裙子，还差15元，妈妈带了多少元？","options":null}',
 '(1)8元 (2)65元', '(1)17-9=8；(2)80-15=65', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"缝一个沙包要用6块布，缝（OCR个数不清）个沙包要用多少块布？（图意待补：题目个数OCR噪点）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"文具店原有8盒圆珠笔，每盒有8支。卖掉了15支后，文具店还有多少支圆珠笔？","options":null}',
 '49支', '8×8-15=64-15=49', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期末拓展提高卷 (p093-p096) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n4×5= 8×6= 83-7= 3×6+6=\n13+50= 75-20= 3×9= 92-2-20=\n3×5= 8+41= 14+15+16= 9×9-80=","options":null}',
 '20；48；76；24；63；55；27；70；15；49；45；1', '4×5=20,8×6=48,83-7=76,18+6=24,13+50=63,75-20=55,3×9=27,92-22=70,3×5=15,8+41=49,45,81-80=1', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n90-54= 37+58= 72-37=\n74-24-18= 56-28+17= 43+38-29=","options":null}',
 '36；95；35；32；45；52', '90-54=36,37+58=95,72-37=35,74-24-18=32,56-28+17=45,43+38-29=52', 'paper', '[]', NULL, 0);
-- 三、填空（22分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"积是36的乘法口诀有两句，分别是（ ）和（ ）。","options":null}',
 '四九三十六；六六三十六', '36=4×9=6×6', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一件衣服74元，全部付（图示面额）的人民币，至少要付（ ）张，应该找回（ ）元。（图意待补：票面图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在括号里填上适当的数：\n6元=（ ）角  3元8角=（ ）角  15分=（ ）角（ ）分","options":null}',
 '60；38；1；5', '1元=10角，1角=10分', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"填表：\n原有 60箱  72箱  （ ）箱\n卖掉 45箱  （ ）箱  30箱\n还剩 （ ）箱  7箱  28箱","options":null}',
 '15；65；58', '60-45=15；72-7=65；28+30=58', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大能填几？\n67-（ ）>30  4×（ ）<29  3×（ ）<10\n40>5×（ ）  35+（ ）<75  64>8×（ ）","options":null}',
 '36；7；3；7；39；7', '67-36=31>30；4×7=28<29；3×3=9<10；5×7=35<40；35+39=74<75；8×7=56<64', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"像这样继续摆下去，第8个图形要用（ ）根小棒。（图意待补：小棒图形序列图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"方向图（北在上）：\n教室\n车棚 餐厅 卫生间\n（1）车棚在餐厅的（ ）面，卫生间在餐厅的（ ）面。\n（2）明明要从教室去餐厅，应该向（ ）走。\n（3）乐乐要从卫生间到车棚，应该向（ ）走。","options":null}',
 '(1)西；东 (2)南 (3)西', '依布局判断方向与路径', 'paper', '[]', NULL, 0);
-- 四、选择题（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"小华买一盒36元的水彩笔，付给营业员2张同样的人民币，他付的人民币是（ ）。（图意待补：面额图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下面的问题中，不能用算式“7×4”解决的是（ ）。\n①有4列队伍，每列7名同学，一共多少名？\n②明明有7包糖，每包4块，一共多少块？\n③有两条船，一条坐7人，另一条坐4人，一共坐多少人？","options":null}',
 '③', '③是7+4，不能用乘法', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"58、50、42、34、____。按照规律，横线处应填（ ）。\n①24  ②26  ③28","options":null}',
 '②', '每次-8，34-8=26', 'paper', '[]', NULL, 0);
-- 五、分类（9分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按形状分类并填数量，再分成两类（图意待补：图形形状图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、制幻方（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"将3、6、9、12、15、18、21、24、27这九个数制成一个幻方（横行、竖列、斜行三个数的和都相等）。","options":null}',
 '24 3 18 / 9 15 21 / 12 27 6', '标准3阶幻方(8 1 6 / 3 5 7 / 4 9 2)各数×3即得；每行每列每对角线和=45', 'paper', '[]', NULL, 0);
-- 七、看图列式（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：苹果70个、梨45个的数量关系（图意待补：图示及对应关系未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 八、解决问题（21分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"购物：电吹风38元、手表25元、台灯22元。\n（1）一个电吹风比一块手表贵多少元？\n（2）小海妈妈带50元，要买一个电吹风和一个台灯，还差多少元？\n（3）买一块手表、一个台灯和一个电吹风，一共需要花多少元？","options":null}',
 '(1)13元 (2)10元 (3)85元', '(1)38-25=13；(2)38+22-50=10；(3)25+22+38=85', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小朋友们比赛跳绳，分成8组，每组4人。一共多少人参加跳绳比赛？","options":null}',
 '32人', '8×4=32', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"同学们去郊游，租了（OCR不清）辆面包车，每辆坐7人，所有人上车后还有3个空位。这次一共去了多少人？（图意待补：车辆数OCR噪点）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);

-- ==================== 第四部分 期末冲刺满分卷 (p097-p100) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n6×7= 85-32= 77-30-6= 3×6+11=\n8×8= 31-2= 80-78+56= 9-2×2=\n7×8= 26+6= 34+7-41= 5+5×4=","options":null}',
 '42；53；41；29；64；29；58；5；56；32；0；25', '6×7=42,85-32=53,77-36=41,18+11=29,64,29,2+56=58,9-4=5,56,32,41-41=0,5+20=25', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n46+35= 72-49= 80-54=\n35+48-26= 93-65+43= 80-34-7=","options":null}',
 '81；23；26；57；71；39', '46+35=81,72-49=23,80-54=26,35+48-26=57,93-65+43=71,80-34-7=39', 'paper', '[]', NULL, 0);
-- 三、填空（23分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"乐乐在计算退位减法50-33时，把被减数的个位弄脏了，被弄脏的数字可能是（ ），差最大是（ ）。","options":null}',
 '0~9均可；26', '被减数在50~59之间（十位5不变），差=被减数-33，最大59-33=26', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"2个7相加的和是（ ），2个7相乘的积是（ ）。","options":null}',
 '14；49', '7+7=14；7×7=49', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一张方格纸从左往右数有7个格子，从上往下数有9个格子，一共有（ ）个格子。","options":null}',
 '63', '7×9=63', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"算一算：商品（18元、4元5角、15元）对应的应付钱、付出的钱、找回的钱（图意待补：价格-付款表未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"分一分：按长短和颜色分，填各类数量（灰色长/短铅笔、白色长/短铅笔）。（图意待补：铅笔图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"饲养场白兔和黑兔同样多，如果卖掉24只白兔和32只黑兔，那么剩下的（ ）兔多，多（ ）只。","options":null}',
 '白；8', '黑兔卖得多，故白兔剩得多，多32-24=8只', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"有一堆苹果，个数比7个5少，比8个4多。这堆苹果最少有（ ）个，最多有（ ）个。","options":null}',
 '33；34', '比35少、比32多，即33或34', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"一组有规律图案：第1个由4个基本图形组成，第2个由7个组成，……则第5个图案由（ ）个基本图形组成。","options":null}',
 '16', '第n个=3n+1，第5个=3×5+1=16', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"美美买玩具娃娃付了2张20元，找回的钱比10元多、比20元少。这个玩具娃娃的价格可能是（ ）。\n①15元  ②25元  ③35元","options":null}',
 '②', '付40元，找回∈(10,20)，价格=40-找回∈(20,30)，只有25元', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"两个数相乘的积是36，这两个数相加的和不可能是（ ）。\n①12  ②13  ③9","options":null}',
 '③', '36=6×6(和12)、4×9(和13)、3×12(15)、2×18(20)等，和不可能9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"观察九宫格中的图形规律，在空格内画上合适的图形应为（ ）。（图意待补：图形规律图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"如图，在正六边形上摆珠子，每条边摆4颗，至少要摆（ ）。\n①20颗  ②24颗  ③18颗","options":null}',
 '③', '6边×4颗-6个顶点重复=24-6=18', 'paper', '[]', NULL, 0);
-- 五、认识位置（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '位置', 2,
 '{"stem":"公园示意图（北在上）：根据描述标出大门、游乐园、人工湖、温室、小树林、饭店、假山的位置（图意待补：示意图位置未识别）。\n（1）大门在公园东面，游乐园在人工湖西面。\n（2）温室在人工湖南面，小树林在温室东面，小树林北面是饭店。","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（29分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"购物：文具盒7元、书包26元、钢笔72元。\n（1）一个书包比一个文具盒贵多少元？\n（2）用100元买一支钢笔和一个书包后，还剩多少元？\n（3）根据信息提出一个数学问题并解答。","options":null}',
 '(1)19元 (2)2元 (3)示例：买文具盒和书包共多少元？7+26=33元', '(1)26-7=19；(2)100-(72+26)=2；(3)示例合理即可', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一排有8幢房子，有9排，一共有多少幢房子？","options":null}',
 '72幢', '8×9=72', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小兔拔了5行萝卜，每行8根，送给邻居兔奶奶15根，还剩多少根萝卜？","options":null}',
 '25根', '5×8-15=40-15=25', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"学校社会实践：2名教师和37名同学租船。有6条大船每条限坐6人，1条小船每条限坐4人。坐得下吗？","options":null}',
 '坐得下', '共39人；6×6+4=40≥39，坐得下', 'paper', '[]', NULL, 0);

-- ==================== 第五部分 杨浦区期末测试卷 (p101-p104) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n47+7= 40+20= 4×6= 48+20-16=\n60-8= 35+48= 34+17= 93-21-50=\n5×7= 79+11= 89-19= 6×8-18=","options":null}',
 '54；60；24；52；52；83；51；22；35；90；70；30', '47+7=54,40+20=60,4×6=24,68-16=52,60-8=52,35+48=83,34+17=51,93-71=22,5×7=35,79+11=90,89-19=70,48-18=30', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n68-26= 83-27= 50-18=\n91-49-36= 70-35+23= 54+29-46=","options":null}',
 '42；56；32；6；58；37', '68-26=42,83-27=56,50-18=32,91-49-36=6,70-35+23=58,54+29-46=37', 'paper', '[]', NULL, 0);
-- 三、填空（28分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"36再加（ ）就和55同样多，比65多25的数是（ ）。","options":null}',
 '19；90', '55-36=19；65+25=90', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"上图中表示（ ）个（ ）相加，乘法算式是（ ）或（ ），计算时所用的口诀是（ ）。（图意待补：圆点分组图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"3个5相加的和是（ ），7和8相加的和是（ ）。","options":null}',
 '15；15', '5×3=15；7+8=15', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"已知○+○+○+□=28，□+○+○=20，则○=（ ），□=（ ）。","options":null}',
 '8；4', '由□=20-2○代入3○+□=28得○+20=28→○=8，□=20-16=4', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在〇内填入“＞”“＜”或“=”：\n65-56○76-67  48-4○49+40  48+8○96-40\n4角○40分  10分○1元  8角9分○89角","options":null}',
 '=；<；=；=；<；<', '9=9；44<89；56=56；40分=40分；10分<100分；89分<890分', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：\n（1）8、11、14、17、（ ）、23、（ ）\n（2）4、9、16、25、（ ）、49、64","options":null}',
 '(1)20；26 (2)36', '(1)每次+3；(2)平方数2²~8²，第5项6²=36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"方向图（北在上，以小冬家为参照）：电视台在北、科技馆在东、医院在东南、学校在南。\n（1）学校在小冬家的（ ）面，电视台在小冬家的（ ）面。\n（2）科技馆在小冬家的（ ）面，小冬家在科技馆的（ ）面。\n（3）医院在科技馆的（ ）面，学校在电视台的（ ）面。","options":null}',
 '(1)南；北 (2)东；西 (3)东；南', '依布局判断相对方位', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"像这样摆下去，第4个图有（ ）个圆，第8个图形有（ ）个圆。（图意待补：圆点序列图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、选择题（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"下图表示的是一道减法算式的计算过程，这道算式是（ ）。（图意待补：小棒/计数器图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"买一个玩具要46元，下面付钱方式不正确的是（ ）。\n①4张10元、1张5元、1张1元  ②2张20元、3张1元  ③1张20元、2张10元、1张5元、1张1元","options":null}',
 '②', '②=43元不足46', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"如图，花盆里一共有多少株花？下面算式中不能解决这个问题的的是（ ）。（图意待补：花盆图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、分类（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按动物分（数量）与按形状分（数量）。（图意待补：卡片图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、制幻方（6分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"用11～19这九个数制作一个幻方（横行、竖列、斜行三个数的和都相等）。","options":null}',
 '18 11 16 / 13 15 17 / 14 19 12', '标准3阶幻方(8 1 6 / 3 5 7 / 4 9 2)各数+10即得；每行每列每对角线和=45', 'paper', '[]', NULL, 0);
-- 七、解决问题（24分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"购物：玩具猴32元、玩具车56元、玩具飞机（比玩具车贵11元）。\n（1）一只玩具猴比一辆玩具车便宜多少元？\n（2）一架玩具飞机多少元？\n（3）用100元买一只玩具猴和一架玩具飞机，应找回多少元？\n（4）你还能提出其他数学问题并解答吗？","options":null}',
 '(1)24元 (2)67元 (3)1元 (4)示例：买玩具车和飞机共多少元？56+67=123元', '(1)56-32=24；(2)56+11=67；(3)100-(32+67)=1；(4)示例合理即可', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"王师傅做了80个面包，上午卖了45个，下午又做了27个，现在有多少个面包？","options":null}',
 '62个', '80-45+27=62', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"小华收到一个大礼盒，大礼盒中有3个中礼盒，每个中礼盒中有8个小礼盒。一共有多少个礼盒？","options":null}',
 '28个', '1+3+3×8=1+3+24=28', 'paper', '[]', NULL, 0);

-- ==================== 第五部分 虹口区期末测试卷 (p105-p108) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n27+19= 37-26= 8×7= 25-20+37=\n5×9= 65-55= 3×3= 28+6-14=\n45+37= 3×9= 9×6= 7×6-22=","options":null}',
 '46；11；56；42；45；10；9；20；82；27；54；20', '27+19=46,37-26=11,8×7=56,42,45,10,9,20,82,27,54,20', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n67-35= 70-46= 92+26=\n81-47-28= 90-87+39= 24+18-27=","options":null}',
 '32；24；118；6；42；15', '67-35=32,70-46=24,92+26=118,81-47-28=6,90-87+39=42,24+18-27=15', 'paper', '[]', NULL, 0);
-- 三、填空（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"4+4+4+4+4+4=24，在这个算式中，相同的加数是（ ），相同加数的个数是（ ）个，写成乘法算式是（ ）。","options":null}',
 '4；6；6×4或4×6', '6个4相加', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"踢毽子比赛，小飞踢了43个，小明踢了27个。小明至少再踢（ ）个就能超过小飞。","options":null}',
 '17', '43-27=16，超过需再加1，即17', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在〇内填入“＞”“＜”或“=”：\n9×2○18  4×7○25  97-25-47○26\n3×8○20  6×6○38  78-24+39○83","options":null}',
 '=；>；<；>；<；>', '18=18；28>25；25<26；24>20；36<38；93>83', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小红有45张画片，小明有63张画片，小明的画片比小红多（ ）张。小明给小红（ ）张画片后，两人的画片张数一样多。","options":null}',
 '18；9', '63-45=18；给一半18÷2=9', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"方向图（北在上）：\n电影院 医院 体育馆\n邮局 广场 动物园\n银行 学校 书店\n体育馆在动物园的（ ）面，书店在学校的（ ）面，银行在邮局的（ ）面，电影院在医院的（ ）面。","options":null}',
 '北；东；南；西', '依布局判断相对方位', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"像这样摆下去，第5个图形有（ ）根小棒，第8个图形有（ ）根小棒。（图意待补：小棒序列图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"一条裙子78元，欢欢带的钱都是10元的，她至少应该付（ ）。\n①7张  ②8张  ③9张","options":null}',
 '②', '78÷10=7.8，需8张', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"一个两位数，数字和是7。如果此数减去27，两个数字位置正好互换。原来的两位数是（ ）。\n①61  ②52  ③43","options":null}',
 '②', '52-27=25，数字互换为25，符合；且5+2=7', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"找规律，空白处应填（ ）。（图意待补：数阵图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"同学们到电影院看电影，座位图如右图。三个人分别计算座位个数，做法正确的有（ ）。（图意待补：座位图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、分类（10分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"按不同的标准分一分，填一填（图意待补：分类对象图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、看图列式（4分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"看图列式计算：小猴与小兔的数量关系（图意待补：图示及数量对应未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 七、解决问题（30分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"购物：蜡笔7元、某物12元、剪刀8元、花（？元）、鞋68元。\n（1）一双鞋比一盆花贵39元，一盆花多少元？\n（2）买一双鞋和一盒蜡笔，一共需要多少元？\n（3）买6把剪刀需要多少元？\n（4）你还能提出其他数学问题并解答吗？","options":null}',
 '(1)29元 (2)75元 (3)48元 (4)示例：买蜡笔和剪刀共多少元？7+8=15元', '(1)68-39=29；(2)68+7=75；(3)6×8=48；(4)示例合理即可', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一根彩绳长85厘米，二（1）班用了37厘米，二（2）班用了29厘米，还剩多少厘米？","options":null}',
 '19厘米', '85-37-29=19', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小明看一本书，前8天每天看5页，第9天只看了3页。小明一共看了多少页？","options":null}',
 '43页', '8×5+3=40+3=43', 'paper', '[]', NULL, 0);

-- ==================== 第五部分 黄浦区期末测试卷 (p109-p112) ====================
-- 一、口算（12分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '口算', 1,
 '{"stem":"直接写出得数：\n4×7= 35+26= 6×2= 26-15+12=\n50-45= 3×8= 9×7= 70-25-25=\n5×8= 39+24= 51-25= 8×6-24=","options":null}',
 '28；61；12；23；5；24；63；20；40；63；26；24', '4×7=28,35+26=61,6×2=12,23,5,24,63,20,40,63,26,24', 'paper', '[]', NULL, 0);
-- 二、竖式（18分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"用竖式计算：\n48-25= 73-37= 100-65=\n73-66+28= 72-16-35= 50+36-48=","options":null}',
 '23；36；35；35；21；38', '48-25=23,73-37=36,100-65=35,73-66+28=35,72-16-35=21,50+36-48=38', 'paper', '[]', NULL, 0);
-- 三、填空（20分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"果园里有3行杏树，每行7棵，一共有（ ）棵杏树，计算时用到的乘法口诀是（ ）。","options":null}',
 '21；三七二十一', '3×7=21', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"计算43-（ ），当（ ）里最小填（ ）时，这是一道退位减法题，差是（ ）。","options":null}',
 '4；39', '个位3<□需退位，最小填4，43-4=39', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"黄昏面对太阳，后面是（ ）面，左边是（ ）面，右边是（ ）面。","options":null}',
 '东；南；北', '黄昏太阳在西，面对西则后东、左南、右北', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"括号里最大能填几？\n4×（ ）<38  （ ）+40<62  33>8×（ ）\n5×（ ）<45  （ ）+28<56  7×（ ）<4×9","options":null}',
 '9；21；4；8；27；5', '4×9=36<38；21+40=61<62；8×4=32<33；5×8=40<45；27+28=55<56；7×5=35<36', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"找规律填数：\n（1）63、56、49、（ ）、35、（ ）\n（2）2、5、10、17、26、（ ）、50、65","options":null}',
 '(1)42；28 (2)37', '(1)每次-7；(2)相邻差+3、+5、+7、+9、+11…', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"小明计算一道减法算式时，把减数65看成了56，得到错误结果27，被减数是（ ），正确的结果是（ ）。","options":null}',
 '83；18', '被减数=56+27=83；正确=83-65=18', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"如图所示的幻方，已知第一行三个数之和是24，部分数已填入，“x”处应填（ ）。（图意待补：幻方布局图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 四、选择题（8分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"通过摆小棒的方法计算42-25，图中圈起来的部分表示（ ）。（图意待补：小棒图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"一支铅笔8角，哥哥买了5支，付给售货员5元，应找回（ ）。\n①35元  ②1元  ③15角","options":null}',
 '②', '5支=40角=4元，5-4=1元', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"二（2）班分组，每5人一组剩2人，每7人一组也剩2人，那么二（2）班至少有（ ）。\n①33人  ②35人  ③37人","options":null}',
 '③', '5×7+2=37', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"观察下图中的规律，第四个图案右下角的图形应该是（ ）。（图意待补：图案规律图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 五、操作题（14分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '分类', 2,
 '{"stem":"分类：按立体/平面图形类别填个数，并分成两组（图意待补：图形图示未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '位置', 2,
 '{"stem":"游乐场平面图（北在上）：根据描述把项目标到图中：大门在南；正北有花坛和激流勇进；花坛东=丛林探险、西=脚踏车；摩天轮在脚踏车南；海盗船在激流勇进西、水上乐园在东。（图意待补：需标到图上）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
-- 六、解决问题（28分）
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"一张课桌81元，比一把椅子贵9元，一把椅子多少元？","options":null}',
 '72元', '81-9=72', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"买衣服（45元、36元、52元、61元、？元）：\n（1）一条裙子比一条裤子贵多少元？\n（2）一件衬衣比一双鞋子便宜35元，一双鞋子多少元？\n（3）欢欢买了一件衬衣和一件短袖，付给营业员100元，应找回多少元？（图意待补：价格与物品对应关系未识别）","options":null}',
 '【图意待补】', '【图意待补】', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"买早餐：蛋糕8元、汉堡包16元、牛奶5元（按常理匹配）。\n（1）买4个蛋糕要多少元？\n（2）乐乐买了1个汉堡包和6盒牛奶，要付多少元？","options":null}',
 '(1)32元 (2)46元', '(1)4×8=32；(2)16+6×5=46', 'paper', '[]', NULL, 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"小军从一楼到二楼用了8秒，照这样的速度，从一楼走到8楼，一共要用多少秒？","options":null}',
 '56秒', '8楼需走7层，7×8=56', 'paper', '[]', NULL, 0);
