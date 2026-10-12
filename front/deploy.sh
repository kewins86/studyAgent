#!/bin/bash
# ============================================================
# K9-Edu 前端：打包 + 上传（自动输密码，无需 sshpass / 无需手动输入）
# 用法：bash deploy.sh
# 依赖：macOS 自带 expect；上传用 tar over ssh（服务器需有 tar，Linux 自带）
# ============================================================
set -e

FRONT_DIR="$(cd "$(dirname "$0")" && pwd)"
REMOTE="root@47.103.25.200"
REMOTE_DIR="/data/k9"
SSH_OPTS="-o StrictHostKeyChecking=no"
# 密码写在脚本里，由 expect 自动发送（无需手动输入，也无需 sshpass）
export DEPLOY_PW='7777jjjjJ&'
export SSH_OPTS REMOTE REMOTE_DIR FRONT_DIR

echo "==> [1/3] 打包 H5 (npm run build:h5)"
cd "$FRONT_DIR"
npm run build:h5

echo "==> [2/3] 上传 -> $REMOTE:$REMOTE_DIR/ （tar over ssh，无需 rsync）"
expect <<'EXP'
set timeout 600
spawn sh -c "cd $::env(FRONT_DIR)/dist/build/h5 && COPYFILE_DISABLE=1 tar czf - . | ssh $::env(SSH_OPTS) $::env(REMOTE) 'mkdir -p $::env(REMOTE_DIR) && tar xzf - -C $::env(REMOTE_DIR)'"
expect {
  -re {[Pp]assword:} { send "$::env(DEPLOY_PW)\r"; exp_continue }
  eof
}
EXP

echo "==> [2.5/3] 清理 macOS 残留的 ._ 文件"
expect <<'EXP'
set timeout 60
spawn ssh $::env(SSH_OPTS) $::env(REMOTE) "find $::env(REMOTE_DIR) -name '._*' -delete"
expect {
  -re {[Pp]assword:} { send "$::env(DEPLOY_PW)\r"; exp_continue }
  eof
}
EXP

echo "==> [3/3] 校验远程目录"
expect <<'EXP'
set timeout 60
spawn ssh $::env(SSH_OPTS) $::env(REMOTE) "ls -la $::env(REMOTE_DIR)"
expect {
  -re {[Pp]assword:} { send "$::env(DEPLOY_PW)\r"; exp_continue }
  eof
}
EXP

echo "==> 完成。服务器上请手动："
echo "    1) 把本项目 nginx/k9.conf 复制到 /etc/nginx/conf.d/k9.conf"
echo "    2) nginx -t && nginx -s reload"
echo "    3) 浏览器访问 http://47.103.25.200/ （见下方 IP 直访提示）"
