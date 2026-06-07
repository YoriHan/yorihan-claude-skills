# yorihan-claude-skills

Yorihan 的个人 Claude Code skill 合集。

## 安装全部

```bash
curl -fsSL https://raw.githubusercontent.com/YoriHan/yorihan-claude-skills/main/install.sh | bash
```

## 手动安装单个

```bash
curl -o ~/.claude/commands/<skill-name>.md \
  https://raw.githubusercontent.com/YoriHan/yorihan-claude-skills/main/commands/<skill-name>.md
```

## Skills 列表

| Skill | 用途 |
|-------|------|
| `/kol-linkedin-import` | LinkedIn KOL 批量入库 Notion，自动抓取粉丝/标签/备注 |
| `/kol-plan` | KOL 合作计划拆分，自动生成预算表和漏斗数据 |
| `/kol-eval` | KOL 合作价值评估，自动抓取数据计算 CPM/ER |
| `/kol-linkedin` | Helio KOL LinkedIn 素材库内容生成 |
| `/linkedin` | LinkedIn 功能发布帖创作 |
| `/notion-update` | Notion 文档批量数据更新 |
| `/minutes` | 读取飞书妙记，提取行动项并执行 |
| `/wells` | Wells 计划审核导航 |
| `/o` | 将对话总结存入克克笔记本（Karpathy Wiki 模式） |
| `/user` | 整理用户访谈记录并上传 GitHub |
