# 🎯 Hunter 系统文档中心

> **Hunter 定位：** 用户注意力的截流与转化引擎  
> **核心指标：** 触达→申请转化率 >15%

---

## 📂 文档目录

```
docs/
├── index.html                  # 🏠 文档中心首页
├── README.md                   # 📖 本文档
├── strategy/                   # 📊 战略文档
│   └── hunter-redefined-v2.0.md    # Hunter 重新定义（核心）
├── prd/                        # 📝 产品需求文档
│   └── hunter-agent-management-v1.0.md  # Hunter PRD
├── architecture/               # 🏗️ 架构文档
│   └── hunter-architecture-v1.2.md      # Hunter 架构（已归档）
├── review/                     # 🔍 评审文档
│   └── hunter-agent-prd-review.md       # PRD 评审意见
└── archive/                    # 📦 归档文档
    ├── meta_agent_design.md           # 元智能体设计
    ├── A2A_MVP_SUMMARY.md             # A2A MVP 总结
    ├── MCP_INTEGRATION_SUMMARY.md     # MCP 集成总结
    ├── PHASE2_SUMMARY.md              # Phase 2 总结
    └── HUNTER_AGENT_DEV_START.md      # Hunter 开发启动
```

---

## 🌐 访问方式

### 方式 1：GitHub Pages（推荐）

**https://Leojunhan.github.io/ofw-docs/**

✅ 永久访问  ✅ 自动同步  ✅ 无需本地环境

### 方式 2：本地 HTTP 服务

```bash
cd /app/working/workspaces/RAKkDm/docs
python3 -m http.server 9001

# 浏览器访问
http://localhost:9001/
```

### 方式 3：直接打开文件

```bash
# Linux
xdg-open /app/working/workspaces/RAKkDm/docs/index.html

# macOS
open /app/working/workspaces/RAKkDm/docs/index.html
```

---

## 📋 文档说明

| 文档 | 分类 | 说明 |
|------|------|------|
| **Hunter 重新定义 v2.0** | 战略 | Hunter 新定位：注意力截流与转化引擎（核心文档） |
| **Hunter Agent PRD v1.0** | PRD | Hunter Agent 管理系统产品需求 |
| **Hunter 架构 v1.2** | 架构 | Hunter 系统产品架构（已归档，供参考） |
| **Hunter Agent PRD 评审** | 评审 | PRD 评审意见 |

---

## 🗑️ 文档维护

### 删除文档

**单个删除：**
```bash
cd /app/working/workspaces/RAKkDm
./docs/delete_doc.sh docs/path/to/file.md
```

**批量删除：**
1. 编辑 `.github/workflows/delete-doc.yml`（如需要）
2. 手动删除文件并更新 `index.html`
3. 提交推送：`git add . && git commit -m "docs: 删除 xxx" && git push`

### 添加文档

1. 在对应目录创建 `.md` 文件
2. 更新 `index.html` 中的 `documents` 数组
3. 提交推送：`git add . && git commit -m "docs: 新增 xxx" && git push`

---

## 🎯 Hunter 核心概念

### 定位
**用户注意力的截流与转化引擎**

### 核心指标
- 触达→申请转化率 >15%
- 获客成本 <$1/人
- 日均获客 2000-5000 人

### 聚焦 Agent（5 个）
1. **FB 社群 Agent** - 注意力捕捉
2. **意图分类 Agent** - 需求理解
3. **知识库 Agent** - 信任建立
4. **申请引导 Agent** - 转化引导
5. **数据回流 Agent** - 优化闭环

### 与 Agent Manager 关系
- **Hunter** = 业务引擎（负责获客转化）
- **Agent Manager** = 技术调度（负责任务执行）

---

## 📞 需要帮助？

查看核心文档：
- **Hunter 重新定义** - 理解 Hunter 定位和战略
- **Hunter PRD** - 了解产品功能设计
- **Hunter 架构** - 了解系统架构设计

---

**最后更新：** 2026-04-16  
**文档版本：** v1.0
