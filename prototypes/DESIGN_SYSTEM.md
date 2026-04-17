# Hunter 设计系统规范 v1.0

> 本文档统一定义 Hunter Agent 管理系统的视觉元素、控件规范和交互规范。

---

## 一、视觉元素规范

### 1.1 色彩系统

#### 主色系
| 用途 | 变量名 | 色值 | 说明 |
|------|--------|------|------|
| **主色** | `--primary` | `#6B46C1` | Deep Purple，用于主按钮、链接、强调 |
| **主色 Hover** | `--primary-hover` | `#553C9A` | 主色加深 15% |
| **主色背景** | `--primary-light` | `rgba(107,70,193,0.12)` | 12% 透明度，用于背景高亮 |

#### 状态色系（降低饱和度，更高级）
| 状态 | 变量名 | 色值 | 背景色 | 用途 |
|------|--------|------|--------|------|
| **成功** | `--success` | `#2F855A` | `#F0FFF4` | 成功状态、正向数据 |
| **危险** | `--danger` | `#C53030` | `#FFF5F5` | 失败、错误、删除操作 |
| **警告** | `--warning` | `#B7791F` | `#FFFFF0` | 警告、需注意 |
| **运行** | `--running` | `#3182CE` | `#EBF8FF` | 进行中、加载状态 |
| **暂停** | `--paused` | `#718096` | `#F7FAFC` | 已暂停、离线 |

#### 文本色系
| 层级 | 变量名 | 色值 | 用途 |
|------|--------|------|------|
| **主要** | `--text-primary` | `#1A1A2E` | 标题、重要内容 |
| **次要** | `--text-secondary` | `#4A5568` | 正文、描述 |
| **三级** | `--text-tertiary` | `#718096` | 辅助信息、时间戳 |
| **禁用** | `--text-disabled` | `#A0AEC0` | 禁用状态文字 |

#### 边框与背景
| 用途 | 变量名 | 色值 |
|------|--------|------|
| **边框** | `--border` | `#E2E8F0` |
| **边框 Hover** | `--border-hover` | `#CBD5E0` |
| **卡片背景** | `--bg-card` | `#FFFFFF` |
| **页面背景** | `--bg-page` | `#F7FAFC` |

---

### 1.2 字体规范

#### 字体族
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
```

#### 字号阶梯
| 层级 | 字号 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| **H1 页面标题** | 24px | 700 | 1.2 | 页面主标题 |
| **H2 区块标题** | 18px | 600 | 1.3 | Drawer 标题、卡片标题 |
| **H3 小标题** | 16px | 600 | 1.4 | 表格标题、Drawer Section |
| **正文** | 14px | 400 | 1.5 | 主要内容 |
| **辅助文字** | 13px | 400 | 1.5 | 描述、时间戳 |
| **小字** | 12px | 400 | 1.4 | Badge、标签、面包屑 |

#### 特殊字号
| 用途 | 字号 | 字重 | 示例 |
|------|------|------|------|
| **统计数字** | 48px | 700 | Dashboard 大数字 |
| **统计数字（小）** | 36px | 700 | 次级统计 |
| **ID/Monospace** | 13px | 400 | `font-family: 'SF Mono', monospace` |

---

### 1.3 间距规范

#### 基础间距（4px 基准）
| 变量 | 值 | 用途 |
|------|-----|------|
| `--gap-xs` | 4px | 紧凑间距 |
| `--gap-sm` | 8px | 标签间距、按钮内间距 |
| `--gap-md` | 12px | 元素间距 |
| `--gap-lg` | 16px | 区块间距 |
| `--gap-xl` | 24px | 卡片间距 |
| `--gap-2xl` | 32px | 页面边距 |

#### 常用间距
| 场景 | 间距 |
|------|------|
| 卡片 Grid Gap | 24px |
| 卡片内边距 | 20px |
| 表格行高 | 48px |
| 按钮内边距 | 10px 16px (sm: 6px 12px) |
| Drawer 内边距 | 24px |
| Sidebar 内边距 | 16px |

---

### 1.4 圆角规范

| 元素 | 圆角 | 说明 |
|------|------|------|
| **卡片** | 8px | 所有卡片容器 |
| **按钮** | 6px | 所有按钮 |
| **输入框** | 6px | 表单输入 |
| **Badge** | 4px | 状态标签 |
| **Avatar** | 50% | 圆形头像 |
| **Drawer** | 0 | 右侧滑入，无圆角 |
| **Toast** | 6px | 通知气泡 |
| **Modal** | 12px | 弹窗（如有） |

---

### 1.5 阴影规范

| 层级 | 阴影值 | 用途 |
|------|--------|------|
| **卡片** | `0 1px 3px rgba(0,0,0,0.1)` | 默认卡片 |
| **卡片 Hover** | `0 4px 12px rgba(0,0,0,0.15)` | 悬浮态 |
| **Drawer** | `-4px 0 24px rgba(0,0,0,0.2)` | 右侧阴影 |
| **Toast** | `0 4px 16px rgba(0,0,0,0.2)` | 通知浮层 |
| **Modal** | `0 8px 32px rgba(0,0,0,0.3)` | 弹窗（如有） |

---

## 二、控件规范

### 2.1 按钮规范

#### 按钮类型
| 类型 | 样式 | 用途 |
|------|------|------|
| **Primary** | 主色背景 `#6B46C1`，白字 | 主要操作（创建、保存、确认） |
| **Secondary** | 白底灰边框，灰字 | 次要操作（关闭、取消） |
| **Danger** | 红色背景 `#C53030`，白字 | 危险操作（删除、停止、取消任务） |
| **Success** | 绿色背景 `#2F855A`，白字 | 正向操作（重启、重试） |
| **Ghost** | 透明背景，主色字 | 轻量操作（链接样式） |

