#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DESKTOP_DIR="${HOME}/Desktop"

copy_if_missing() {
  local src="$1"
  local dst="$2"
  if [ -e "$dst" ]; then
    echo "skip: $dst already exists"
    return 0
  fi
  cp -R "$src" "$dst"
  echo "created: $dst"
}

mkdir -p "$DESKTOP_DIR"

copy_if_missing "$ROOT_DIR/myskill" "$DESKTOP_DIR/myskill"
copy_if_missing "$ROOT_DIR/myloop" "$DESKTOP_DIR/myloop"
copy_if_missing "$ROOT_DIR/my知识库-template" "$DESKTOP_DIR/my知识库"

echo
echo "Desktop layout ready."
echo "myskill:  $DESKTOP_DIR/myskill"
echo "myloop:   $DESKTOP_DIR/myloop"
echo "my知识库: $DESKTOP_DIR/my知识库"
