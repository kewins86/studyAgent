-- V23: 一卷搞定（新）-上海2上数学 期初摸底卷（p001-p004）补录
-- 来源: paper（扫描PDF，本地 macOS Vision OCR 抽文字，助手按 p001-p004 题目页 + p113 答案页交叉核验）
-- 依赖: V1(questions 表), V19(images 列), knowledge_nodes 已存在 数学/二年级/level=1 根节点（V21 已建）
-- 转写规则: 纯计算/口算/竖式/文字填空/应用题 按 p113 答案页核验；图意题按方案 C 占位 + tags 标注；
--          开放题不入库。
-- node_id 统一挂 (subject='数学', grade='二年级', level=1) 根节点。
-- 卷头信息: 二年级第一学期期初摸底卷（35分钟/100分）—— PDF 118 页，本卷对应 p001-p004（题目） + p113-p118（答案）。
-- 文件结构: 41 题（不含 #42 解决问题(3) 开放题），按版面 7 大题组织。
-- 与 V21 关系: V21 已录 p005-p112（黄浦区期末卷 23 套），V23 补回漏录的 p001-p004 期初摸底卷。
-- 与 V22 关系: V22 已占为三年级种子 Batch1（49 节点 + 55 题），V23 紧接。

-- ==================== 第一部分 期初摸底卷 (p001-p004) ====================

-- 一、直接写得数（每题 1 分，共 15 分）type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"16+30=","options":null}', '46', '直接计算：16+30=46', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"15-8=","options":null}', '7', '直接计算：15-8=7', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"65+30=","options":null}', '95', '直接计算：65+30=95', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"18-9-3=","options":null}', '6', '直接计算：18-9-3=6', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"8+8+50=","options":null}', '66', '直接计算：8+8+50=66', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"16-9+3=","options":null}', '10', '直接计算：16-9+3=10', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"23+68=","options":null}', '91', '直接计算：23+68=91', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"23+5=","options":null}', '28', '直接计算：23+5=28', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"5+61+2=","options":null}', '68', '直接计算：5+61+2=68', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"40+20+32=","options":null}', '92', '直接计算：40+20+32=92', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"37+50=","options":null}', '87', '直接计算：37+50=87', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"80-40=","options":null}', '40', '直接计算：80-40=40', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 1,
 '{"stem":"5+32=","options":null}', '37', '直接计算：5+32=37', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"20+60+13=","options":null}', '93', '直接计算：20+60+13=93', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"20-9+2=","options":null}', '13', '直接计算：20-9+2=13', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);

-- 二、竖式计算（每题 4 分，共 12 分）type=计算
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 2,
 '{"stem":"36+5=","options":null}', '41', '竖式计算：36+5=41', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 3,
 '{"stem":"27+8+35=","options":null}', '70', '竖式计算：27+8+35=70', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '计算', 3,
 '{"stem":"48+31+15=","options":null}', '94', '竖式计算：48+31+15=94', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);

-- 三、填空（约 22 分，9 题）type=填空
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"看图写数（图意待补：3 个计数器/方块图分别表示 40、62、100）。写作（ ）、读作（ ）；写作（ ）、读作（ ）；写作（ ）、读作（ ）。","options":null}',
 '40 四十；62 六十二；100 一百', 'p113 答案：写作 40、读作 四十；写作 62、读作 六十二；写作 100、读作 一百', 'paper', '["v23","摸底卷","p001","图意待补"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"五十四写作（ ）；5 个十和 4 个一写作（ ）；与 54 相邻的两个数是（ ）和（ ）。","options":null}',
 '54；54；53；55', '五十四写作 54；5个十和4个一写作 54；54 相邻数为 53 和 55', 'paper', '["v23","摸底卷","p001"]', '["paper_png/yg2_sx/p001.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"最大两位数是（ ），最小三位数是（ ），它们相差（ ）。","options":null}',
 '99；100；1', '最大两位数 99；最小三位数 100；100-99=1', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"百数表中，按规律填空（图意待补：3 个空位见 p001_seg3 / p002_seg1 百数表截图）。","options":null}',
 '【图意待补：百数表空位答案需补图核对】', '百数表 3 个空位（图意待补，按百数表规律填写）', 'paper', '["v23","摸底卷","p002","图意待补"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"比 67 少 57 的数是（ ）。","options":null}',
 '10', '67-57=10', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在（ ）里填上合适的长度单位：\\n(1) 铅笔长约 18（ ）  (2) 操场一圈约 200（ ）  (3) 树高约 8（ ）  (4) 手掌宽约 7（ ）。","options":null}',
 '厘米；米；米；厘米', '铅笔长 18 厘米；操场一圈 200 米；树高 8 米；手掌宽 7 厘米', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 2,
 '{"stem":"在○里填上＞、＜或＝：\\n36-7○26；78-19○69；30-8○51-29；9+62○69；32-18○50；99-45○45+9。","options":null}',
 '＞；＜；=；＞；＜；=', '36-7=29＞26；78-19=59＜69；30-8=22，51-29=22，相等；9+62=71＞69；32-18=14＜50；99-45=54，45+9=54，相等', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"找规律填数：\\n(1) 20、22、24、（ ）、（ ）\\n(2) 15、13、12、11、（ ）、（ ）。","options":null}',
 '26、28；10、9', '(1) 每次+2：20、22、24、26、28；(2) 差值 2、1、1、1、1：15、13、12、11、10、9', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '填空', 3,
 '{"stem":"找规律，第 13 个图形是（ ）。（图意待补：●●▲★★循环图形；p113 答案：②▲）","options":null}',
 '②', '按 ●●▲★★ 循环，13 ÷ 5 = 2 余 3，第 13 个为第 3 个即 ▲，对应选项②', 'paper', '["v23","摸底卷","p002","图意待补"]', '["paper_png/yg2_sx/p002.png"]', 0);