#### 按钮尺寸
| 尺寸 | 内边距 | 字号 | 用途 |
|------|--------|------|------|
| **Large** | 12px 24px | 16px | Drawer Footer 主要操作 |
| **Default** | 10px 16px | 14px | 默认按钮 |
| **Small** | 6px 12px | 13px | 表格操作、卡片内按钮 |

#### 按钮状态
| 状态 | 样式 |
|------|------|
| **Hover** | 背景加深 10%，阴影增强 |
| **Active** | 背景加深 15% |
| **Disabled** | 背景 `#E2E8F0`，文字 `#A0AEC0`，cursor: not-allowed |
| **Loading** | 显示旋转图标，文字变灰，cursor: wait |

#### 按钮图标规范
| 操作 | 图标 | 按钮类型 |
|------|------|---------|
| 详情 | 📋 | Secondary |
| 配置 | ⚙️ | Secondary |
| 日志 | 📝 | Secondary |
| 编辑 | ✏️ | Secondary |
| 删除 | 🗑️ | Danger |
| 重试 | 🔄 | Success |
| 重启 | 🔄 | Success |
| 暂停 | ⏸️ | Danger |
| 停止 | ⏹️ | Danger |
| 取消 | ✕ | Danger |
| 关闭 | ✕ | Secondary |
| 复制 | 📋 | Secondary |
| 下载 | 📥 | Secondary |
| 刷新 | 🔄 | Secondary |

---

### 2.2 输入控件规范

#### 文本输入框
| 属性 | 值 |
|------|-----|
| 高度 | 40px (default) / 36px (small) |
| 内边距 | 10px 12px |
| 边框 | 1px solid `#E2E8F0` |
| 圆角 | 6px |
| 字号 | 14px |
| Focus 边框 | 2px solid `#6B46C1` |
| Placeholder 色 | `#A0AEC0` |
| 禁用背景 | `#F7FAFC` |

#### 选择器 (Select)
| 属性 | 值 |
|------|-----|
| 高度 | 40px (同输入框) |
| 右侧图标 | 下拉箭头 ▼ |
| Focus | 同输入框 |

#### 多行文本 (Textarea)
| 属性 | 值 |
|------|-----|
| 最小高度 | 80px |
| 可调整大小 | vertical |

#### 开关 (Toggle Switch)
| 属性 | 值 |
|------|-----|
| 开启色 | `#2F855A` |
| 关闭色 | `#E2E8F0` |
| 尺寸 | 44px × 24px |
| 滑块 | 20px 圆形 |

---

### 2.3 状态标签 (Badge)

#### 尺寸
| 属性 | 值 |
|------|-----|
| 内边距 | 4px 8px |
| 圆角 | 4px |
| 字号 | 12px |
| 字重 | 500 |

#### 颜色规范
| 状态 | 文字色 | 背景色 |
|------|--------|--------|
| Online | `#2F855A` | `#F0FFF4` |
| Running | `#3182CE` | `#EBF8FF` |
| Offline | `#718096` | `#F7FAFC` |
| Failed | `#C53030` | `#FFF5F5` |
| Active | `#2F855A` | `#F0FFF4` |
| Inactive | `#718096` | `#F7FAFC` |

