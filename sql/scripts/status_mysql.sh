#!/bin/bash
# ============================================================
# k9教育智能体 · MySQL 状态查看脚本
# ============================================================
MYSQL_BIN="$HOME/tools/mysql/bin"

echo "=== 进程状态 ==="
if pgrep -f "mysqld.*k9-edu-data" > /dev/null 2>&1; then
  PID=$(pgrep -f "mysqld.*k9-edu-data")
  echo "✅ mysqld 运行中 (pid $PID)"
else
  echo "❌ mysqld 未运行"
fi

echo ""
echo "=== Socket 状态 ==="
if [ -S /tmp/mysql.sock ]; then
  echo "✅ /tmp/mysql.sock 就绪"
else
  echo "❌ /tmp/mysql.sock 不存在"
fi

echo ""
echo "=== 连接测试 ==="
"$MYSQL_BIN/mysqladmin" --socket=/tmp/mysql.sock -u root status 2>/dev/null \
  && echo "✅ 正常连接" \
  || echo "❌ 连接失败"

echo ""
echo "=== 库与表 ==="
"$MYSQL_BIN/mysql" --socket=/tmp/mysql.sock -u root --default-character-set=utf8mb4 -e \
  "SHOW DATABASES LIKE 'k9_edu'; USE k9_edu; SHOW TABLES;" 2>/dev/null
