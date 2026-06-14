---
name: kol-linkedin
description: "Generate and manage Helio KOL LinkedIn 素材库 content adapted to scenario/topic/KOL-type; 'add' appends to the Notion library. Trigger: 'kol-linkedin', 'LinkedIn 素材', 'LinkedIn 内容生成'."
---

> **Helio 运行说明**：本 skill 由你的自然语言请求触发（不是 Claude Code 的 `/命令`）。下文中出现的 `$ARGUMENTS` 指你在请求里给出的参数——链接 / 关键词 / 模式词等；没给参数时按各步骤的「留空」分支处理。

# Helio KOL LinkedIn 素材库 — 内容生成 & 管理

输入：$ARGUMENTS（可填场景、主题、KOL类型、条数，或"add"追加到Notion库）

## 用途

为 Helio KOL 合作生成可直接发布的 LinkedIn 英文帖文。
遵循本次实战验证的写作原则：**短、狠、真实**。

Notion 素材库：https://www.notion.so/KOL-Draft-376bb9e3b84d804a9495fa9a1fc422ea

---

## 核心写作原则（不可违反）

### 长度
- **总字数 ≤ 150 词，约 10 行**
- Hook 前两行是生死线 — LinkedIn 用户在点"see more"之前只看这两行
- 宁可更短，不可更长

### 结构公式
```
Hook（2行）
─────
Tension（3-4行）
Insight（1-2行）
CTA（1行）
```

### CTA 规则
- 永远是：`Link in comments.`
- 不在正文放链接
- 不用感叹号结尾

---

## Hook 四种类型（按传播效果排序）

**1. Cognitive Reframe（认知颠覆）** — 最高破圈效果
> 说出一个反直觉的事实，让人觉得"等等，这不对吧"
> 例：`Code review is a bottleneck on almost every engineering team. It doesn't have to be.`

**2. Emotional Resonance（情感共鸣）** — 最高转发率
> 从一个弱点时刻切入，让人觉得"这说的是我"
> 例：`I used to spend 3 hours reviewing a contract nobody read. Then I stopped doing it myself.`

**3. Scene & Story（场景画面）** — 最易理解
> 具体时间+具体结果，画面感强
> 例：`I uploaded a 40-page report at 10pm. By 7am, the briefing was in my inbox.`

**4. Feature Spotlight（功能揭示）** — 适合极客受众
> "你可能不知道" 语气，揭示一个具体功能细节
> 例：`In Helio, your AI colleague has a calendar. Set a recurring brief. It runs every day without you.`

---

## 品牌规范（强制执行）

**必须用：**
- AI colleague / AI team member
- proactive / autonomous
- "AI executes, humans decide"（场景适合时）

**绝对禁止：**
- AI assistant / AI chatbot / AI tool（单独提及）
- "fully automated" → 改为 "AI executes, humans decide"
- "AI replaces humans"
- 感叹号开头（第一句永远是陈述事实）
- 正文放链接

---

## 六大场景（Scenario）

| 标签 | 场景 | 典型痛点 |
|------|------|---------|
| A · Document Processing | 合同/报告/数据表处理 | 手动读文件太慢，没有系统 |
| B · Daily Briefings | 日报/周报/行业速递 | 每天花40分钟"追赶"信息 |
| C · Education & Research | 研究综述/知识库 | 读了很多，记住的很少 |
| D · Light Development | 无代码构建工具/自动化 | 有想法，没技术背景 |
| E · GTM | 内容/outreach/竞品监控 | 手工执行占据大量时间 |
| F · Product & Engineering | 代码审查/spec评审/部署 | 决策等待是最大瓶颈 |

---

## KOL 受众类型

- **Tech**：工程师、indie hacker、AI创业者 — 喜欢产品细节、极客类比（如 Cursor vs Helio）
- **Non-Tech**：运营、内容、咨询、创业者 — 喜欢场景故事、强调"不需要技术背景"
- **General**：通用受众 — 情感共鸣+场景画面效果最好

---

## 每条帖文必须包含的字段

生成时同步输出以下结构：

```
Title: [标题，3-8词，能单独成句]
Theme: [Emotional Resonance / Cognitive Reframe / Scene & Story / Feature Spotlight]
Scenario: [A/B/C/D/E/F · 场景名]
KOL Type: [Tech / Non-Tech / General]

Hook:
[第1行]
[第2行]

Full Copy:
[完整帖文，含hook，含"Link in comments."]

Visual Guidance:
[配图/截图建议，1-2句，说明拍什么、对比什么、展示什么]
```

---

## 第一步：接收输入

如果 $ARGUMENTS 为空，询问：
> "请告诉我：
> 1. 场景（A文档 / B日报 / C研究 / D开发 / E GTM / F产研），或直接描述一个使用场景
> 2. KOL类型（Tech / Non-Tech / General）
> 3. 需要几条？
> 4. 是否需要追加到 Notion 素材库？"

---

## 第二步：生成帖文

按以下流程：

1. 确认场景 → 提炼核心痛点
2. 选择 Hook 类型（默认优先 Cognitive Reframe，情感共鸣次之）
3. 套用结构公式写作
4. 检查品牌规范
5. 输出完整字段

**情感共鸣帖的额外要求：**
- 从一个"难以承认的问题"切入，不是"我发现了好工具"
- 具体细节越多越真实（时间、数字、具体场景）
- 结尾必须是一个让人想保存的洞察句

**认知颠覆帖的额外要求：**
- 第一句必须让人觉得"这不对"或"等等"
- 不能是平铺直叙的描述
- 中间建立反差，结尾给出新框架

---

## 第三步（可选）：追加到 Notion

如果用户要求追加到素材库，使用 notion-create-pages 工具：
- Parent data_source_id: `5baa7c69-57fd-426d-9b9f-f6ff3fa66c7f`
- Status 默认设为 `Ready`
- 字段严格按数据库 schema 填写

---

## 输出示例（Cognitive Reframe × B · Daily Briefings × Tech）

```
Title: Scrolling Is Not Research
Theme: Cognitive Reframe
Scenario: B · Daily Briefings
KOL Type: Tech

Hook:
Scrolling Twitter for industry news isn't research.
It's hoping something important finds you.

Full Copy:
Scrolling Twitter for industry news isn't research.
It's hoping something important finds you.

─────

Every morning I was doing the same thing: open the feed, scroll past noise, try to find what actually moved overnight.

I was searching, not reading.

Now an AI colleague monitors the sources I actually trust. It surfaces the 3 signals that moved. It ships a digest — triggered by signal, not by schedule.

Zero tabs. Zero noise. Only what matters.

Link in comments.

Visual Guidance:
Split: chaotic Twitter feed (left) vs clean Helio digest (right). The contrast speaks for itself.
```

---

## 注意事项

- 帖文永远英文，面向 LinkedIn 职场用户
- KOL 可以把第一人称故事换成自己的真实经历，建议在帖文后备注"[KOL可替换：将X换成你自己的经历]"
- 不要堆砌功能点，每条帖文只聚焦一个痛点
- 避免 AI 写作腔：不用"In today's fast-paced world"、"leverage"、"game-changing"、"cutting-edge"
