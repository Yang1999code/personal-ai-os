# Runtime Config

这里配置 while 脚本的最小运行参数。

## 基本配置

```text
max_rounds: 3
lock_timeout_seconds: 600
poll_interval_seconds: 5
mode: manual-exchange
```

## 模式说明

- `manual-exchange`：脚本生成 request，人或 AI 在另一个终端手动读取并写回 outbox。
- `command-exchange`：未来可扩展为脚本直接调用 `codex exec` 或 Claude CLI。

当前默认用 `manual-exchange`，因为它更稳，也更符合“人掌舵、AI 深挖”。

