---
name: o
description: "Summarize the current conversation into the 克克笔记本 (Karpathy Wiki mode): 对话复盘 / 概念库 / 问题手册 / 错题本, then update index + log. Notebook root path is configurable. Trigger: 'o', '存笔记', '整理对话到笔记本', '克克笔记本'."
---

> **Helio 运行说明**：本 skill 由你的自然语言请求触发（不是 Claude Code 的 `/命令`）。下文中出现的 `$ARGUMENTS` 指你在请求里给出的参数——链接 / 关键词 / 模式词等；没给参数时按各步骤的「留空」分支处理。

将当前对话总结并存入克克笔记本（Karpathy Wiki 模式）。

## 第零步：解析笔记本根目录（每次先执行）

```bash
CFG="$HOME/.claude/keke-notebook/config.json"
NOTEBOOK_ROOT=$( [ -f "$CFG" ] && python3 -c "import json;print(json.load(open('$CFG')).get('notebook_root',''))" )
[ -z "$NOTEBOOK_ROOT" ] && NOTEBOOK_ROOT="$HOME/Documents/克克笔记本"
echo "NOTEBOOK_ROOT=$NOTEBOOK_ROOT"
```

下文所有 `${NOTEBOOK_ROOT}/...` 都用这个值；本地 Mac 想固定到原来的绝对路径，就在 `~/.claude/keke-notebook/config.json` 里写 `{"notebook_root": "/Users/yorihan/Documents/克克笔记本"}`。

---

## 执行步骤

### Step 1：读 index
打开 `${NOTEBOOK_ROOT}/_系统/index.md`，了解现有页面结构。

### Step 2：Ingest 当前对话

**对话复盘**（每次新建）
新建 `${NOTEBOOK_ROOT}/对话复盘/YYYY-MM-DD 主题.md`，内容包含：
- **做了什么** — 本次对话完成的具体事项
- **思路分析** — 用了什么框架/方法
- **✅ 做得好的** — 值得复用的判断和操作
- **⚠️ 可以更好的** — 走了弯路或可以改进的地方
- **💡 方法论提炼** — 可跨项目复用的原则（2-4条）
- **🔧 工程启示** — 技术/工具层面的发现
- **🙋 今天我问了什么** — 见下方规则

**🙋 今天我问了什么**（写在复盘末尾）
扫描对话，找出用户问过的操作/概念/工具类问题，格式：
```
### Q: [用户原始问题]
**简单解释：** [一两句，面向文科生，技术词保留英文但解释]
**官方文档：** [如果知道关键词就写"建议在 docs.anthropic.com/en/docs/claude-code/ 搜索 X"，不要编造具体链接]
```

**概念库**（更新已有页面，没有才新建）
对话中出现的工具/技术/概念：
- 已有页面（见 index.md）→ 在"对话记录" section 追加一行
- 新概念 → 新建 `${NOTEBOOK_ROOT}/概念库/概念名.md`

**问题手册**（追加，不重复）
将 🙋 section 里的 Q&A 同步到对应分类文件：
- Claude Code 操作 → `问题手册/Claude Code 操作.md`
- Git/GitHub → `问题手册/Git & GitHub.md`
- 通用概念 → `问题手册/Vibe Coding 通识.md`

**开源项目库**（对话中有 GitHub 链接时）
追加到 `开源项目库/` 对应分类文件，并更新 `开源项目库/README.md` 索引表。

**错题本**（对话中出现了明显的操作失误、方向走弯路、需求理解偏差、Claude自作主张时）
追加到 `${NOTEBOOK_ROOT}/错题本/错题记录.md`，格式：
```
### #N 标题
**现象：** 发生了什么
**根因：** 为什么发生
**下次怎么做：**
**标签：** 🔧操作/工具失误 | 🧭方向/判断失误 | 💬沟通/需求失误 | 🤖Claude理解错误
```
同时更新文件末尾的"统计"表格中的数量。

### Step 3：更新 index
在 `_系统/index.md` 的对话复盘表格里加入本次新建的文件。

### Step 4：写操作日志
在 `_系统/log.md` 末尾追加：
```
## [YYYY-MM-DD HH:MM] manual-ingest | /o 触发 | 对话主题
**新建：** 对话复盘/YYYY-MM-DD 主题.md
**更新：** [列出更新了哪些概念库/问题手册文件]
```

## 重要约束

- 路径：一律写入 `${NOTEBOOK_ROOT}/`，不询问
- 链接：不编造 docs.anthropic.com 具体链接，只写搜索建议
- 语言：中文写作，技术词保留英文原名但解释
- 概念库原则：更新优先，新建其次，不重复
