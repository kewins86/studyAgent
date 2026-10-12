#!/bin/bash
# ============================================================
# k9教育智能体 · MySQL 启动脚本（免 sudo，用户级安装）
# MySQL 位置：~/tools/mysql（8.4.11，macOS arm64 二进制解压）
# 数据目录：~/k9-edu-data/mysql
# ============================================================
set -e

MYSQL_BIN="$HOME/tools/mysql/bin"
DATADIR="$HOME/k9-edu-data/mysql"

# 已在运行则跳过
if [ -S /tmp/mysql.sock ] || pgrep -f "mysqld.*k9-edu-data" > /dev/null 2>&1; then
  echo "✅ MySQL 已在运行 (socket: /tmp/mysql.sock)"
  exit 0
fi

# 首次初始化（无数据目录时）
if [ ! -d "$DATADIR/mysql" ]; then
  echo "📦 首次运行，初始化数据目录..."
  mkdir -p "$DATADIR"
  "$MYSQL_BIN/mysqld" --initialize-insecure \
    --datadir="$DATADIR" \
    --basedir="$HOME/tools/mysql"
  echo "✅ 初始化完成（root 免密）"
fi

echo "🚀 启动 mysqld (port 3306)..."
nohup "$MYSQL_BIN/mysqld" \
  --datadir="$DATADIR" \
  --basedir="$HOME/tools/mysql" \
  --port=3306 \
  --socket=/tmp/mysql.sock \
  --pid-file=/tmp/mysql.pid \
  > /tmp/mysql.log 2>&1 &

sleep 5
"$MYSQL_BIN/mysqladmin" --socket=/tmp/mysql.sock -u root status > /dev/null 2>&1 \
  && echo "✅ MySQL 就绪 (port 3306)" \
  || { echo "❌ 启动失败，日志见 /tmp/mysql.log"; tail -20 /tmp/mysql.log; exit 1; }
