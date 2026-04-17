# Hunter Agent 管理系统 · 原型部署指南

**版本：** v2.0  
**日期：** 2026-04-16  
**GitHub Pages:** https://leojunhan.github.io/ofw-docs/

---

## 📦 文件清单

### 核心页面 (v2.0)

| 文件 | 说明 | 状态 |
|------|------|------|
| `prototypes/dashboard-v2.html` | 主仪表盘 | ✅ 完成 |
| `prototypes/agents-v2.html` | Agent 管理（MetaAgent 创建） | ✅ 完成 |
| `prototypes/memory.html` | 记忆中心 | ✅ 完成 |

### 待优化页面 (v1.0)

| 文件 | 说明 | 状态 |
|------|------|------|
| `prototypes/skills.html` | Skill 管理 | ⏳ 待优化 |
| `prototypes/executions.html` | 执行记录 | ⏳ 待优化 |
| `prototypes/settings.html` | 系统设置 | ⏳ 待优化 |
| `prototypes/execution-detail.html` | 执行详情 | ⏳ 待优化 |
| `prototypes/workflow-editor.html` | 流程编辑器 | ⏳ 待优化 |

### 文档

| 文件 | 说明 | 状态 |
|------|------|------|
| `prototypes/UI_OPTIMIZATION_v2.md` | UI v2.0 优化报告 | ✅ 完成 |
| `prototypes/DEPLOYMENT.md` | 本文档 | ✅ 完成 |

---

## 🚀 部署步骤

### 方法一：GitHub Actions 自动部署（推荐）

**前提条件：**
- 已配置 `.github/workflows/deploy-pages.yml`
- 已启用 GitHub Pages（main branch）

**步骤：**

```bash
# 1. 提交更改
git add prototypes/
git commit -m "feat: UI v2.0 - MetaAgent 创建 + 完整交互"
git push origin main

# 2. GitHub Actions 自动部署
# 等待 1-2 分钟，访问：
# https://leojunhan.github.io/ofw-docs/prototypes/dashboard-v2.html
```

### 方法二：手动部署

```bash
# 1. 确保在 main 分支
git checkout main

# 2. 提交文件
git add prototypes/
git commit -m "feat: UI v2.0"
git push origin main

# 3. 访问 GitHub Pages
# Settings → Pages → Source: Deploy from a branch (main / root)
```

---

## 🎯 访问链接

### 主要页面

| 页面 | 链接 |
|------|------|
| **Dashboard** | https://leojunhan.github.io/ofw-docs/prototypes/dashboard-v2.html |
| **Agent 管理** | https://leojunhan.github.io/ofw-docs/prototypes/agents-v2.html |
| **记忆中心** | https://leojunhan.github.io/ofw-docs/prototypes/memory.html |

### 其他页面（v1.0）

| 页面 | 链接 |
|------|------|
| Skill 管理 | https://leojunhan.github.io/ofw-docs/prototypes/skills.html |
| 执行记录 | https://leojunhan.github.io/ofw-docs/prototypes/executions.html |
| 系统设置 | https://leojunhan.github.io/ofw-docs/prototypes/settings.html |

---

## ✨ v2.0 核心特性

### 1. UI 产品美感

