# 📚 OFW 文档中心 - GitHub Pages 部署指南

## 快速部署（5 分钟）

### 步骤 1：创建 GitHub 仓库

1. 打开 https://github.com/new
2. 仓库名：`ofw-docs`（或你喜欢的名字）
3. 设为 **Public**（GitHub Pages 免费需要公开仓库）
4. 不要初始化 README，直接点 **Create repository**

---

### 步骤 2：推送代码到 GitHub

在终端执行以下命令（替换 `<你的用户名>` 和 `<你的仓库名>`）：

```bash
cd /app/working/workspaces/RAKkDm

# 配置 Git（首次使用需要）
git config user.name "你的 GitHub 用户名"
git config user.email "你的邮箱@example.com"

# 添加所有文件
git add docs/

# 提交
git commit -m "Initial commit: OFW 文档中心"

# 关联远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/<你的用户名>/<你的仓库名>.git

# 推送到 main 分支
git push -u origin main
```

---

### 步骤 3：启用 GitHub Pages

1. 打开你的 GitHub 仓库页面
2. 点击 **Settings** → 左侧 **Pages**
3. **Source** 选择：`Deploy from a branch`
4. **Branch** 选择：`main` + `/docs` 文件夹
5. 点击 **Save**

或者：

4. **Branch** 选择：`gh-pages` 分支
5. 点击 **Save**

---

### 步骤 4：访问你的文档网站

等待 1-2 分钟，GitHub 会生成网站。

访问地址：
```
https://<你的用户名>.github.io/<你的仓库名>/docs/index.html
```

例如：
```
https://diwei.github.io/ofw-docs/docs/index.html
```

---

## 方案对比

### 方案 A：main 分支 + /docs 文件夹（推荐）

```
仓库结构：
ofw-docs/
├── docs/          ← GitHub Pages 从这里读取
│   ├── index.html
│   ├── prd/
│   └── ...
├── README.md
└── ...

访问地址：https://用户名.github.io/ofw-docs/docs/index.html
```

**优点**：代码和文档在同一仓库，管理方便

---

### 方案 B：gh-pages 分支（更专业）

```bash
# 创建 gh-pages 分支
git checkout --orphan gh-pages
git reset --hard
git add docs/*
git commit -m "Deploy docs"
git push origin gh-pages --force
```

```
仓库结构：
main 分支：源代码
gh-pages 分支：只包含 docs/ 内容

访问地址：https://用户名.github.io/ofw-docs/index.html
```

**优点**：访问链接更简洁，分离源码和部署

---

## 自动化部署脚本

### deploy-to-github.sh

```bash
#!/bin/bash

# 配置
GITHUB_USER="<你的用户名>"
REPO_NAME="ofw-docs"
GITHUB_TOKEN="<你的 Personal Access Token>"  # 可选，用于自动推送

# 检查配置
if [ -z "$GITHUB_USER" ]; then
    echo "❌ 请设置 GITHUB_USER"
    exit 1
fi

# 初始化 Git
git init --initial-branch=main 2>/dev/null || true
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_USER@users.noreply.github.com"

# 添加文件
git add docs/
git commit -m "Deploy docs: $(date '+%Y-%m-%d %H:%M:%S')"

# 推送
if [ -n "$GITHUB_TOKEN" ]; then
    git remote add origin https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git 2>/dev/null || true
else
    git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git 2>/dev/null || true
fi

git push -u origin main

echo ""
echo "✅ 部署完成！"
echo "🌐 访问地址：https://$GITHUB_USER.github.io/$REPO_NAME/docs/index.html"
```

---

## 使用 GitHub Actions 自动部署（高级）

创建 `.github/workflows/deploy.yml`：

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
    paths:
      - 'docs/**'

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./docs
          publish_branch: gh-pages
```

**优点**：每次 push 自动部署，无需手动操作

---

## 常见问题

### Q: 页面显示 404？

**A**: 等待 1-2 分钟，GitHub 需要时间构建。检查：
- Pages 设置是否正确
- 文件路径是否正确（区分大小写）

### Q: 样式不显示？

**A**: 检查 HTML 中的 CSS/JS 路径，使用相对路径：
```html
<!-- 正确 -->
<link rel="stylesheet" href="style.css">

<!-- 错误 -->
<link rel="stylesheet" href="/style.css">
```

### Q: 如何更新文档？

**A**: 修改文件后重新 push：
```bash
git add docs/
git commit -m "Update docs"
git push
```

### Q: 如何自定义域名？

**A**: 
1. 在 Pages 设置中添加自定义域名
2. 在你的域名 DNS 添加 CNAME 记录

---

## 一键部署命令

```bash
# 替换为你的信息
export GITHUB_USER="你的用户名"
export REPO_NAME="ofw-docs"

# 执行部署
cd /app/working/workspaces/RAKkDm
git init --initial-branch=main
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_USER@users.noreply.github.com"
git add docs/
git commit -m "Initial commit"
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
git push -u origin main

echo "✅ 完成！访问：https://$GITHUB_USER.github.io/$REPO_NAME/docs/index.html"
```

---

## 下一步

1. **创建 GitHub 仓库**
2. **运行部署命令**
3. **启用 GitHub Pages**
4. **分享链接给团队**

---

**需要我帮你执行部署吗？告诉我你的 GitHub 用户名即可。**
