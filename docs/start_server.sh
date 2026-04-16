#!/bin/bash
# OFW 文档中心服务启动脚本

PORT=9001
DOCS_DIR="/app/working/workspaces/RAKkDm/docs"

# 检查端口是否已被占用
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  端口 $PORT 已被占用，正在停止旧服务..."
    kill $(lsof -t -i:$PORT) 2>/dev/null
    sleep 1
fi

# 启动服务
echo "🚀 启动文档中心服务..."
echo "📂 服务目录：$DOCS_DIR"
echo "🌐 访问地址：http://localhost:$PORT/index.html"

nohup python3 -m http.server $PORT --directory $DOCS_DIR > /tmp/docs_server.log 2>&1 &

sleep 2

# 验证服务是否启动成功
if curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT/index.html | grep -q "200"; then
    echo "✅ 服务启动成功！"
    echo ""
    echo "📚 现在可以访问：http://localhost:$PORT/index.html"
else
    echo "❌ 服务启动失败，请查看日志：/tmp/docs_server.log"
fi
