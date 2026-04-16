# 🗑️ 文档删除功能使用指南

> **最后更新：** 2026-04-16  
> **适用对象：** 文档管理员

---

## 📋 功能概述

文档管理系统提供两种删除方式：

| 方式 | 适用场景 | 命令 |
|------|---------|------|
| **单个删除** | 快速删除单个文档 | `./docs/delete_doc.sh <文档路径>` |
| **批量删除** | 定期维护，批量清理 | `./docs/batch_delete.sh` |

---

## ️ 方式一：单个删除

### 使用场景
- 发现某个文档需要立即删除
- 临时草稿完成后清理
- 文档重构后删除旧版本

### 使用方法

```bash
# 进入工作区
cd /app/working/workspaces/RAKkDm

# 运行删除脚本
./docs/delete_doc.sh <文档路径>
```

### 示例

```bash
# 删除单个文档
./docs/delete_doc.sh docs/architecture/hunter-architecture-v1.2.md

# 删除 PRD 文档
./docs/delete_doc.sh docs/prd/old-prd-v1.0.md
```

### 操作流程

1. **运行命令** → 脚本会显示文件信息
2. **确认删除** → 输入 `y` 确认
3. **自动处理** → 脚本自动完成：
   - ✅ 删除文档文件
   - ✅ 从 index.html 移除索引
   - ✅ 删除关联 HTML（如有）
   - ✅ 提交并推送到 GitHub
4. **等待部署** → GitHub Pages 自动更新（1-2 分钟）

### 安全特性

- ✅ **删除前确认** - 必须输入 `y` 才会执行
- ✅ **自动备份** - 删除前备份 index.html
- ✅ **索引同步** - 自动更新文档中心导航
- ✅ **Git 追踪** - 所有删除操作有 Git 记录

---

## 🗂️ 方式二：批量删除

### 使用场景
- 定期文档维护（如每月一次）
- 项目阶段完成后清理临时文档
- 重构后批量删除旧文档

### 使用方法

#### 步骤 1：编辑删除清单

```bash
# 打开删除清单
vim docs/DELETE_LIST.md
# 或使用其他编辑器
code docs/DELETE_LIST.md
```

#### 步骤 2：添加待删除文档

在 `DELETE_LIST.md` 的"待删除列表"部分添加文档路径：

```markdown
## 📋 待删除列表

在下方添加需要删除的文档路径（每行一个）：

```
docs/architecture/old-arch-v1.0.md
docs/prd/draft-prd-1.md
docs/prd/draft-prd-2.md
docs/review/temp-review.md
```
```

#### 步骤 3：运行批量删除

```bash
cd /app/working/workspaces/RAKkDm
./docs/batch_delete.sh
```

#### 步骤 4：确认执行

脚本会显示待删除列表，输入 `y` 确认执行。

### 操作流程

```
编辑 DELETE_LIST.md
    ↓
添加待删除文档路径
    ↓
运行 ./docs/batch_delete.sh
    ↓
确认删除列表
    ↓
自动批量删除
    ↓
更新 DELETE_LIST.md（清空待删除列表）
    ↓
提交并推送 GitHub
```

---

## 📝 删除规范

### ✅ 建议删除的情况

| 情况 | 示例 | 建议 |
|------|------|------|
| 文档内容过时 | 旧版本 PRD、过期的计划 | 删除 |
| 临时草稿 | 讨论中的草稿、测试文档 | 删除 |
| 文档重复 | 同一文档多个版本 | 删除冗余版本 |
| 定位错误 | 文档内容与分类不符 | 删除或移动 |

### ⚠️ 建议归档的情况

| 情况 | 示例 | 建议 |
|------|------|------|
| 重要历史文档 | Phase 1 总结、重要决策记录 | 移到 `docs/archive/` |
| 参考文档 | 旧架构设计、历史 PRD | 移到 `docs/archive/` |
| 学习价值文档 | 踩坑记录、经验总结 | 移到 `docs/archive/` |

### 归档方法

```bash
# 创建归档目录（如不存在）
mkdir -p docs/archive

# 移动文档
mv docs/old-doc.md docs/archive/old-doc.md

# 手动更新 index.html 中的路径
# 提交更改
git add docs/
git commit -m "docs: 归档旧文档 old-doc.md"
git push
```

---

## 🔍 删除前检查清单

在执行删除前，请确认：

- [ ] **确认文档没有业务价值** - 是否还有参考价值？
- [ ] **确认没有其他文档引用** - 是否有链接指向此文档？
- [ ] **确认不是重要历史记录** - 如果是，移到 archive/
- [ ] **已在 DELETE_LIST.md 记录**（批量删除时）- 删除原因是什么？

---

## 📊 删除记录查询

所有删除操作都会在 Git 中有记录：

```bash
# 查看删除历史
git log --oneline --grep="docs: 删除"

# 查看批量删除历史
git log --oneline --grep="docs: 批量删除"

# 查看某个文件的删除记录
git log --diff-filter=D --summary
```

---

## 🆘 常见问题

### Q1: 误删了文档怎么办？

**方法一：从 Git 恢复**

```bash
# 找到删除的提交
git log --diff-filter=D --summary

# 恢复文件
git checkout <commit-hash>^ -- docs/path/to/file.md

# 推送到 GitHub
git push
```

**方法二：从 index.html.backup 恢复索引**

```bash
# 如果刚删除，index.html.backup 还在
cp docs/index.html.backup docs/index.html
git add docs/index.html
git commit -m "restore: 恢复 index.html"
git push
```

### Q2: 删除后文档中心还显示？

**原因：** GitHub Pages 缓存

**解决：**
1. 等待 1-2 分钟，让 GitHub Pages 自动更新
2. 强制刷新浏览器（Ctrl+F5 或 Cmd+Shift+R）
3. 清除浏览器缓存

### Q3: 脚本没有执行权限？

```bash
# 添加执行权限
chmod +x docs/delete_doc.sh
chmod +x docs/batch_delete.sh
```

### Q4: 如何删除 archive/ 中的文档？

```bash
# 同样使用删除脚本
./docs/delete_doc.sh docs/archive/old-doc.md
```

---

## 📞 需要帮助？

如果遇到问题：

1. 检查脚本输出错误信息
2. 查看 `docs/index.html.backup` 是否完好
3. 从 Git 历史恢复误删文件
4. 联系技术支持

---

## 🎯 最佳实践

### 日常维护建议

| 频率 | 操作 | 说明 |
|------|------|------|
| **每天** | 清理临时草稿 | 完成工作后立即清理 |
| **每周** | 检查文档索引 | 确保 index.html 准确 |
| **每月** | 批量维护 | 运行 batch_delete.sh 清理过期文档 |
| **每季度** | 归档整理 | 将重要历史文档移到 archive/ |

### 文档命名规范

- ✅ `doc-name-v1.0.md` - 带版本号
- ✅ `doc-name-2026-04-16.md` - 带日期
- ❌ `doc.md` - 无版本，难以区分
- ❌ `new-doc.md` - 语义不明

### 版本管理建议

- 重大更新 → 创建新版本 `doc-v2.0.md`
- 小修小补 → 直接修改原文件
- 废弃版本 → 移到 `docs/archive/` 或删除

---

**文档版本：** v1.0  
**最后更新：** 2026-04-16
