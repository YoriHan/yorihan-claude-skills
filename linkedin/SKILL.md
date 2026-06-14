---
name: linkedin
description: "Write LinkedIn product-launch posts adapted to different audiences; 'fetch' auto-pulls the latest RELEASE_NOTES. Trigger: 'linkedin', '写 LinkedIn 发布帖', '功能发布帖', 'changelog 发帖'."
---

> **Helio 运行说明**：本 skill 由你的自然语言请求触发（不是 Claude Code 的 `/命令`）。下文中出现的 `$ARGUMENTS` 指你在请求里给出的参数——链接 / 关键词 / 模式词等；没给参数时按各步骤的「留空」分支处理。

# LinkedIn 功能发布帖创作

输入：$ARGUMENTS（可填功能描述、changelog 内容、场景素材、或 "fetch" 自动拉取最新 RELEASE_NOTES）

## 用途

根据输入内容，自动判断帖子类型，选择最合适的模板，生成符合 Helio 品牌规范的 LinkedIn 英文帖文，直接在对话中输出。

---

## 第一步：获取内容

如果 $ARGUMENTS 为空，询问：
> "请提供内容，可以是：
> 1. 直接粘贴功能描述 / changelog 条目
> 2. 输入 'fetch' 自动读取最新 RELEASE_NOTES
> 3. 提供场景素材或用户故事素材"

如果 $ARGUMENTS 包含 "fetch"，使用 Bash 执行：
```
curl -s https://raw.githubusercontent.com/sheet0/helio/main/ui/helio-desktop/RELEASE_NOTES.md | head -100
```
读取最新版本的 changelog 内容后继续。

---

## 第二步：自动分类帖子类型

根据输入内容，按以下规则判断类型：

**判断为「功能发布帖」的信号：**
- 包含版本号（v1.x、2.0、"release"、"update"）
- 描述新增功能、新能力、新集成
- 来源是 RELEASE_NOTES / changelog 条目
- 描述用户现在"可以做"什么新操作

**判断为「场景教育帖」的信号：**
- 描述的是一种使用方式、工作流、或"如何用 Helio 完成某件事"
- 没有明确的版本更新背景
- 侧重展示产品能解决什么问题，而非新增了什么功能

**判断为「用户故事帖」的信号：**
- 包含真实用户信息（姓名、职位、公司）
- 有"之前 vs 之后"的使用对比
- 包含用户原话/引语
- 包含量化结果（节省多少时间、处理多少任务等）

**输出判断结果**，格式：
> 内容类型：[功能发布帖 / 场景教育帖 / 用户故事帖]
> 判断依据：[1-2 句说明为什么这样分类]

---

## 第三步：功能发布帖 — 选择子模板

如果是「功能发布帖」，进一步判断子模板：

**Launch 型**（用于有一定跨度的版本更新，多个功能集合）
- 信号：major/minor 版本号，多个并列功能同时更新，"2.0"/"v3"等

**Introduce 型**（用于单个较大功能首次亮相）
- 信号：一个全新的核心功能，功能名称显著，之前完全不存在

**You can now 型**（用于单个功能消除了之前的摩擦点）
- 信号：之前需要手动操作/绕路完成，现在有更直接的方式；强调"之前 vs 现在"

**Integration 型**（用于接入外部工具、模型、平台）
- 信号：提到与第三方服务连接（Slack、GitHub、Gmail、某个 AI 模型等）

**输出子模板选择结果**：
> 子模板：[Launch / Introduce / You can now / Integration]
> 原因：[1 句说明]

---

## 第四步：生成帖文

根据分类和模板，严格按以下结构生成帖文。

---

### 功能发布帖 — Launch 型

```
[新版本名] is live.

[新版本] is no longer just about [旧的窄定义]. It is about [更丰富的新定义].

Now [主语] can [能力 A], [能力 B with verb], and [能力 C with verb].

Available now to all [users / teams].
```

视频说明（在帖文下方标注）：
> 配套视频：约 40s 新版本亮点功能演示

---

