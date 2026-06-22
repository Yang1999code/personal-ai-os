# myloop

这是本地 Loop（循环）模板集合，也是 `myloop` skill（技能）读取的工作流真实来源。

当前稳定入口保持不变：

- 根目录：`/Users/ycl/Desktop/myloop`
- 默认模板：`/Users/ycl/Desktop/myloop/ai-loop-mini2`
- 默认入口：`/Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md`

不要为了升级流程去改 `myskill/myloop`。优先更新本目录内的模板、说明和治理文件，让 skill（技能）继续按原来的检索方式读取最新内容。

## 三个模板

| 模板 | 定位 | 适合场景 |
| --- | --- | --- |
| `ai-loop-mini` | 轻脚手架、信任优先、Markdown（文档）驱动 | 想让 AI 自主探索、记录、评价和优化 |
| `ai-loop-mini2` | human-guided deep loop（人引导的深度循环） | 默认推荐；少交互、长思考、最多三轮、复杂问题问人 |
| `ai-loop-mini3` | while-driven deep loop（while 脚本驱动的深度循环） | 实验性；多终端 Claude/Codex 文件交互、脚本控轮次 |

## 场景 Loop

| 场景 Loop | 定位 | 适合场景 |
| --- | --- | --- |
| `01-research-loop` | 查找/需求 Loop（循环） | 目标不清楚，先查本地知识库、百度 KU、网络资料，输出需求和 Done 标准 |
| `02-create-loop` | 创建/实现 Loop（循环） | 目标清楚后，创建项目、改代码、写文档，并复用旧 loop1/2/3 作为执行引擎 |
| `03-test-loop` | 测试/验收 Loop（循环） | 独立测试，不默认相信实现者，构造测试集、写测试用例、出验收结论 |
| `04-meta-loop` | 元学习 Loop（循环） | 回看一次完整任务，学习“人是怎么带任务的”，抽取并对齐可复用的人类处理方式 |
| `codexclaude配合loop` | 双 Agent（双智能体）开发协作 Loop（循环） | Codex 做核心总控，Claude Code 做项目内开发、自检和 Git 交接 |

推荐顺序：

```text
01-research-loop 查清楚
02-create-loop 做出来
03-test-loop 验明白
04-meta-loop 学人怎么带任务
```

## 推荐用法

普通任务默认从 `ai-loop-mini2` 开始：

```text
读取 /Users/ycl/Desktop/myloop/ai-loop-mini2/loop.md，
参考 /Users/ycl/Desktop/myloop/task-initializer.md，
围绕我的目标和目标文件夹，先生成任务专用 Loop 初始化理解，再和我对齐。
```

如果已经明确需要脚本控轮次、多终端交互、文件锁和 `status:` 字段，再选择 `ai-loop-mini3`。

如果任务还没分清阶段，先按场景判断：

- 不知道要做什么：读 `01-research-loop/loop.md`
- 已经知道要做什么：读 `02-create-loop/loop.md`
- 已经做完要验收：读 `03-test-loop/loop.md`
- 已经完整跑完一次任务，想学习人的处理方式：读 `04-meta-loop/loop.md`
- 已经明确要让 Codex 计划检查、Claude Code 开发自检：读 `codexclaude配合loop/loop.md`

## 任务特化

这三个目录是母模板，不建议直接拿来承载真实长期任务。

真实任务建议在目标项目下面生成任务专用目录，例如：

```text
目标项目/
  .project-loops/
    任务名/
      00-alignment/
      01-state/
      修改记录.md
      ...
```

具体初始化规则见：

- `task-initializer.md`

核心流程是：

1. AI 读取目标项目文件、Markdown（文档）、记录和已有上下文。
2. AI 尽力查找当前工具可访问的会话/记忆线索，但不假设一定有稳定接口。
3. AI 生成 `initial-understanding.md` 给人看。
4. 人补充目标、限制、测试、偏好和风险。
5. AI 根据确认信息特化一个任务专用 Loop。
6. 跑之前再做一次 final alignment（最终对齐）。

## 变更复盘和 git

本目录有两层 git（版本控制）：

- 根目录 git：只记录治理文档、初始化规则、变更复盘日志。
- 每个模板自己的 git：记录该模板内部文件的变化。

根目录故意忽略三个模板目录，避免把嵌套仓库误当成 submodule（子模块）或普通大目录。

所有未来修改都要先后更新：

- `00-change-log/change-log.md`
- 每个模板或任务 Loop 内的 `修改记录.md`
- 对应模板内的 git 记录文件，例如 `06-git-backups/git-backup-log.md` 或 `08-git-backups/git-backup-log.md`
- 对应 git commit（提交）信息

每个任务专用 Loop 都要初始化自己的独立本地 git（版本控制）仓库，只记录这个任务 Loop 自己的状态、记录和输出；不要用它替目标项目提交代码。

如果改动会影响 `/Users/ycl/Desktop/myskill/myloop/SKILL.md` 依赖的稳定入口，必须先问人。

## 白话总结

`myloop` 是总仓库，里面既有四个场景 Loop，也有三个执行模板。默认继续用 `ai-loop-mini2`，但更完整的流程是先查清楚、再做出来、再验明白；如果想让 AI 学你是怎么带任务的，再进入 `04-meta-loop`。
