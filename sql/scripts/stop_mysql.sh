#!/bin/bash
# ============================================================
# k9教育智能体 · MySQL 停止脚本
# ============================================================
set -e

MYSQL_BIN="$HOME/tools/mysql/bin"

if [ ! -S /tmp/mysql.sock ]; then
  echo "ℹ️  MySQL 未在运行"
  exit 0
fi

echo "🛑 正在停止 MySQL..."
"$MYSQL_BIN/mysqladmin" --socket=/tmp/mysql.sock -u root shutdown
echo "✅ MySQL 已停止"
