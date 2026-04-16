# Hunter Agent 管理模块 · 原型预览

> 🤖 Hunter 系统是 OFW 信贷获客系统的 Agent 管理平台

---

## 📁 文件结构

```
prototypes/
├── dashboard.html          # Dashboard 数据看板
├── agents.html             # Agent 列表管理页
├── workflow-editor.html    # 工作流 YAML 编辑器
└── execution-detail.html   # 执行详情页

prd/
├── hunter-agent-management-v1.0.md    # PRD 需求文档
├── hunter-agent-dev-plan-v1.0.md      # 开发任务计划
├── hunter-agent-test-cases-v1.0.md    # 测试用例
└── hunter-agent-prototype-v1.0.md     # 页面原型设计文档
```

---

## 🌐 在线预览

### 方式 1：GitHub Pages（推荐）

访问 GitHub Pages 查看在线版本：

```
https://leojunhan.github.io/ofw-docs/prototypes/dashboard.html
```

**启用 GitHub Pages：**
1. 进入仓库 Settings → Pages
2. Source 选择 `prototypes` 分支
3. 等待部署完成

### 方式 2：直接下载

```bash
# 克隆仓库
git clone https://github.com/Leojunhan/ofw-docs.git
cd ofw-docs/prototypes

# 在浏览器中打开
open dashboard.html
open agents.html
open workflow-editor.html
open execution-detail.html
```

### 方式 3：本地服务器

```bash
cd prototypes
python3 -m http.server 8080

# 访问 http://localhost:8080/dashboard.html
```

---

## 📄 页面说明

### 1. Dashboard 数据看板 (`dashboard.html`)

**核心功能：**
- 📊 统计卡片（Agents、Workflows、Executions、在线率）
- 📈 执行趋势图（Chart.js 折线图）
- 🟢 Agent 状态分布
- 📝 最近执行记录表格

**预览：**
![Dashboard](../docs/images/dashboard-preview.png)

---

### 2. Agent 列表管理页 (`agents.html`)

**核心功能：**
- 🔍 搜索与筛选（类型、状态）
- ➕ 新建 Agent 弹窗
- 📋 Agent 列表表格
- ✅ 批量操作

**预览：**
![Agents](../docs/images/agents-preview.png)

---

### 3. 工作流 YAML 编辑器 (`workflow-editor.html`)

**核心功能：**
- 📝 YAML 代码编辑器
- 👁️ 步骤可视化预览
- ✅ 语法校验
- 🚀 保存/发布

**预览：**
![Workflow Editor](../docs/images/workflow-editor-preview.png)

---

### 4. 执行详情页 (`execution-detail.html`)

**核心功能：**
- 📊 执行基本信息
- 📈 步骤进度可视化
- 📜 执行日志（终端风格）
- 💾 导出/复制功能

**预览：**
![Execution Detail](../docs/images/execution-detail-preview.png)

---

## 🎨 技术栈

| 技术 | 用途 | 版本 |
|------|------|------|
| **Tailwind CSS** | UI 框架 | CDN v3 |
| **Font Awesome** | 图标库 | CDN v6.4 |
| **Chart.js** | 图表库 | CDN v4 |
| **HTML5** | 页面结构 | - |
| **JavaScript** | 交互逻辑 | ES6+ |

---

## 📋 相关文档

| 文档 | 路径 | 描述 |
|------|------|------|
| **PRD 需求文档** | `prd/hunter-agent-management-v1.0.md` | 产品需求规格说明 |
| **开发计划** | `prd/hunter-agent-dev-plan-v1.0.md` | 开发任务分解与排期 |
| **测试用例** | `prd/hunter-agent-test-cases-v1.0.md` | 109 个测试用例详情 |
| **原型设计** | `prd/hunter-agent-prototype-v1.0.md` | 页面原型设计文档 |

---

## 🚀 快速开始

### 查看原型

1. 打开任意 HTML 文件
2. 点击导航切换页面
3. 尝试交互功能（新建 Agent、保存工作流等）

### 评审流程

1. **产品评审** - 确认页面布局和功能
2. **技术评审** - 评估实现可行性
3. **UI/UX 评审** - 优化交互体验
4. **开发启动** - 基于原型开始开发

---

## 📞 联系方式

- **作者：** 小宁（RAKkDm）
- **日期：** 2026-04-16
- **版本：** v1.0
- **状态：** 待评审

---

## ⚠️ 注意事项

1. **数据为模拟数据** - 原型中的数据均为示例，非真实数据
2. **部分功能为演示** - 弹窗、按钮等有演示效果，无后端支持
3. **建议使用 Chrome** - 推荐使用 Chrome 或 Edge 浏览器查看
4. **需要网络连接** - Tailwind CSS、Font Awesome、Chart.js 使用 CDN

---

**部署时间：** 2026-04-16  
**GitHub 仓库：** https://github.com/Leojunhan/ofw-docs  
**分支：** `prototypes`
