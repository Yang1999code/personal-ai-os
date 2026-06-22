# AI Loop Mini 3

这是一个 while-driven deep loop（while 脚本驱动的深度循环）模板。

它参考 `ai-loop-mini2`，但多了一个很薄的执行层：

- `loop.md` 负责策略和判断
- `00-alignment/` 负责任务特化初始化时的人机对齐
- `修改记录.md` 是中文修改总账，记录改前、改后、原因、隐患和 git（版本控制）联动
- `02-runtime/run-loop.sh` 负责 while 循环和最多轮次
- `03-exchange/` 负责多终端文件交互
- `locks/` 和 `tmp/` 负责避免“写了一半就被读”
- AI 仍然负责深度思考，脚本只负责节奏

## 使用方式

1. 在 `12-target/target.md` 写目标。
2. 在 `04-context-pack/` 放背景、资料、现状和约束。
3. 终端 A 运行：

```bash
cd $HOME/Desktop/myloop/ai-loop-mini3
bash 02-runtime/run-loop.sh
```

4. 终端 B 打开 Claude/Codex，读取脚本生成的：

```text
03-exchange/inbox/round-1.request.md
```

5. 终端 B 按要求写回：

```text
03-exchange/outbox/round-1.explorer.md
```

6. 脚本读取完整 `.md` 输出，根据 `status:` 决定继续、停止或问人。

## 注意

- 脚本只读 `.md`，不读 `.tmp`。
- 写入时先写 `tmp/`，再改名到 `outbox/`。
- 复杂判断仍然返回给人。
- 本文件夹使用本地 git（版本控制）记录模板变更，不自动推送。

## 作为母模板使用

真实任务不建议直接写进本模板。优先参考 `$HOME/Desktop/myloop/task-initializer.md`，在目标项目下生成任务专用 Loop（循环），再决定是否启用 while 脚本、多终端和文件锁。

如果修改本模板本身，要同步更新：

- `$HOME/Desktop/myloop/00-change-log/change-log.md`
- `修改记录.md`
- `08-git-backups/git-backup-log.md`
- 本模板的本地 git（版本控制）提交
