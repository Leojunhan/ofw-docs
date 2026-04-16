# 📚 OFW 文档中心访问指南

## 🌐 访问方式

### 方式 1：本地 HTTP 服务（推荐）

```
http://localhost:9001/index.html
```

**说明**：已启动 Python HTTP 服务在 9001 端口，专门服务 docs 目录。

### 方式 2：直接打开本地文件

```bash
# Linux/Mac
xdg-open /app/working/workspaces/RAKkDm/docs/index.html

# Windows (需要转换路径)
start file:///app/working/workspaces/RAKkDm/docs/index.html
```

### 方式 3：浏览器直接拖入

把 `index.html` 文件直接拖到浏览器窗口即可打开。

---

## 目录结构

```
docs/
├── index.html              # 🏠 统一预览门户（导航首页）
├── strategy/               # 📊 战略文档（MRD/BRD/顶层设计）
├── prd/                    # 📝 产品需求文档
├── architecture/           # 🏗️ 架构文档
├── review/                 # 🔍 评审文档
├── project/                # 📋 项目文档
└── archive/                # 📦 归档旧版本
```

---

## 文档分类说明

| 分类 | 存放内容 | 示例 |
|------|---------|------|
| strategy | MRD、BRD、顶层设计、战略规划 | ofw_strategy_top_level_design.md |
| prd | 产品需求文档 | OFW_FB_Traffic_Agent_PRD_v1.md |
| architecture | 技术架构、系统架构 | - |
| review | 评审意见、审核报告 | hunter-agent-prd-review.md |
| project | 项目计划、任务分解、会议纪要 | OFW_FB_Agent_Task_Breakdown.md |
| archive | 旧版本、备份文件 | OFW_MRD_v1_backup.md |

---

## 功能特性

- ✅ **统一入口**：一个页面访问所有文档
- ✅ **分类展示**：按战略/PRD/架构/评审分类
- ✅ **搜索过滤**：快速找到目标文档
- ✅ **响应式设计**：手机/电脑都能用
- ✅ **统计信息**：实时显示文档数量

---

## 维护说明

### 添加新文档

1. 将文档放入对应分类目录（如 `docs/strategy/`）
2. 编辑 `docs/index.html`，在 `documents` 数组中添加新条目：

```javascript
{
    title: "文档标题",
    path: "strategy/你的文档.md",
    type: "strategy",  // strategy/prd/arch/review/other
    typeName: "战略",
    desc: "简短描述",
    date: "2026-04-16"
}
```

### 自动化工具（待开发）

可以写一个脚本自动：
- 扫描所有 `.md` 和 `.html` 文件
- 自动分类
- 自动生成索引

---

## 常见问题

**Q: 链接打不开？**  
A: 确保通过 copaw 环境访问，端口 8088 正在运行。

**Q: 如何外网访问？**  
A: 需要配置 cloudflared 固定域名隧道（方案 C）。

**Q: 文档太多找不到？**  
A: 使用页面顶部的搜索框，支持标题/描述/分类搜索。

---

## 🔧 服务管理

### 启动服务

```bash
# 方式 1：使用启动脚本
./start_server.sh

# 方式 2：手动启动
python3 -m http.server 9001 --directory /app/working/workspaces/RAKkDm/docs
```

### 停止服务

```bash
# 查找进程
lsof -i :9001

# 停止服务
kill <PID>
```

### 检查服务状态

```bash
curl -I http://localhost:9001/index.html
```

---

**最后更新**: 2026-04-16  
**维护者**: 小宁 (RAKkDm)
