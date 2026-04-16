#!/bin/bash

# OFW 文档管理系统 - 批量删除脚本
# 用法：./batch_delete.sh
# 基于 DELETE_LIST.md 中的待删除列表批量删除文档

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

WORKSPACE_DIR="/app/working/workspaces/RAKkDm"
DELETE_LIST="$WORKSPACE_DIR/docs/DELETE_LIST.md"

# 切换到工作区
cd "$WORKSPACE_DIR"

echo -e "${BLUE}==================================${NC}"
echo -e "${BLUE}📋 OFW 文档批量删除工具${NC}"
echo -e "${BLUE}==================================${NC}"
echo ""

# 检查 DELETE_LIST.md 是否存在
if [ ! -f "$DELETE_LIST" ]; then
    echo -e "${RED}错误：DELETE_LIST.md 不存在${NC}"
    exit 1
fi

# 提取待删除列表（从代码块中提取）
TODO_DELETE=$(grep -A 100 "## 📋 待删除列表" "$DELETE_LIST" | grep -B 100 "^---" | grep "^docs/" | grep "\.md$" || true)

# 检查是否有待删除文档
if [ -z "$TODO_DELETE" ]; then
    echo -e "${YELLOW}待删除列表为空${NC}"
    echo "请在 DELETE_LIST.md 的"待删除列表"部分添加文档路径"
    exit 0
fi

# 显示待删除文档
echo -e "${YELLOW}📋 待删除文档列表：${NC}"
echo "-----------------------------------"
echo "$TODO_DELETE"
echo "-----------------------------------"
echo ""

# 统计
TOTAL=$(echo "$TODO_DELETE" | wc -l | tr -d ' ')
echo -e "${BLUE}共 ${TOTAL} 个文档待删除${NC}"
echo ""

# 询问确认
echo -e "${YELLOW}==================================${NC}"
echo -e "${YELLOW}⚠️  此操作将：${NC}"
echo -e "   1. 删除所有列出的文档文件"
echo -e "   2. 从 index.html 移除索引条目"
echo -e "   3. 提交并推送到 GitHub"
echo -e "   4. 更新 DELETE_LIST.md（移到已删除记录）"
echo -e "${YELLOW}==================================${NC}"
echo ""

read -p "确认批量删除？(y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}已取消删除操作${NC}"
    exit 0
fi

# 备份 index.html
cp docs/index.html docs/index.html.backup
echo "✓ 已备份 index.html"
echo ""

# 开始删除
DELETED_COUNT=0
FAILED_COUNT=0
DELETE_DATE=$(date +%Y-%m-%d)

echo -e "${GREEN}🗑️  开始批量删除...${NC}"
echo ""

while IFS= read -r doc_path; do
    # 跳过空行
    [ -z "$doc_path" ] && continue
    
    # 去除首尾空格
    doc_path=$(echo "$doc_path" | xargs)
    
    echo -e "${BLUE}处理：$doc_path${NC}"
    
    # 检查文件是否存在
    if [ ! -f "$doc_path" ]; then
        echo -e "  ${YELLOW}⚠️  文件不存在，跳过${NC}"
        ((FAILED_COUNT++)) || true
        continue
    fi
    
    # 获取文件名
    filename=$(basename "$doc_path")
    
    # 从 index.html 中移除条目
    python3 << PYTHON_SCRIPT
import re

with open('docs/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

filename = '$filename'
pattern = r'\s*\{\s*[^}]*?(?:path|title):\s*["\'][^"\']*?' + re.escape(filename) + r'[^"\']*?["\'][^}]*?\},?'

new_content = re.sub(pattern, '', content, flags=re.DOTALL)

if new_content != content:
    with open('docs/index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"  ✓ 已从 index.html 移除索引")
else:
    print(f"  ⚠️  未在 index.html 中找到索引条目")
PYTHON_SCRIPT
    
    # 删除文件
    rm "$doc_path"
    echo -e "  ${GREEN}✓ 已删除文件${NC}"
    
    # 检查关联 HTML
    html_path="${doc_path%.md}.html"
    if [ -f "$html_path" ]; then
        rm "$html_path"
        echo -e "  ${GREEN}✓ 已删除关联 HTML${NC}"
    fi
    
    ((DELETED_COUNT++)) || true
    echo ""
done <<< "$TODO_DELETE"

# 更新 DELETE_LIST.md
echo -e "${BLUE}📝 更新 DELETE_LIST.md...${NC}"

# 提取已删除的文档列表（用于添加到已删除记录）
DELETED_FILES=$(echo "$TODO_DELETE" | while IFS= read -r path; do
    [ -z "$path" ] && continue
    path=$(echo "$path" | xargs)
    filename=$(basename "$path")
    echo "| $DELETE_DATE | $path | 批量维护删除 | 自动 |"
done)

# 清空待删除列表
python3 << PYTHON_SCRIPT
with open('docs/DELETE_LIST.md', 'r', encoding='utf-8') as f:
    content = f.read()

# 清空待删除列表代码块
import re
content = re.sub(
    r'(## 📋 待删除列表\n\n在下方添加需要删除的文档路径.*?)(```\n)(.*?)(```)',
    r'\1\2\n\4',
    content,
    flags=re.DOTALL
)

with open('docs/DELETE_LIST.md', 'w', encoding='utf-8') as f:
    f.write(content)

print("✓ 已清空待删除列表")
PYTHON_SCRIPT

# Git 操作
echo ""
echo -e "${GREEN}📦 提交更改到 GitHub...${NC}"
git add docs/
git commit -m "docs: 批量删除 $DELETED_COUNT 个文档

自动批量删除操作
删除文件数：$DELETED_COUNT
失败文件数：$FAILED_COUNT"
git push

# 显示结果
echo ""
echo -e "${GREEN}==================================${NC}"
echo -e "${GREEN}✅ 批量删除完成！${NC}"
echo -e "${GREEN}==================================${NC}"
echo "成功删除：$DELETED_COUNT 个文档"
echo "失败/跳过：$FAILED_COUNT 个文档"
echo "提交：已推送到 GitHub"
echo "部署：GitHub Pages 将自动更新（约 1-2 分钟）"
echo ""
echo -e "${YELLOW}访问文档中心查看更新：${NC}"
echo "https://Leojunhan.github.io/ofw-docs/"
