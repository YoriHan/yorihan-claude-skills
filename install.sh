#!/bin/bash
set -e
REPO="https://raw.githubusercontent.com/YoriHan/yorihan-claude-skills/main/commands"
DEST="$HOME/.claude/commands"
mkdir -p "$DEST"

skills=(
  "kol-linkedin-import"
  "kol-plan"
  "kol-eval"
  "kol-linkedin"
  "linkedin"
  "notion-update"
  "wells"
  "o"
  "user"
)

for skill in "${skills[@]}"; do
  curl -fsSL "$REPO/$skill.md" -o "$DEST/$skill.md"
  echo "✓ $skill"
done

echo ""
echo "Done! $(ls "$DEST"/*.md | wc -l | tr -d ' ') skills installed to $DEST"
