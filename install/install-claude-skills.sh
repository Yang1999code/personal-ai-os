#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SRC="$ROOT_DIR/myskill"
CLAUDE_SKILL_DIR="${HOME}/.claude/skills"

install_link() {
  local name="$1"
  local src="$SKILL_SRC/$name"
  local dst="$CLAUDE_SKILL_DIR/$name"

  if [ ! -f "$src/SKILL.md" ]; then
    echo "missing: $src/SKILL.md" >&2
    exit 1
  fi

  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.backup.$(date +%Y%m%d-%H%M%S)"
  fi

  ln -s "$src" "$dst"
  echo "linked: $dst -> $src"
}

mkdir -p "$CLAUDE_SKILL_DIR"
install_link "myloop"
install_link "my知识库"

echo
echo "Claude Code skills installed."
echo "Restart Claude Code if the slash commands do not appear immediately."
