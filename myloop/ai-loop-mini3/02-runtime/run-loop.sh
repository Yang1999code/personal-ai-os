#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAX_ROUNDS="${MAX_ROUNDS:-3}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
LOCK_TIMEOUT="${LOCK_TIMEOUT:-600}"

INBOX="$ROOT/03-exchange/inbox"
OUTBOX="$ROOT/03-exchange/outbox"
LOCKS="$ROOT/03-exchange/locks"
TMP="$ROOT/03-exchange/tmp"
ARCHIVE="$ROOT/03-exchange/archive"
LAST_REPORT="$ROOT/10-outputs/last-report.md"
RUNS="$ROOT/05-history/runs.md"

mkdir -p "$INBOX" "$OUTBOX" "$LOCKS" "$TMP" "$ARCHIVE"

write_request() {
  local round="$1"
  local tmp="$TMP/round-${round}.request.md.tmp"
  local final="$INBOX/round-${round}.request.md"

  cat > "$tmp" <<EOF
# Round ${round} Request

请读取：

- $ROOT/loop.md
- $ROOT/01-state/loop-state.md
- $ROOT/12-target/target.md
- $ROOT/04-context-pack/context-pack.md
- $ROOT/09-boundaries/handoff-rules.md
- $ROOT/07-evaluation/evaluation.md

然后完成第 ${round} 轮深度探索。

输出文件：

- Explorer 写入：$OUTBOX/round-${round}.explorer.md
- Tester 写入：$OUTBOX/round-${round}.tester.md

输出顶部必须包含：

round: ${round}
role: explorer
status: continue | done | needs-human | failed
quality_gain: yes | no
next_action: continue | stop | ask-human | search | test
EOF

  mv "$tmp" "$final"
}

check_stale_locks() {
  local now
  now="$(date +%s)"
  shopt -s nullglob
  for lock in "$LOCKS"/*.lock; do
    local modified
    modified="$(stat -f %m "$lock")"
    if (( now - modified > LOCK_TIMEOUT )); then
      {
        echo "# Last Report"
        echo
        echo "## 状态"
        echo
        echo "检测到过期 lock，暂停 Loop。"
        echo
        echo "## 证据"
        echo
        echo "- lock: $lock"
        echo "- timeout_seconds: $LOCK_TIMEOUT"
      } > "$LAST_REPORT"
      echo "Stale lock detected: $lock"
      exit 2
    fi
  done
}

read_status() {
  local file="$1"
  awk -F': *' '/^status:/ {print $2; exit}' "$file"
}

for round in $(seq 1 "$MAX_ROUNDS"); do
  check_stale_locks
  write_request "$round"
  echo "Round $round request written:"
  echo "$INBOX/round-${round}.request.md"
  echo
  echo "请在另一个终端让 Claude/Codex 读取 request，并写入："
  echo "$OUTBOX/round-${round}.explorer.md"
  echo

  explorer="$OUTBOX/round-${round}.explorer.md"
  while [[ ! -f "$explorer" ]]; do
    check_stale_locks
    sleep "$POLL_INTERVAL"
  done

  status="$(read_status "$explorer")"
  {
    echo
    echo "## Round $round"
    echo
    echo "- request: \`03-exchange/inbox/round-${round}.request.md\`"
    echo "- explorer: \`03-exchange/outbox/round-${round}.explorer.md\`"
    echo "- status: $status"
  } >> "$RUNS"

  case "$status" in
    done|needs-human|failed)
      cp "$explorer" "$LAST_REPORT"
      echo "Loop stopped with status: $status"
      exit 0
      ;;
    continue)
      echo "Round $round complete; continuing."
      ;;
    *)
      cp "$explorer" "$LAST_REPORT"
      echo "Unknown status: $status"
      exit 3
      ;;
  esac
done

echo "Reached max rounds: $MAX_ROUNDS"
exit 0