-- 四、选择题（每题 2 分，共 10 分）type=选择
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"测量物体长度，下列方法正确的是（ ）。\\n（图意待补：4 幅测量图示，按"零起点、对齐刻度"判断）① ② ③ ④","options":"[\\"①\\",\\"②\\",\\"③\\",\\"④\\"]"}',
 '①', '正确的测量方法应对齐零刻度，p113 答案 ①', 'paper', '["v23","摸底卷","p002","图意待补"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"量操场跑道的长度，用（ ）作身体尺最合适。\\n①庹 ②步 ③拃 ④脚印","options":"[\\"①\\",\\"②\\",\\"③\\",\\"④\\"]"}',
 '②', '操场跑道长，应选较大单位，步最合适', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 3,
 '{"stem":"一本《故事画报》共 92 页，小明第一天读了 17 页，第二天读了 19 页，第三天应从第几页读起？\\n①35 ②36 ③37 ④38","options":"[\\"①\\",\\"②\\",\\"③\\",\\"④\\"]"}',
 '②', '已读 17+19=36 页，第三天从 36+1=37 页读起；p113 答案 ②（36）', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 2,
 '{"stem":"一根细绳约长多少厘米？（图意待补：细绳图）\\n①7 厘米 ②5 厘米 ③15 厘米 ④1 米","options":"[\\"①\\",\\"②\\",\\"③\\",\\"④\\"]"}',
 '①', 'p113 答案 ① 7 厘米（细绳缠绕细节以图为准）', 'paper', '["v23","摸底卷","p002","图意待补"]', '["paper_png/yg2_sx/p002.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '选择', 3,
 '{"stem":"一列图形按 ●●▲★★ 循环排列，第 13 个图形是（ ）。\\n①● ②▲ ③★ ④▲●","options":"[\\"①\\",\\"②\\",\\"③\\",\\"④\\"]"}',
 '②', '●●▲★★ 周期 5，13 ÷ 5 = 2 余 3，第 13 个是第 3 个 ▲', 'paper', '["v23","摸底卷","p002"]', '["paper_png/yg2_sx/p002.png"]', 0);

-- 五、作图（共 9 分，3 题）type=操作
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"三根圆柱上绕线（图意待补：3 根线长度不同），最长的画"√"，最短的画"×"。","options":null}',
 '【图意待补：按线长判断×/√位置】', '对比三根圆柱上线长，最长打√、最短打×（图意待补）', 'paper', '["v23","摸底卷","p003","图意待补"]', '["paper_png/yg2_sx/p003.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"量一量下面线段长（ ）厘米，再画一条比它短 2 厘米的线段。","options":null}',
 '7；5', '线段长 7 厘米，短 2 厘米即 5 厘米', 'paper', '["v23","摸底卷","p003"]', '["paper_png/yg2_sx/p003.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '操作', 3,
 '{"stem":"看钟面填一填（图意待补：4 个钟面）：第一个钟（ ）；第二个钟（ ）；第三个钟（ ）；第四个钟（ ）。","options":null}',
 '2:00；2:30；3:00；3:30', '4 个钟面依次为 2:00、2:30、3:00、3:30', 'paper', '["v23","摸底卷","p003","图意待补"]', '["paper_png/yg2_sx/p003.png"]', 0);

-- 六、看图列式（每题 3 分，共 6 分）type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"看图列式：一盘菠萝共 15 个，盘子里有 6 个，盘外有 9 个（图意待补：盘中/盘外分堆示意）。","options":null}',
 '15-6=9(个)', '15-6=9（个），p113 答案吻合', 'paper', '["v23","摸底卷","p003","图意待补"]', '["paper_png/yg2_sx/p003.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"看图列式：一个书包 65 元，一个文具盒 13 元（图意待补：商品图）。","options":null}',
 '65+13=78(元)', '书包 + 文具盒 = 65+13=78（元），p113 答案吻合', 'paper', '["v23","摸底卷","p003","图意待补"]', '["paper_png/yg2_sx/p003.png"]', 0);

-- 七、解决问题（共 18 分，4 小题）type=解答
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 2,
 '{"stem":"体育器材室有 18 个球，借走了 9 个，还剩多少个球？","options":null}',
 '18-9=9(个)', '18-9=9（个）', 'paper', '["v23","摸底卷","p003"]', '["paper_png/yg2_sx/p003.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"买一盏台灯（38元）和一条裙子（54元），一共需要多少元？（图意待补：价目表）","options":null}',
 '38+54=92(元)', '38+54=92（元），p113 答案吻合', 'paper', '["v23","摸底卷","p004","图意待补"]', '["paper_png/yg2_sx/p004.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"周末搞促销活动，"满 50 元减 10 元"。乐乐买了一辆玩具汽车（35 元）和一个排球（15 元），能减 10 元吗？（图意待补：8 件商品价目表）","options":null}',
 '35+15=50(元)，能减 10 元', '35+15=50（元），满 50 元可减 10 元', 'paper', '["v23","摸底卷","p004","图意待补"]', '["paper_png/yg2_sx/p004.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
 (SELECT id FROM knowledge_nodes WHERE subject='数学' AND grade='二年级' AND level=1 LIMIT 1),
 '数学', '二年级', '解答', 3,
 '{"stem":"果园里原来有 48 棵苹果树和 27 棵梨树，农民伯伯又栽了 19 棵果树。现在果园里一共有多少棵果树？","options":null}',
 '48+27+19=94(棵)', '48+27+19=94（棵），p113 答案吻合', 'paper', '["v23","摸底卷","p004"]', '["paper_png/yg2_sx/p004.png"]', 0);