#### 带图标的状态标签
| 状态 | 图标 | 样式 |
|------|------|------|
| Online | ✓ | 绿色背景 |
| Running | ● (带动画点) | 蓝色背景 |
| Offline | ○ | 灰色背景 |
| Failed | ✕ | 红色背景 |

---

### 2.4 表格规范

#### 表格结构
| 元素 | 样式 |
|------|------|
| 表头背景 | `#F7FAFC` |
| 表头字重 | 600 |
| 行高 | 48px |
| 行边框 | 1px solid `#E2E8F0` |
| 行 Hover | 背景 `#F7FAFC` |

#### 高亮行规范
| 状态 | 样式 |
|------|------|
| 失败/离线行 | 背景 `#FFF5F5`，左侧 4px 红色边框 |
| 运行行 | 背景 `#EBF8FF`，左侧 4px 蓝色边框 |
| 成功行 | 默认样式 |

#### 表格操作列
| 属性 | 值 |
|------|-----|
| 宽度 | 160px (最多 2 按钮) / 240px (3+ 按钮) |
| 按钮 | Small 尺寸，6px 间距 |

---

### 2.5 卡片规范

#### 基础卡片
| 属性 | 值 |
|------|-----|
| 背景 | 白色 `#FFFFFF` |
| 圆角 | 8px |
| 内边距 | 20px |
| 阴影 | `0 1px 3px rgba(0,0,0,0.1)` |
| Hover 阴影 | `0 4px 12px rgba(0,0,0,0.15)` |

#### 统计卡片 (Dashboard)
| 属性 | 值 |
|------|-----|
| Grid | 4 列，gap 24px |
| 数字字号 | 48px / 700 |
| 标签字号 | 14px / 400 |
| 趋势字号 | 12px |

#### Agent/Skill 卡片
| 属性 | 值 |
|------|-----|
| Grid | 3 列 (桌面) / 2 列 (平板) / 1 列 (手机) |
| 图标尺寸 | 48px |
| 状态 Badge | 右上角或标题旁 |
| 操作按钮区 | 底部，flex 布局 |

---

## 三、交互规范

### 3.1 Drawer（侧滑面板）

#### 基础属性
| 属性 | 值 |
|------|-----|
| 宽度 | 480px (桌面) / 450px (平板) / 100% (手机) |
| 背景 | 白色 |
| 阴影 | `-4px 0 24px rgba(0,0,0,0.2)` |
| 动画 | `transform: translateX(100%) → 0`, 300ms ease-out |

#### 结构
```
┌─────────────────────────────────────┐
│ Header: 标题 + 关闭按钮 (✕)          │
├─────────────────────────────────────┤
│ Body: 内容区域 (可滚动)              │
│   - Section: 分组内容               │
│   - Meta Grid: 信息网格              │
│   - Log Viewer: 日志查看器          │
├─────────────────────────────────────┤
│ Footer: 操作按钮区                   │
│   - 关闭 (Secondary)                │
│   - 其他操作 (Primary/Danger)       │
└─────────────────────────────────────┘
```

#### 遮罩层 (Overlay)
| 属性 | 值 |
|------|-----|
| 背景 | `rgba(0,0,0,0.5)` |
| 点击 | 关闭 Drawer |
| 动画 | opacity 0 → 1, 300ms |

#### 关闭方式
1. 点击遮罩层
2. 点击右上角 ✕ 按钮
3. 点击 Footer「关闭」按钮
4. 按 ESC 键

---

### 3.2 Toast（通知气泡）

#### 基础属性
| 属性 | 值 |
|------|-----|
| 位置 | 右下角，距边 24px |
| 宽度 | 320px |
| 圆角 | 6px |
| 阴影 | `0 4px 16px rgba(0,0,0,0.2)` |
| 动画 | slide-in-right, 300ms |
| 持续时间 | 3秒自动消失 |

#### 类型样式
| 类型 | 背景色 | 图标 |
|------|--------|------|
| Success | `#F0FFF4` | ✓ |
| Error | `#FFF5F5` | ✕ |
| Warning | `#FFFFF0` | ⚠ |
| Info | `#EBF8FF` | ℹ |

#### 结构
```
┌─────────────────────────────────────┐
│ [图标] 消息文字                 [✕] │
└─────────────────────────────────────┐
```

---

### 3.3 Loading（加载状态）

#### 按钮加载
| 属性 | 值 |
|------|-----|
| 图标 | 旋转圆圈 ◷ |
| 文字 | 变灰，可选显示"处理中..." |
| 禁用 | cursor: wait, pointer-events: none |

