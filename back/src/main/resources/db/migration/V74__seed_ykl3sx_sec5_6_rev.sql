-- ykl3sx 一课一练(华师大) 三上数学 5.3闰年/6.2排序/6.3换算/4章复习比较 共7题
-- 锚证:
--  1. 6.3 p129题1(1) 选C: 选项A 30cm=3mm✗ B 7m=700mm✗(7000mm) C 3km12m=3012m✓ D 5km=500dm✗(5000m) — ans_209题1(1)C
--  2. 5.3 p121(1) 闰年规律空5 = 1844 1852 1916 1928 1932(每+4,均÷4整除) — ans_207题4(1)全对位
--  3. 5.3 p121(2) 4判: 2002✗(÷4余2) 2008✓ 2018✗ 2020✓ — ans_207题4(2)注2008/2020闰
--  4. 6.2 p128(1) 长度排序(从小到大): 3cm3mm=33mm < 330mm < 3m3cm=3030mm < 33dm=3300mm — ans_208题5(1)序全对位
--  5. 4章复习p113 比较3组(自证,节归属不明=4.21页2复习区): 58×400=23200>580×4=2320; 926÷60<926÷9(除数大商小); 536÷70≈7.6<635÷7≈90.7
-- node: 1045=1, 1037=2, 1040=1, 1014=2, 1026=1
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1045, '数学', '三年级', '选择', 1, '{"stem": "下面单位换算正确的是（ ）", "options": ["A. 30cm=3mm", "B. 7m=700mm", "C. 3km12m=3012m", "D. 5km=500dm"]}', 'C', 'A：30cm=300mm；B：7m=7000mm；C：3km=3000m，3000+12=3012m，正确；D：5km=5000m，而500dm=50m。', 'paper', '["practice", "ykl3sx", "6.3"]', '["paper_png/ykl3_sx/p129.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1037, '数学', '三年级', '填空', 2, '{"stem": "按规律填年份：1836年、1840年、（ ）年、1848年、（ ）年、1856年……1912年、（ ）年、1920年、1924年、（ ）年、（ ）年", "options": null}', '1844；1852；1916；1928；1932', '相邻闰年相隔4年，且各数都能被4整除：1840+4=1844、1844+4=1848……1924+4=1928、1928+4=1932。', 'paper', '["practice", "ykl3sx", "5.3"]', '["paper_png/ykl3_sx/p121.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1037, '数学', '三年级', '判断', 1, '{"stem": "是闰年的在括号里打√：2002年（ ）2008年（ ）2018年（ ）2020年（ ）", "options": null}', '×；√；×；√', '2008÷4=502、2020÷4=505，整除为闰年；2002、2018 除以4都余2，是平年。', 'paper', '["practice", "ykl3sx", "5.3"]', '["paper_png/ykl3_sx/p121.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1040, '数学', '三年级', '填空', 2, '{"stem": "把下面各数量按从小到大的顺序排列：3m3cm、330mm、33dm、3cm3mm", "options": null}', '3cm3mm<330mm<3m3cm<33dm', '都换成毫米：3cm3mm=33mm、330mm、3m3cm=3030mm、33dm=3300mm，33<330<3030<3300。', 'paper', '["practice", "ykl3sx", "6.2"]', '["paper_png/ykl3_sx/p128.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1014, '数学', '三年级', '填空', 2, '{"stem": "在○里填上“＞”“＜”或“＝”：58×400○580×4", "options": null}', '＞', '58×400=23200，580×4=2320，23200＞2320。', 'paper', '["practice", "ykl3sx", "复习4"]', '["paper_png/ykl3_sx/p113.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1026, '数学', '三年级', '填空', 2, '{"stem": "在○里填上“＞”“＜”或“＝”：926÷60○926÷9", "options": null}', '＜', '被除数相同，除数越大商越小：60＞9，所以926÷60＜926÷9。', 'paper', '["practice", "ykl3sx", "复习4"]', '["paper_png/ykl3_sx/p113.png"]', 0);
INSERT INTO questions (node_id, subject, grade, type, difficulty, content, answer, analysis, source, tags, images, deleted) VALUES (
1026, '数学', '三年级', '填空', 3, '{"stem": "在○里填上“＞”“＜”或“＝”：536÷70○635÷7", "options": null}', '＜', '536÷70≈7.6，635÷7≈90.7（635÷7=90余5），所以536÷70＜635÷7。', 'paper', '["practice", "ykl3sx", "复习4"]', '["paper_png/ykl3_sx/p113.png"]', 0);
