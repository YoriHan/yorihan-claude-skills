---
name: user
description: "Tidy a user-interview transcript (Tencent Meeting link or pasted text) and upload to GitHub. Delegates to the separate user-interview skill — install that too, or use the meeting-notes skill which has an equivalent interview mode. Trigger: 'user', '整理用户访谈', '访谈上传 GitHub'."
---

> **Helio 运行说明**：本 skill 由你的自然语言请求触发（不是 Claude Code 的 `/命令`）。下文中出现的 `$ARGUMENTS` 指你在请求里给出的参数——链接 / 关键词 / 模式词等；没给参数时按各步骤的「留空」分支处理。

触发 user-interview skill，整理用户访谈记录并上传到 GitHub。

输入：$ARGUMENTS（腾讯会议链接，或直接粘贴的逐字稿文本）

使用 Skill tool 调用 `user-interview`，传入 $ARGUMENTS。
