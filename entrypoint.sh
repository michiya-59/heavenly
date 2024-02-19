#!/bin/bash
set -e

# Railsアプリケーションのサーバーが生成するPIDファイルを削除する
# コンテナが正常に起動できないことがあるため
rm -f /heavenly/tmp/pids/server.pid

# コンテナのプロセスを実行
exec "$@"
