# k9教育智能体 · 本地数据库说明

本目录存放项目本地数据库（MySQL 8.4.11）相关脚本与代码。

## 数据库信息

| 项 | 值 |
|---|---|
| 数据库 | `k9_edu`（utf8mb4） |
| 账号 | `k9` / `k9edu123` |
| 地址 | `127.0.0.1:3306` |
| 安装位置 | `~/tools/mysql`（免 sudo 二进制解压） |
| 数据目录 | `~/k9-edu-data/mysql` |

## 常用操作

```bash
# 启动 / 停止 / 查看状态
~/Documents/studyAgent/sql/scripts/start_mysql.sh
~/Documents/studyAgent/sql/scripts/stop_mysql.sh
~/Documents/studyAgent/sql/scripts/status_mysql.sh

# 命令行连接
~/tools/mysql/bin/mysql --socket=/tmp/mysql.sock -u root --default-character-set=utf8mb4 k9_edu
```

## 表结构管理（重要）

**表结构和种子数据由 Flyway 自动管理，后端启动时自动执行：**

- `back/src/main/resources/db/migration/V1__init.sql` — 12 张表建表
- `back/src/main/resources/db/migration/V2__seed_g3_math.sql` — 沪教版三上数学 8 章 40 知识点种子数据

新增/修改表结构时，**新建 V3__xxx.sql**（不要改旧脚本，Flyway 校验会失败）。

本目录的 `schema.sql` / `seed_g3_math.sql` 是 Flyway 脚本的**参考副本**，仅供手动初始化或排查问题，日常开发无需执行。

## 首次安装（已完成，仅记录）

1. 下载 `mysql-8.4.11-macos15-arm64.tar.gz`（160M，cdn.mysql.com）解压到 `~/tools/mysql`
2. `mysqld --initialize-insecure` 初始化数据目录（root 免密）
3. 后台启动 mysqld（port 3306, socket /tmp/mysql.sock）
4. 执行 `init_db.sql`：建库 `k9_edu` + 应用账号 `k9`

## 后端切换数据库（H2 ↔ MySQL）

`back/src/main/resources/application.yml` 中 datasource 段落已写好两套配置：

- **MySQL（默认）**：`jdbc:mysql://127.0.0.1:3306/k9_edu...`，账号 k9/k9edu123
- **H2（备选）**：注释掉的 `jdbc:h2:file:~/k9-edu-data/edu...` 段，取消注释并注释 MySQL 段即可

改完重启后端：`cd ~/Documents/studyAgent/back && mvn spring-boot:run`

## 数据验证

```sql
-- 12 张表
SHOW TABLES;
-- 知识点树：1 根 + 8 章 + 40 知识点 = 49 节点
SELECT COUNT(*) FROM knowledge_nodes;              -- 49
SELECT COUNT(*) FROM knowledge_nodes WHERE level=2; -- 8
```