#### 页面加载
| 属性 | 值 |
|------|-----|
| 图标 | Spinner 或骨架屏 |
| 背景 | 半透明遮罩 |

---

### 3.4 空状态 (Empty State)

#### 规范
| 属性 | 值 |
|------|-----|
| 图标 | 大尺寸空状态插图 (64px+) |
| 文字 | 灰色，16px，"暂无数据" |
| 操作 | 可选：刷新按钮或创建按钮 |

---

### 3.5 确认弹窗 (Confirm Dialog)

#### 规范
| 属性 | 值 |
|------|-----|
| 类型 | 浏览器原生 `confirm()` 或自定义 Modal |
| 文字 | 简洁明确的确认文字 |
| 按钮 | "确认" + "取消" |

#### 危险操作确认文字示例
| 操作 | 确认文字 |
|------|---------|
| 删除 Agent | "确认删除 Agent {ID}？此操作不可恢复。" |
| 删除执行记录 | "确认删除执行记录 {ID}？此操作不可恢复。" |
| 取消任务 | "确认取消正在执行的任务？" |

---

### 3.6 Hover 状态

| 元素 | Hover 效果 |
|------|-----------|
| 按钮 | 背景加深 10%，阴影增强 |
| 卡片 | 阴影增强，轻微上浮感 |
| 表格行 | 背景 `#F7FAFC` |
| 链接 | 颜色变为主色，下划线可选 |
| 状态 Badge | 无 Hover（仅展示） |

---

### 3.7 Focus 状态

| 元素 | Focus 效果 |
|------|-----------|
| 输入框 | 边框 2px 主色，轻微内阴影 |
| 按钮 | 边框 2px 主色（仅 Primary） |
| 链接 | 无特殊 Focus（已有 Hover） |

---

## 四、页面布局规范

### 4.1 侧边栏 (Sidebar)

| 属性 | 值 |
|------|-----|
| 宽度 | 240px (桌面) / 200px (平板) / 隐藏 (手机) |
| 背景 | 白色，右侧边框 |
| Logo 区 | 高度 64px |
| 导航项 | 高度 48px，左图标 + 右文字 |
| 活跃项 | 主色背景 `rgba(107,70,193,0.12)` |

#### 导航图标
| 页面 | 图标 |
|------|------|
| Dashboard | 📊 |
| Agent 管理 | 🤖 |
| Skill 管理 | ⚡ |
| 执行记录 | 📝 |
| 系统设置 | ⚙️ |

---

### 4.2 主内容区

| 属性 | 值 |
|------|-----|
| 左边距 | = Sidebar 宽度 |
| 背景 | `#F7FAFC` |
| 内边距 | 32px |

---

### 4.3 页面头部

| 元素 | 样式 |
|------|------|
| 标题 | 24px / 700 |
| 面包屑 | 12px，标题下方 |
| 用户信息区 | 右上角，Avatar + 名字 |

---

## 五、需要补充的规范

### 5.1 🔴 当前缺失 - 必须补充

| 缺失项 | 影响 | 建议 |
|------|------|------|
| **Modal 弹窗** | 删除确认、表单弹窗需要 | 设计 Modal 组件，12px 圆角 |
| **空状态插图** | 数据为空时体验差 | 设计统一空状态插图 + 文案 |
| **分页组件** | 数据量大时无法浏览 | 设计分页：上一页/下一页/页码 |
| **日期选择器** | 筛选时间范围无法选择 | 添加日期范围选择器 |
| **Tooltip** | 长文字截断无法查看 | 添加 Hover Tooltip |
| **复制成功反馈** | 复制 ID 后无反馈 | 已添加 Toast，需验证 |

### 5.2 🟡 建议补充 - 提升体验

| 建议项 | 影响 | 建议 |
|------|------|------|
| **骨架屏** | 加载时空白体验差 | 替代 Spinner |
| **下拉菜单** | 更多操作按钮空间不足 | 设计 Dropdown Menu |
| **进度条** | 长任务无进度感知 | 添加 Progress Bar |
| **通知中心** | Toast 被忽略后无法找回 | 添加通知历史入口 |
| **快捷键提示** | ESC 关闭 Drawer 无提示 | Footer 提示"按 ESC 关闭" |
| **暗色模式** | 长时间使用眼睛疲劳 | 可选设计（Phase 2） |

### 5.3 🟢 可选补充 - 高级功能