### 功能发布帖 — Introduce 型

```
Introducing [功能名] — [一句话说这是什么].

[使用中遇到的场景问题]. [新功能如何解决这个问题]. [产生的效果].

[重申核心价值，1 句]. Available now in Helio.
```

视频说明：
> 配套视频：10s 以内功能操作演示

---

### 功能发布帖 — You can now 型

```
You can now [使用新功能的简洁动作] in Helio.

[不用再做的旧动作]. [用户可以用这个功能做什么]. [为什么这降低风险 / 节省时间 / 提升质量].

[短句动词链，直接变成操作顺序，如：Open → Set → Done.]
```

视频说明：
> 配套视频：10s 以内功能操作演示

---

### 功能发布帖 — Integration 型

```
Helio now works deeper with [工具 / 模型名].

Connect [对象 A] — [动作 B，能回答什么业务问题] — [可交付的新价值 C].

Available now in Helio.
```

配图说明：
> 配套图片：截图展示集成效果

---

### 场景教育帖

```
[反直觉的开场 Hook，1 句，必须语出惊人——用反差、数字冲击或反直觉观察，不能是平铺直叙的描述]

[展开场景：1-2 句说明 Helio 解决的是什么痛点]

Your AI colleague on Helio:

> [AI具体做了什么，动作 A]
> [AI具体做了什么，动作 B]
> [AI具体做了什么，动作 C]

[金句收尾，重申核心价值，1 句]

👉 Link in comments.
```

**场景教育帖写作规则：**
- Hook 必须语出惊人：反差感强、有画面、或让人看到第一句就想继续读
- 必须用 `>` bullet 形式列出 AI colleague 具体做了什么，让读者一眼看懂产品能力
- 整体不超过 80 词，宁可更短

---

### 用户故事帖

```
[用户是谁：职位 + 公司规模/场景，1 句]

[他们之前怎么做这件事，痛点，1-2 句]

[用 Helio 后发生了什么，必须有具体结果]

"[用户原话引语]" — [姓名], [职位]

👉 Link in comments.
```

---

## 第五步：品牌规范检查

生成帖文后，自动按以下清单检查并修正：

**必须出现（至少 1 个）：**
- [ ] AI colleague / AI team member
- [ ] AI-Native Workforce（或 AI-native）
- [ ] proactive / autonomous（功能帖适用时）

**必须删除：**
- [ ] "AI assistant" / "AI chatbot" / "AI tool"（单独使用时）
- [ ] "全自动化" / "replace humans" / "AI replaces"
- [ ] "sign up" / "try now" / "check it out"（用 "Link in comments" 替代）
- [ ] 感叹号开头（第一句永远是陈述事实）
- [ ] 链接放正文（链接统一放评论区，正文只写 "👉 Link in comments."）

**写作规律校验（来自 Manus 拆解）：**
- [ ] 第一句：陈述事实，不加感叹修饰
- [ ] Bullet 用行动导向语言（用户能做什么），非特性描述
- [ ] 收尾极短，1-2 句，不重复 bullet 内容
- [ ] 整体字数控制在 80-150 词

---

## 第六步：输出格式

输出以下内容：

```
---
类型：[功能发布帖 / 场景教育帖 / 用户故事帖]
子模板：[Launch / Introduce / You can now / Integration / N/A]
配套素材：[视频40s / 视频10s / 截图 / 无]
---

[帖文正文，英文，直接可复制发布]

---
发布建议：[一句话说明发布时机或团队联动提示，如"发布后@全员，请点赞+评论"]
```

---

## 注意事项

- 帖文永远是英文，面向 LinkedIn 的英语母语/职场用户
- 不在正文放链接，统一用 "👉 Link in comments."
- 功能帖第一句永远是陈述事实，不用感叹句开头
- Integration 型帖文如无截图素材，在配套素材处注明"需准备截图"
- 所有帖文 status 初始为 draft，用户确认后可手动改为 published
- 如果输入内容同时符合多种类型，优先选择功能发布帖（最高优先级）