**设计语言：**
- 品牌色：紫色渐变 (#667eea → #764ba2)
- 留白：32px 大间距
- 阴影：4 级阴影系统
- 圆角：4 级圆角系统 (8/12/16/20px)
- 动效：贝塞尔曲线 + 微交互

**参考对象：** Linear、Raycast、Arc

### 2. 完整交互

**所有按钮可点击：**
- ✅ 导航菜单切换
- ✅ 统计卡片跳转
- ✅ 表格行跳转详情
- ✅ 搜索实时过滤
- ✅ 模态框打开/关闭
- ✅ Toast 通知反馈

**所有页面可导航：**
- Dashboard ↔ Agent 管理 ↔ 记忆中心
- 侧边栏完整导航
- 面包屑导航

### 3. MetaAgent 创建

**自然语言创建 Agent：**

用户输入：
> "帮我创建一个 FB 社群监控 Agent，自动发现借贷需求用户，每天 9 点工作，记住已联系的用户"

MetaAgent 自动配置：
- ⚡ Skills: FB 社群监控、意图分类、自动触达
- 🧠 记忆：用户联系记录、对话历史
- ⏰ 调度：每天 9:00-18:00
- 💓 心跳：30 秒

**交互流程：**
1. 点击"新建 Agent"
2. 输入自然语言描述
3. MetaAgent 解析（2 秒动画）
4. 显示解析结果
5. 确认创建

---

## 🎨 设计规范

### 颜色系统

```css
/* 品牌色 */
--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
--accent-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);

/* 背景色 */
--bg-primary: #fafbfc;
--bg-secondary: #ffffff;
--bg-tertiary: #f6f8fa;

/* 文字色 */
--text-primary: #1a1a2e;
--text-secondary: #6b7280;
--text-tertiary: #9ca3af;

/* 状态色 */
--success: #10b981;
--warning: #f59e0b;
--danger: #ef4444;
--info: #3b82f6;
```

### 阴影系统

```css
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.04);
--shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);
--shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.12);
--shadow-xl: 0 16px 48px rgba(0, 0, 0, 0.15);
```

### 圆角系统

```css
--radius-sm: 8px;   /* 按钮、小元素 */
--radius-md: 12px;  /* 卡片、输入框 */
--radius-lg: 16px;  /* 大卡片 */
--radius-xl: 20px;  /* 模态框 */
```

---

## 📋 评审清单

### 产品评审

- [ ] MetaAgent 创建流程是否清晰？
- [ ] 记忆中心是否有必要？
- [ ] 导航结构是否合理？
- [ ] 信息密度是否合适？

### 设计评审

- [ ] 品牌色是否合适？
- [ ] 留白是否足够？
- [ ] 动效是否流畅？
- [ ] 响应式是否完善？

### 技术评审

- [ ] 所有链接是否可点击？
- [ ] 所有按钮是否有反馈？
- [ ] 模态框是否正常？
- [ ] 搜索是否工作？

---

## 🐛 已知问题

| 问题 | 影响 | 解决方案 | 状态 |
|------|------|---------|------|
| 部分页面仍为 v1.0 | 视觉不一致 | 逐步优化为 v2.0 | ⏳ 进行中 |
| 移动端未优化 | 小屏体验差 | 添加响应式断点 | ⏳ 待开发 |
| 部分功能仅前端模拟 | 数据不持久 | 后端开发 | ⏳ 待开发 |

---

## 📅 下一步计划

### 短期（1 周）

- [ ] 优化 `skills.html` 为 v2.0
- [ ] 优化 `executions.html` 为 v2.0
- [ ] 优化 `settings.html` 为 v2.0
- [ ] 添加移动端响应式

### 中期（2 周）

- [ ] 实现 MetaAgent 后端逻辑
- [ ] 集成 LLM 意图识别
- [ ] Skill 自动匹配算法
- [ ] 记忆模块配置器

### 长期（1 月）

- [ ] 批量操作支持
- [ ] Agent 详情页完整实现
- [ ] 执行记录筛选和导出
- [ ] 系统设置完整功能

---

## 📞 反馈渠道

**评审会议：**
- 时间：待定
- 参与：CTO + 开发 + 测试 + 产品
- 议程：
  1. 演示 v2.0 原型
  2. 收集反馈
  3. 确定优先级
  4. 排期开发

**反馈收集：**
- GitHub Issues: https://github.com/Leojunhan/ofw-docs/issues
- 邮件：diwei@example.com
- 文档评论：直接编辑 `UI_OPTIMIZATION_v2.md`

---

**文档版本：** v1.0  
**最后更新：** 2026-04-16  
**维护者：** 小宁 (RAKkDm)