| 可选项 | 影响 | 建议 |
|------|------|------|
| **动画库** | 微交互更流畅 | 引入 CSS 动画库 |
| **右键菜单** | 快捷操作 | Context Menu |
| **拖拽排序** | Agent/Skill 顺序调整 | Drag & Drop |
| **图表组件** | Dashboard 数据可视化 | 添加图表库 |

---

## 六、一致性检查清单

### 6.1 已统一 ✅

- [x] 颜色系统（5 页面共用同一变量定义）
- [x] 字体系统（字号阶梯统一）
- [x] 按钮样式（Primary/Secondary/Danger/Success）
- [x] Drawer 结构（Header + Body + Footer）
- [x] Toast 通知（右下角，3 秒消失）
- [x] 状态 Badge（Online/Running/Offline/Failed）
- [x] 表格高亮（失败行红色背景 + 左边框）
- [x] 卡片样式（8px 圆角，Hover 阴影）

### 6.2 待统一 ⚠️

- [ ] Agent 卡片按钮数量（已统一为 4 个）
- [ ] Drawer Footer 按钮顺序（关闭在最左）
- [ ] 空状态展示（无统一设计）
- [ ] 分页组件（未实现）
- [ ] Modal 弹窗（未设计）

---

## 七、组件代码片段

### 7.1 CSS 变量定义（复制到每个页面）

```css
:root {
    /* 主色 */
    --primary: #6B46C1;
    --primary-hover: #553C9A;
    --primary-light: rgba(107,70,193,0.12);
    
    /* 状态色 */
    --success: #2F855A;
    --success-bg: #F0FFF4;
    --danger: #C53030;
    --danger-bg: #FFF5F5;
    --warning: #B7791F;
    --warning-bg: #FFFFF0;
    --running: #3182CE;
    --running-bg: #EBF8FF;
    
    /* 文字色 */
    --text-primary: #1A1A2E;
    --text-secondary: #4A5568;
    --text-tertiary: #718096;
    --text-disabled: #A0AEC0;
    
    /* 边框与背景 */
    --border: #E2E8F0;
    --border-hover: #CBD5E0;
    --bg-card: #FFFFFF;
    --bg-page: #F7FAFC;
    
    /* 间距 */
    --gap-sm: 8px;
    --gap-md: 12px;
    --gap-lg: 16px;
    --gap-xl: 24px;
    
    /* 圆角 */
    --radius-card: 8px;
    --radius-btn: 6px;
    --radius-input: 6px;
    --radius-badge: 4px;
}
```

### 7.2 按钮 HTML 模板

```html
<!-- Primary -->
<button class="btn btn-primary">主要操作</button>

<!-- Secondary -->
<button class="btn btn-secondary">次要操作</button>

<!-- Danger -->
<button class="btn btn-danger">🗑️ 删除</button>

<!-- Success -->
<button class="btn btn-success">🔄 重试</button>

<!-- Small -->
<button class="btn btn-secondary btn-sm">📋 详情</button>

<!-- Loading -->
<button class="btn btn-primary loading">处理中...</button>

<!-- Disabled -->
<button class="btn btn-secondary" disabled>禁用状态</button>
```

### 7.3 Drawer HTML 模板

```html
<!-- Overlay -->
<div class="drawer-overlay" id="drawerOverlay" onclick="closeDrawer()"></div>

<!-- Drawer -->
<div class="drawer" id="drawer">
    <div class="drawer-header">
        <span class="drawer-title">标题</span>
        <button class="drawer-close" onclick="closeDrawer()">✕</button>
    </div>
    <div class="drawer-body">
        <div class="drawer-section">
            <div class="drawer-section-title">区块标题</div>
            <!-- 内容 -->
        </div>
    </div>
    <div class="drawer-footer">
        <button class="btn btn-secondary" onclick="closeDrawer()">关闭</button>
        <button class="btn btn-primary">保存</button>
    </div>
</div>
```

### 7.4 Toast HTML 模板

```html
<div class="toast-container" id="toastContainer"></div>

<script>
function showToast(message, type = 'success') {
    const container = document.getElementById('toastContainer');
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    
    const icon = type === 'success' ? '✓' : type === 'error' ? '✕' : '⚠';
    toast.innerHTML = `
        <span class="toast-icon">${icon}</span>
        <span class="toast-message">${message}</span>
        <span class="toast-close" onclick="this.parentElement.remove()">✕</span>
    `;
    
    container.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}
</script>
```

---

**文档版本：v1.0**
**创建时间：2026-04-17**
**适用范围：Hunter Agent 管理系统全部原型页面**