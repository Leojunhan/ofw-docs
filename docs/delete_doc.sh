#!/bin/bash

# OFW 文档管理系统 - 删除脚本
# 用法：./delete_doc.sh <文档路径>
# 示例：./delete_doc.sh docs/architecture/hunter-architecture-v1.2.md

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查参数
if [ -z "$1" ]; then
    echo -e "${RED}错误：请指定要删除的文档路径${NC}"
    echo "用法：./delete_doc.sh <文档路径>"
    echo "示例：./delete_doc.sh docs/architecture/hunter-architecture-v1.2.md"
    exit 1
fi

DOC_PATH="$1"
WORKSPACE_DIR="/app/working/workspaces/RAKkDm"

# 切换到工作区
cd "$WORKSPACE_DIR"

# 检查文件是否存在
if [ ! -f "$DOC_PATH" ]; then
    echo -e "${RED}错误：文件不存在 - $DOC_PATH${NC}"
    exit 1
fi

# 显示确认信息
echo -e "${YELLOW}==================================${NC}"
echo -e "${YELLOW}📋 删除确认${NC}"
echo -e "${YELLOW}==================================${NC}"
echo -e "文件：${RED}$DOC_PATH${NC}"
echo -e "大小：$(du -h "$DOC_PATH" | cut -f1)"
echo -e "修改时间：$(stat -c %y "$DOC_PATH" 2>/dev/null || stat -f %Sm "$DOC_PATH")"
echo ""
echo -e "${YELLOW}==================================${NC}"
echo -e "${YELLOW}⚠️  此操作将：${NC}"
echo -e "   1. 删除文档文件"
echo -e "   2. 从 index.html 移除索引条目"
echo -e "   3. 提交并推送到 GitHub"
echo -e "${YELLOW}==================================${NC}"
echo ""

# 询问确认
read -p "确认删除？(y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}已取消删除操作${NC}"
    exit 0
fi

# 获取文件名（用于 index.html 搜索）
FILENAME=$(basename "$DOC_PATH")
echo ""
echo -e "${GREEN}✅ 开始删除...${NC}"

# 1. 备份 index.html（以防万一）
cp docs/index.html docs/index.html.backup
echo "✓ 已备份 index.html"

# 2. 从 index.html 中移除对应的条目
# 查找包含文件名的条目并删除整个对象块
if grep -q "$FILENAME" docs/index.html; then
    # 使用 sed 删除包含该文件名的整个文档对象
    # 找到包含 title 的行到下一个 }, 行
    python3 << PYTHON_SCRIPT
import re

with open('docs/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 查找并删除包含该文件名的文档对象
filename = '$FILENAME'
pattern = r'\s*\{\s*[^}]*?(?:path|title):\s*["\'][^"\']*?' + re.escape(filename) + r'[^"\']*?["\'][^}]*?\},?'

new_content = re.sub(pattern, '', content, flags=re.DOTALL)

if new_content != content:
    with open('docs/index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"✓ 已从 index.html 移除 {filename} 的索引条目")
else:
    print(f"⚠️  未在 index.html 中找到 {filename} 的索引条目（可能已手动删除）")
PYTHON_SCRIPT
else
    echo "⚠️  未在 index.html 中找到该文件的索引条目"
fi

# 3. 删除文档文件
rm "$DOC_PATH"
echo "✓ 已删除文件：$DOC_PATH"

# 4. 检查是否有对应的 HTML 文件（如果有也删除）
HTML_PATH="${DOC_PATH%.md}.html"
if [ -f "$HTML_PATH" ]; then
    rm "$HTML_PATH"
    echo "✓ 已删除关联 HTML：$HTML_PATH"
fi

# 5. Git 操作
echo ""
echo -e "${GREEN}📦 提交更改到 GitHub...${NC}"
git add "$DOC_PATH" docs/index.html
git commit -m "docs: 删除文档 $FILENAME

自动删除操作"
git push

echo ""
echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}✅ 删除完成！${NC}"
echo -e "${GREEN}==================================${NC}"
echo "文件：$DOC_PATH"
echo "提交：已推送到 GitHub"
echo "部署：GitHub Pages 将自动更新（约 1-2 分钟）"
echo ""
echo -e "${YELLOW}访问文档中心查看更新：${NC}"
echo "https://Leojunhan.github.io/ofw-docs/"
