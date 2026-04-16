# 🗑️ 文档删除功能 · 快速使用手册

> **一句话总结：** 一个命令删除文档，自动更新索引和推送 GitHub

---

## 🎯 快速开始

### 删除单个文档

```bash
cd /app/working/workspaces/RAKkDm
./docs/delete_doc.sh docs/path/to/your-doc.md
```

**示例：**
```bash
./docs/delete_doc.sh docs/architecture/hunter-architecture-v1.2.md
```

**流程：**
1. 运行命令 → 显示文件信息
2. 输入 `y` → 确认删除
3. 自动完成 → 删除文件 + 更新索引 + 推送 GitHub
4. 等待 1-2 分钟 → GitHub Pages 自动更新

---

### 批量删除文档

**步骤 1：编辑删除清单**
```bash
# 打开 DELETE_LIST.md
vim docs/DELETE_LIST.md
```

**步骤 2：添加待删除文档**
```markdown
## 📋 待删除列表

```
docs/architecture/old-1.md
docs/architecture/old-2.md
docs/prd/draft-1.md
```
```

**步骤 3：运行批量删除**
```bash
./docs/batch_delete.sh
```

**步骤 4：确认执行**
输入 `y` → 自动批量删除所有列出的文档

---

## 📋 完整功能

| 功能 | 命令 | 说明 |
|------|------|------|
| 单个删除 | `./docs/delete_doc.sh <路径>` | 快速删除单个文档 |
| 批量删除 | `./docs/batch_delete.sh` | 基于清单批量删除 |
| 查看指南 | 打开 `docs/DELETE_GUIDE.md` | 详细使用文档 |
| 查看清单 | 打开 `docs/DELETE_LIST.md` | 编辑待删除列表 |

---

## ✅ 安全特性

- ✅ **删除前确认** - 必须输入 `y` 才执行
- ✅ **自动备份** - 删除前备份 index.html
- ✅ **索引同步** - 自动更新文档中心导航
- ✅ **Git 追踪** - 所有操作有 Git 记录
- ✅ **误删恢复** - 可从 Git 历史恢复

---

## 🆘 误删恢复

```bash
# 1. 找到删除的提交
git log --diff-filter=D --summary

# 2. 恢复文件
git checkout <commit-hash>^ -- docs/path/to/file.md

# 3. 推送到 GitHub
git push
```

---

## 📞 详细文档

查看完整使用指南：
- **本地：** `docs/DELETE_GUIDE.md`
- **线上：** https://Leojunhan.github.io/ofw-docs/

---

**版本：** v1.0  
**更新：** 2026-04-16
