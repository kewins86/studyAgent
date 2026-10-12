-- ============================================================
-- k9教育智能体 · 本地数据库初始化脚本
-- 用途：创建数据库 k9_edu + 专用账号 k9（仅需执行一次）
-- 执行方式（root 免密）：
--   /Users/seraphimes86/tools/mysql/bin/mysql --socket=/tmp/mysql.sock -u root < init_db.sql
-- ============================================================

CREATE DATABASE IF NOT EXISTS k9_edu
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- 应用账号（后端 application.yml 使用）
CREATE USER IF NOT EXISTS 'k9'@'localhost' IDENTIFIED BY 'k9edu123';
CREATE USER IF NOT EXISTS 'k9'@'127.0.0.1' IDENTIFIED BY 'k9edu123';

GRANT ALL PRIVILEGES ON k9_edu.* TO 'k9'@'localhost';
GRANT ALL PRIVILEGES ON k9_edu.* TO 'k9'@'127.0.0.1';
FLUSH PRIVILEGES;

-- 注意：表结构（12张表）与种子数据（40知识点）由 Flyway 自动管理，
-- 位置：back/src/main/resources/db/migration/（V1__init.sql + V2__seed_g3_math.sql）
-- 后端启动时自动执行，无需手动建表。
-- 本目录 schema.sql / seed_g3_math.sql 仅为手动初始化/参考副本。
