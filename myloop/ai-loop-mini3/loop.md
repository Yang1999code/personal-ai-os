# While-Driven Deep Loop

你是这个文件夹的 AI 执行者。这个 Loop（循环）的目标是在 `ai-loop-mini2` 的 human-guided deep loop（人引导的深度循环）基础上，增加一个很薄的 while 脚本执行层。

核心思想：

- `loop.md` 是策略层：告诉 AI 怎么思考、什么时候问人、怎么评价。
- `02-runtime/run-loop.sh` 是执行层：最多跑几轮、读写哪些文件、什么时候停。
- `03-exchange/` 是交互层：多终端、多 Agent（智能体）通过文件交换信息。
- 锁文件负责避免“写了一半就被读”。
- 仍然不是全自动替代人，复杂判断必须返回给人。

## 0. 文件夹角色

- `00-alignment/`：任务特化初始化时的人机对齐材料
- `修改记录.md`：中文修改总账，记录改前、改后、原因、隐患和 git（版本控制）联动
- `01-state/`：目标、轮次、当前判断、开放问题、重要决策
- `02-runtime/`：while 循环脚本、锁协议、运行配置
- `03-exchange/`：多终端/多 Agent 的文件交换区
- `04-context-pack/`：本轮给 AI 的上下文包
- `05-history/`：每轮实际发生了什么
- `06-reflection/`：没有明显推进时的反思和搜索建议
- `07-evaluation/`：测试、评价、Tester（测试者）结论
- `08-git-backups/`：本地 git（版本控制）记录和回退说明
- `09-boundaries/`：少量硬边界和返回人工规则
- `10-outputs/`：本轮报告和最终给人的总结
- `11-agents/`：Deep Explorer（深度探索者）和 Tester（测试者）角色模板
- `12-target/`：目标对象、目标地址、Done（完成）判断
- `13-prompts/`：可直接复制使用的提示词
- `00-human-docs/`：给人看的说明和架构图，不参与执行

## 0.1 母模板与任务特化

本文件夹是 while-driven（while 脚本驱动）母模板。真实任务优先参考 `/Users/ycl/Desktop/myloop/task-initializer.md`，在目标项目下创建任务专用 Loop（循环），然后再选择是否运行 `02-runtime/run-loop.sh`。

任务特化时必须明确：

- 是否真的需要脚本控轮次。
- Explorer（探索者）和 Tester（测试者）分别由哪个终端/Agent（智能体）负责。
- `status:` 字段如何判断。
- 哪些情况必须返回人。

如果用户明确要求直接修改本模板，修改后必须记录：

- `/Users/ycl/Desktop/myloop/00-change-log/change-log.md`
- `修改记录.md`
- `08-git-backups/git-backup-log.md`
- 本模板 git（版本控制）提交

任务专用 Loop 初始化完成后，必须有自己的独立本地 git（版本控制）仓库，并在 `修改记录.md` 记录初始化提交；不要用任务 Loop 的 git 替目标项目提交代码。

## 1. 每轮启动读取顺序

每轮开始时先读：

1. `01-state/loop-state.md`
2. `01-state/decisions.md`
3. `01-state/open-questions.md`
4. `12-target/target.md`
5. `04-context-pack/context-pack.md`
6. `04-context-pack/source-notes.md`
7. `09-boundaries/handoff-rules.md`
8. `07-evaluation/evaluation.md`
9. `05-history/runs.md`
10. `06-reflection/reflection.md`
11. `02-runtime/runtime-config.md`
12. `03-exchange/README.md`

如果上下文不足，先尝试从已有材料补齐；如果仍然缺关键判断，再返回给人，不要硬猜。

## 2. while 脚本定位

`02-runtime/run-loop.sh` 只负责控制节奏，不负责替 AI 思考。

它应该只做这些事：

- 检查最多轮次
- 生成本轮输入文件
- 等待 AI 或人把本轮输出写入 `03-exchange/outbox/`
- 检查输出里的 `status`
- 根据 `done`、`needs-human`、`continue`、`failed` 决定下一步
- 记录运行状态

它不应该做这些事：

- 自动删除、部署、推送、安装依赖
- 自动替人做业务判断
- 自动解析含糊结论后强行继续
- 绕过 `09-boundaries/handoff-rules.md`

## 3. 多终端交互方式

可以打开多个终端：

- 终端 A：运行 `02-runtime/run-loop.sh`
- 终端 B：运行 Claude/Codex 作为 Explorer（探索者）
- 终端 C：运行 Claude/Codex 作为 Tester（测试者）

交互方式：

1. 脚本把任务写到 inbox，例如 round-1.request.md
2. Explorer 读取 request，写 outbox，例如 round-1.explorer.md
3. Tester 读取 Explorer 输出，写 outbox，例如 round-1.tester.md
4. 脚本只读取已经完成的 Markdown 文件
5. 脚本根据文件中的 `status:` 决定继续、停止或问人

## 4. 锁和原子写入规则

为了避免“写了一半就被读”，所有写入都遵守：

1. 先写到 tmp 目录，例如 round-1.explorer.md.tmp
2. 写完后改名为目标 Markdown 文件
3. 改名必须是最后一步
4. 脚本只读取 Markdown 文件，永远不读取临时文件
5. 如果需要互斥，在 locks 目录创建 lock，例如 `round-1.explorer.lock`
6. 写完后删除 lock

如果发现 lock 长时间存在，脚本应该停止并返回给人。

## 5. 三轮策略

默认最多三轮：

- 第 1 轮：建模和深度探索
- 第 2 轮：深入解决或验证
- 第 3 轮：收敛和交付

如果某一轮已经完成，可以提前停止。

如果某一轮没有质的提升，先写入 `06-reflection/reflection.md`，再决定是补上下文、搜索、测试、返回人，还是停止。

## 6. 质的提升标准

“质的提升”至少满足一项：

- 问题结构更清楚
- 发现了新的关键证据
- 排除了一个错误方向
- 形成了可执行下一步
- 完成了低风险修复或验证
- 明确了需要人判断的问题

如果只是换一种说法重复上一轮，不算质的提升。

## 7. 什么时候返回给人

满足以下情况，优先返回给人：

- 需要业务判断或价值取舍
- 需要删除、覆盖、部署、提交、安装依赖
- 需要访问账号、密钥、token（令牌）或真实外部系统
- 多条路线都可行，但风险/成本不同
- 反思后确认继续推进需要人判断
- 目标或 Done（完成）判断不清楚
- 锁文件异常、输出缺失、状态字段不可信

## 8. 每轮输出格式

Explorer 和 Tester 都应该输出 Markdown，但顶部必须包含稳定字段：

```text
round: 1
role: explorer
status: continue | done | needs-human | failed
quality_gain: yes | no
next_action: continue | stop | ask-human | search | test
```

下面再写自然语言报告：

```text
本轮结论：
证据：
质的提升：
风险：
需要人判断的问题：
建议下一步：
```
