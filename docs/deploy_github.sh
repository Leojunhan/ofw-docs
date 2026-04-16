#!/bin/bash

# OFW 文档中心 - GitHub Pages 部署脚本
# 使用方法：./deploy_github.sh <你的 GitHub 用户名> <仓库名>

set -e

GITHUB_USER=${1:-""}
REPO_NAME=${2:-"ofw-docs"}
DOCS_DIR="/app/working/workspaces/RAKkDm/docs"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================"
echo "📚 OFW 文档中心 - GitHub Pages 部署"
echo "========================================"
echo ""

# 检查参数
if [ -z "$GITHUB_USER" ]; then
    echo -e "${RED}❌ 用法：$0 <GitHub 用户名> [仓库名]${NC}"
    echo ""
    echo "示例："
    echo "  $0 diwei ofw-docs"
    echo "  $0 diwei  # 使用默认仓库名 ofw-docs"
    echo ""
    exit 1
fi

echo -e "${YELLOW}📋 部署配置:${NC}"
echo "  GitHub 用户名：$GITHUB_USER"
echo "  仓库名：$REPO_NAME"
echo "  文档目录：$DOCS_DIR"
echo ""

# 检查目录
if [ ! -d "$DOCS_DIR" ]; then
    echo -e "${RED}❌ 文档目录不存在：$DOCS_DIR${NC}"
    exit 1
fi

# 检查 Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git 未安装${NC}"
    exit 1
fi

echo -e "${YELLOW}🔧 准备部署...${NC}"
echo ""

cd /app/working/workspaces/RAKkDm

# 初始化 Git
if [ ! -d ".git" ]; then
    echo "  → 初始化 Git 仓库..."
    git init --initial-branch=main
fi

# 配置 Git
git config user.name "$GITHUB_USER" 2>/dev/null || true
git config user.email "$GITHUB_USER@users.noreply.github.com" 2>/dev/null || true

# 添加文件
echo "  → 添加文档文件..."
git add docs/

# 检查是否有变化
if git diff --cached --quiet; then
    echo -e "${YELLOW}⚠️  没有变化的文件${NC}"
else
    echo "  → 提交文件..."
    git commit -m "Deploy docs: $(date '+%Y-%m-%d %H:%M:%S')"
fi

# 检查远程仓库
if git remote | grep -q "origin"; then
    echo "  → 更新远程仓库地址..."
    git remote set-url origin https://github.com/$GITHUB_USER/$REPO_NAME.git
else
    echo "  → 添加远程仓库..."
    git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
fi

echo ""
echo -e "${GREEN}✅ 本地准备完成！${NC}"
echo ""
echo "========================================"
echo "📤 下一步：推送到 GitHub"
echo "========================================"
echo ""
echo "请执行以下命令："
echo ""
echo -e "${YELLOW}git push -u origin main${NC}"
echo ""
echo "如果是第一次推送，可能需要输入 GitHub 账号密码或使用 Token。"
echo ""
echo "推送完成后："
echo "1. 打开 https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "2. Source 选择 'Deploy from a branch'"
echo "3. Branch 选择 'main'，文件夹选择 '/docs'"
echo "4. 点击 Save"
echo ""
echo "等待 1-2 分钟后访问："
echo -e "${GREEN}https://$GITHUB_USER.github.io/$REPO_NAME/docs/index.html${NC}"
echo ""
