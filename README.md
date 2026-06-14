# yorihan-claude-skills

## 在 Helio 安装

Helio 是按 repo 里的 `SKILL.md` 文件来装 skill 的（`commands/*.md` 是 Claude Code slash command，Helio 不识别）。目前已转成 Helio skill 格式的是 **meeting-notes**：

```
https://github.com/YoriHan/yorihan-claude-skills/tree/main/meeting-notes
```

或命令行：

```bash
heliox skill install YoriHan/yorihan-claude-skills --path meeting-notes --description "会议/访谈纪要整理"
```

> 其余命令（kol-* / linkedin / notion-update / o / user / wells）目前仍是 Claude Code slash command 格式，要在 Helio 里用需要同样补一个 `<名字>/SKILL.md`——需要的话告诉我，我按同样方式转。

---

Yorihan 的 Claude Code 个人 skill 合集，覆盖 KOL 运营、内容创作、会议整理、知识管理等场景。

## 快速安装

**安装全部 skills：**

```bash
curl -fsSL https://raw.githubusercontent.com/YoriHan/yorihan-claude-skills/main/install.sh | bash
```

**安装单个 skill：**

```bash
curl -o ~/.claude/commands/<skill-name>.md \
  https://raw.githubusercontent.com/YoriHan/yorihan-claude-skills/main/commands/<skill-name>.md
```

安装后在 Claude Code 中直接输入 `/skill-name` 即可触发。

---

## Skills 目录

### KOL 运营

| Skill | 用途 |
|-------|------|
| `/kol-linkedin-import` | 从 LinkedIn 批量导入 KOL 到 Notion，自动抓取粉丝数、话题标签、备注 |
| `/kol-eval` | KOL 合作价值评估，自动抓取数据，计算 CPM / ER，输出合作建议 |
| `/kol-plan` | KOL 合作计划拆分，自动生成预算分配表和漏斗转化数据 |
| `/kol-linkedin` | Helio KOL LinkedIn 素材库内容生成与管理 |

### 内容创作

| Skill | 用途 |
|-------|------|
| `/linkedin` | LinkedIn 功能发布帖创作，适配不同受众风格 |

### 会议 & 访谈

| Skill | 用途 |
|-------|------|
| `/meeting-notes` | 读取飞书妙记/腾讯会议链接或逐字稿，自动识别会议类型：团队会议输出主题摘要 + 人员 Todo + 待决策事项；用户访谈输出结构化访谈纲要（自动上传 GitHub）+ 研发速查（Bug 表 / 认知偏差 / 功能需求优先级） |
| `/user` | 整理用户访谈记录并按编号上传 GitHub |

### 知识管理

| Skill | 用途 |
|-------|------|
| `/o` | 将当前对话整理成结构化笔记，存入克克笔记本（Karpathy Wiki 模式） |
| `/notion-update` | Notion 文档批量数据更新 |

### 其他

| Skill | 用途 |
|-------|------|
| `/wells` | Wells 计划审核导航 |

---

## 贡献 / 反馈

欢迎提 Issue 或 PR。如果你也在用 Claude Code 做产品运营，可以聊聊 👋
