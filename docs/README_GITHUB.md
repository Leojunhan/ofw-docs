# 📚 OFW 项目文档中心

统一的文档预览和管理中心。

## 🌐 访问方式

### 本地访问
```
http://localhost:9001/index.html
```

### 公网访问（Cloudflare Tunnel）
```
https://university-while-honest-twin.trycloudflare.com
```
⚠️ 临时链接，重启后失效

### GitHub Pages（推荐，永久）
```
https://<你的用户名>.github.io/ofw-docs/docs/index.html
```

---

## 📁 目录结构

```
docs/
├── index.html              # 🏠 统一预览门户
├── README.md               # 📖 访问指南
├── GITHUB_DEPLOY.md        # 📤 GitHub 部署指南
├── deploy_github.sh        # 🔧 部署脚本
├── start_server.sh         # 🔧 本地服务启动
├── prd/                    # 📝 PRD 文档
├── project/                # 📋 项目文档
├── review/                 # 🔍 评审文档
├── strategy/               # 📊 战略文档
├── architecture/           # 🏗️ 架构文档
└── archive/                # 📦 归档文档
```

---

## 🚀 快速开始

### 本地服务

```bash
# 启动服务
./start_server.sh

# 访问
http://localhost:9001/index.html
```

### 部署到 GitHub Pages

```bash
# 一键部署（替换为你的 GitHub 用户名）
./deploy_github.sh <你的用户名> ofw-docs

# 然后手动 push
git push -u origin main
```

详细步骤见 [GITHUB_DEPLOY.md](./GITHUB_DEPLOY.md)

---

## 📋 文档分类

| 分类 | 说明 | 示例 |
|------|------|------|
| 📊 Strategy | 战略文档（MRD/BRD/顶层设计） | ofw_strategy_top_level_design.md |
| 📝 PRD | 产品需求文档 | OFW_FB_Traffic_Agent_PRD_v1.md |
| 🏗️ Architecture | 技术架构文档 | - |
| 🔍 Review | 评审文档 | hunter-agent-prd-review.md |
| 📋 Project | 项目文档 | OFW_FB_Agent_Task_Breakdown.md |
| 📦 Archive | 归档旧版本 | OFW_MRD_v1_backup.md |

---

## 🔧 服务管理

| 操作 | 命令 |
|------|------|
| 启动本地服务 | `./start_server.sh` |
| 停止服务 | `kill $(lsof -t -i:9001)` |
| 部署到 GitHub | `./deploy_github.sh <用户名>` |
| 检查状态 | `curl -I http://localhost:9001/index.html` |

---

## 📤 部署选项对比

| 方式 | 优点 | 缺点 | 适用场景 |
|------|------|------|---------|
| **本地服务** | 零配置，立刻可用 | 仅本机访问 | 本地开发 |
| **Cloudflare Tunnel** | 公网可访问 | 链接临时 | 临时分享 |
| **GitHub Pages** | 永久链接，免费 | 需 GitHub 账号 | 团队共享 ✅ |

---

## 🛠️ 自动化

### GitHub Actions 自动部署

已配置 `.github/workflows/deploy.yml`，push 到 main 分支自动部署。

### 添加新文档

1. 将文档放入对应分类目录
2. 编辑 `index.html` 更新文档列表
3. Git push 触发自动部署

---

## 📞 维护

- **最后更新**: 2026-04-16
- **维护者**: 小宁 (RAKkDm)
