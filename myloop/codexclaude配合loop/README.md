# Codex Claude 配合 Loop

这是一个双 Agent（智能体）协作 Loop（循环）：Codex 做核心总控，Claude Code 做项目内开发执行。

它适合复杂但不想搞多 Agent（多智能体）混战的开发任务。核心目标是让两个 AI 隔着 Git（版本控制）和 `messages.jsonl` 稳定交接：一个负责计划、检查、控电脑和汇报，一个负责项目内开发、自检和提交结果。

## 一句话模型

```text
人定目标 -> Codex 写计划和说明 -> Claude Code 开发自检 -> Git 记录事实 -> Codex 检查验收 -> 给人讲明白
```

## 角色分工

| 角色 | 定位 | 主要职责 |
| --- | --- | --- |
| 人 | owner（主人） | 定目标、确认关键取舍、决定是否继续或沉淀 |
| Codex | control plane（控制平面） | 拆计划、控制电脑、检查 Git、追加消息、和人汇报 |
| Claude Code | worker（执行者） | 只在项目内改代码、跑测试、自检、提交开发结果 |
| Git | 事实层 | 记录真实改动、diff（差异）、commit（提交） |
| `messages.jsonl` | 交互账本 | 一行一条消息，只追加，不改旧记录 |

## 最小文件结构

在目标项目中创建：

```text
docs/ai-collaboration/
  plan.md           # 当前任务计划、边界、验收标准和状态
  messages.jsonl    # Codex / Claude Code 的正式交互账本
  更新记录.md        # 可选，给人看的白话摘要
```

如果要极简，保留 `plan.md` 和 `messages.jsonl` 两个文件即可。

## 启动方式

让 Codex 读取：

```text
$HOME/Desktop/myloop/codexclaude配合loop/loop.md
```

然后给出：

- 目标项目路径。
- 要完成的任务。
- 是否允许 Claude Code 修改项目文件。
- 是否需要最终沉淀到 `my知识库`、`myloop` 或 `myskill`。

## 白话总结

这个 Loop 就是把 Codex 当总管，Claude Code 当项目程序员。Codex 不只审代码，还负责控电脑、和人沟通、把关键逻辑讲明白；Claude Code 只在项目里干活。Git 记录真实改动，`messages.jsonl` 记录双方交接。
