# Task Initializer

这个文件定义：当用户给出一个具体目标或目标文件夹时，AI 怎么把母模板特化成任务专用 Loop（循环）。

它不是强脚本，而是给 Codex（代码智能体）、Claude Code（代码智能体）等 AI 使用的初始化协议。

## 目标

把通用模板变成面向具体任务的工作区：

```text
母模板 + 目标项目资料 + 当前对话理解 + 人的补充确认
= 任务专用 Loop
```

任务专用 Loop 应该放在目标项目内，而不是直接污染母模板：

```text
目标项目/
  .project-loops/
    任务名/
      00-alignment/
        initial-understanding.md
        user-confirmation.md
        final-alignment.md
      修改记录.md
      ...
```

每个任务专用 Loop 必须是独立本地 git（版本控制）仓库。它只管理任务 Loop 自己的文件，不替目标项目做提交、推送或回滚。

## 初始化阶段

### 1. 选择母模板

默认选择：

- `ai-loop-mini2`：大多数任务。

可选：

- `ai-loop-mini`：目标偏探索、希望 AI 更自由。
- `ai-loop-mini3`：明确需要 while 脚本、多终端、文件交换、锁协议。

### 2. 读取目标项目

AI 应尽量读取：

- 项目根目录结构。
- `README.md`、`AGENTS.md`、`CLAUDE.md`、`CODEX.md` 等说明文件。
- `docs/`、`notes/`、`log/`、`history/`、`record/` 等记录目录。
- 测试、脚本、配置、依赖文件。
- 最近 git（版本控制）提交和当前工作区状态。
- 用户明确指定的文件、文件夹、图片、PDF（便携式文档格式）或网页资料。

读取时要控制范围：先广后窄，先索引后正文，避免无意义吞大量文件。

### 3. 尝试读取会话和记忆线索

AI 可以尝试寻找当前工具可访问的上下文线索，例如：

- 当前对话已经提供的内容。
- 本地项目内的记录文档。
- 工具可公开读取的会话导出、历史摘要或 memory（记忆）文件。
- `.codex/`、`.claude/`、`.agents/` 等目录中与当前项目明确相关的说明。

注意：

- 不假设 Codex/Claude Code 一定提供稳定的“读取当前窗口历史”接口。
- 只读取当前权限允许、与任务明显相关的材料。
- 如果找到的会话/记忆线索可能过期，要在总结中标注“不一定最新”。
- 不读取密钥、token（令牌）、账号隐私或明显无关内容。

### 4. 生成初始理解

在任务专用目录写：

```text
00-alignment/initial-understanding.md
```

内容必须包括：

- 我理解的目标。
- 目标项目/目标文件夹是什么。
- 已读材料清单。
- 当前上下文摘要。
- 我推断出的 Done（完成）标准。
- 我建议的验证方式。
- 我建议使用的母模板。
- 我认为需要人补充的信息。
- 我看到的风险和边界。

### 5. 向人对齐

AI 必须把 `initial-understanding.md` 摘要给人，并请人补充：

- 最终目标。
- 优先级。
- 不允许做的事。
- 可以自动执行的事。
- 必须问人的事。
- 测试、实验或评价标准。
- 期望输出格式。

人回复后写入：

```text
00-alignment/user-confirmation.md
```

### 6. 特化任务 Loop

AI 根据母模板复制或生成任务目录，然后把以下文件改成任务专用：

- `loop.md`
- `README.md`
- `修改记录.md`
- `01-state/loop-state.md`
- `01-state/decisions.md`
- `01-state/open-questions.md`
- 目标文件，例如 `10-target/target.md` 或 `12-target/target.md`
- 上下文包，例如 `02-context-pack/context-pack.md` 或 `04-context-pack/context-pack.md`
- 评价文件，例如 `05-evaluation/evaluation.md` 或 `07-evaluation/evaluation.md`
- 返回人工规则。
- Tester（测试者）配置或角色文档。

特化原则：

- 保留母模板的骨架。
- 删除明显不适用的示例文字。
- 把目标、约束、验证、停止条件和人机分工写具体。
- 不要为了显得自动化而增加重脚本。
- 复杂判断默认返回人。

### 6.1 初始化任务 Loop 本地 git

任务专用 Loop 生成后，AI 必须在任务 Loop 根目录执行本地 git 初始化：

```bash
git init
git add .
git commit -m "Initial task loop"
```

如果环境不允许提交，必须在 `修改记录.md` 中写清原因和当前 `git status`。

注意：

- 这里初始化的是任务 Loop 自己的 git，不是目标项目 git。
- 不自动推送远端。
- 不自动回滚目标项目。
- 不把目标项目源码大量复制进任务 Loop。
- 如果任务 Loop 放在已有目标项目 git 内，应在目标项目规则允许的前提下处理；不确定时先问人。

### 7. 最终对齐

跑 Loop 前写：

```text
00-alignment/final-alignment.md
```

内容包括：

- 本次任务专用 Loop 会怎么跑。
- 每轮读哪些文件。
- 每轮会更新哪些记录。
- Done（完成）和停止条件。
- 哪些动作 AI 可以自己做。
- 哪些动作必须问人。
- 第一轮建议提示词。

然后再问人确认是否开始第 1 轮。

## 输出约定

初始化完成后给人的报告：

```text
初始化结论：
任务目录：
任务 Loop git：
我读了什么：
我理解的目标：
我建议的模板：
验证方式：
需要你确认：
下一步：
```

## 与 myloop skill 的关系

`$HOME/Desktop/myskill/myloop/SKILL.md` 只负责稳定启动和读取本目录。

不要把本文件内容复制进 skill（技能）。以后升级初始化方法，直接改本文件。

## 白话总结

先让 AI 读项目、写一份“我怎么理解你这个任务”，再让人改正，最后生成一个只服务这个任务的小 Loop。这样既相信 AI，也不会让 AI 一上来就跑偏。
