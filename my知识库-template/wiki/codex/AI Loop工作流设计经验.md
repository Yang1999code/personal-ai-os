---
title: AI Loop 工作流设计经验
category: codex
type: wiki
updated_at: 2026-06-11
source_refs:
  - $HOME/Desktop/myloop
  - $HOME/Desktop/myloop/task-initializer.md
  - $HOME/Desktop/myloop/00-change-log/change-log.md
  - $HOME/Desktop/myloop/ai-loop-mini
  - $HOME/Desktop/myloop/ai-loop-mini2
  - $HOME/Desktop/myloop/ai-loop-mini3
  - https://git-scm.com/book/en/v2/Git-Tools-Submodules
sensitivity: private
status: active
---

# AI Loop 工作流设计经验

## 适用场景

适用于想把 Codex（代码智能体）、Claude Code（代码智能体）或其他 AI（人工智能）的使用方式沉淀成可复用 Loop（循环）工作流时。

这个经验尤其适合：

- 想减少手动提示词反复输入。
- 想让 AI 每轮都读取目标、上下文、状态和评价。
- 想保留 AI 自主发挥，但又不想让它无限自动跑。
- 想把 maker-checker（生产者-检查者）模式、显式记忆和测试评价写成文件夹结构。

## 快速结论

这次形成了三个版本：

1. 昨天第一版：`ai-loop-mini`
   - 定位：轻脚手架、信任优先的文档驱动 Loop（循环）。
   - 核心：`loop.md` 当总导演，目标、状态、验证、Tester（测试者）和输出都落盘。
   - 适合：AI 自主工作台、周期性优化、目标地址巡检。

2. 今天第二版：`ai-loop-mini2`
   - 定位：human-guided deep loop（人引导的深度循环）。
   - 核心：人掌舵，AI 深挖，少交互，上下文尽量全，最多三轮，复杂就问。
   - 适合：模仿“会用 AI 的人”进行高质量深度探索。

3. 第三版：`ai-loop-mini3`
   - 定位：while-driven deep loop（while 脚本驱动的深度循环）。
   - 核心：在第二版外增加 `run-loop.sh`、`03-exchange/`、`tmp + rename` 和 `locks/`。
   - 适合：尝试 Claude/Codex 多终端协作，同时保留人类判断权。

4. 当前根目录治理层：`$HOME/Desktop/myloop`
   - 定位：三个模板的总入口和 source of truth（真实来源）。
   - 核心：`README.md` 讲模板选择，`task-initializer.md` 讲任务特化初始化，`00-change-log/change-log.md` 记录每次修改。
   - 适合：让现有 `myloop` skill（技能）不用升级，也能读取最新 Loop 规则。

最终判断：

- 不一定要追求全自动。
- Loop（循环）的目的不是代替人思考，而是防止人忘步骤、丢上下文、漏测试和漏复盘。
- 简单问题 AI 可以继续推进；复杂判断应该返回给人。

## 昨天第一版：ai-loop-mini

### 核心想法

第一版的目标是搭一个文档驱动的 AI 工作台：

```text
人给目标
AI 读 loop.md
AI 读状态和目标地址
Maker 生产者推进
Tester 测试者评价
AI 写记录
AI 判断继续、停止或问人
```

它强调“相信 AI”，所以没有一开始就加重脚本或强自动化，而是用 Markdown（Markdown 文档）把流程、状态、目标和边界写清楚。

### 主要结构

位置：

```text
$HOME/Desktop/myloop/ai-loop-mini
```

关键文件：

- `loop.md`：主流程，总导演。
- `01-state/loop-state.md`：当前目标、轮次、运行模式。
- `09-target/target.md`：要优化的目标地址或对象。
- `09-target/verification.md`：目标级验证方式，由 AI 根据任务生成。
- `08-agents/`：Maker（生产者）和 Tester（测试者）角色模板。
- `06-boundaries/boundaries-and-stop.md`：少量硬边界。
- `00-human-docs/loop-architecture.pdf`：给人看的架构图。

### 关键设计

第一版后来加入了三种运行模式：

- 自由模式：AI 自主判断继续、停止和下一步。
- 协作模式：AI 每轮建议继续/停止，人确认。
- 自动模式：按最大轮次、Done（完成）条件和停止条件推进。

也加入了目标级验证：

```text
硬验证：测试命令、lint（代码检查）、文件是否存在、diff（差异）检查。
软验证：AI 基于证据判断是否足够好、是否覆盖关键问题。
```

### 第一版的经验

第一版适合做“AI 自主工作台”。它的问题不一定是问题：

- 没有脚本控制轮次，不一定是问题，因为目标是相信 AI。
- Done（完成）条件偏文字化，不一定是问题，因为很多探索型任务本来就需要软判断。
- 验证不一开始写死，也不一定是问题，可以让 AI 根据目标自己生成。

比较重要的是：这些要做成可选能力，而不是硬限制。

## 今天第二版：ai-loop-mini2

### 核心想法

第二版来自新的思考：

```text
给 AI 的交互次数尽量少。
每一轮 AI 思考时间尽量长。
上下文尽量全。
模仿一次信息量充足的高质量人工对话。
最多三轮。
复杂问题返回给人。
Loop 的目的不是代替人思考，而是防止忘步骤。
```

所以第二版不是全自动 Loop（循环），而是 human-guided deep loop（人引导的深度循环）。

### 主要结构

位置：

```text
$HOME/Desktop/myloop/ai-loop-mini2
```

关键文件：

- `loop.md`：主流程，定义人引导深度循环。
- `02-context-pack/context-pack.md`：上下文包，尽量一次给全。
- `10-target/target.md`：目标、目标地址、Done（完成）判断、复杂度。
- `05-evaluation/evaluation.md`：每轮测试和评价。
- `04-reflection/reflection.md`：没有质的提升时反思原因。
- `07-boundaries/handoff-rules.md`：什么时候返回给人。
- `09-agents/deep-explorer-agent.md`：Deep Explorer（深度探索者）角色模板。
- `09-agents/tester-agent.md`：Tester（测试者）角色模板。
- `11-prompts/first-run-prompt.md`：第一次试跑提示词。
- `00-human-docs/deep-loop-architecture.pdf`：给人看的架构图。

### 三轮策略

第二版默认最多三轮：

1. 第 1 轮：建模和深度探索。
2. 第 2 轮：深入解决或验证。
3. 第 3 轮：收敛和交付。

如果一轮已经完成，可以提前停。

如果一轮没有质的提升，先反思，不盲目继续。

### 什么时候 AI 自己推进

AI 可以自己推进的情况：

- 目标清楚。
- 动作低风险。
- 不涉及外部副作用。
- 有足够证据或可以低成本验证。
- 只是整理、分析、文档、局部修复、测试建议。

### 什么时候返回给人

应该返回给人的情况：

- 需要业务判断或价值取舍。
- 需要删除、覆盖、部署、提交、安装依赖。
- 需要访问账号、密钥、token（令牌）或真实外部系统。
- 多条路线都可行，但风险和成本不同。
- 连续一轮没有明显推进。
- 目标或 Done（完成）判断不清楚。

返回给人不是失败，而是 Loop（循环）的正常能力。

## 标准流程

推荐使用第二版时按这个顺序：

1. 在 `10-target/target.md` 写清目标、目标地址、Done（完成）判断和复杂度。
2. 在 `02-context-pack/context-pack.md` 放背景、已知材料、当前状态、约束和偏好。
3. 让 AI 读取 `loop.md` 跑第 1 轮。
4. AI 完成一轮深度探索，更新状态、历史、评价和输出。
5. 如果有质的提升，人判断是否继续第 2 轮。
6. 如果没有质的提升，AI 先写 `04-reflection/reflection.md`，判断是否需要搜索、补上下文、测试或返回人。
7. 最多三轮后收敛为结论、风险、未解问题和下一步建议。

## 第三版：ai-loop-mini3

### 核心想法

第三版不是推翻第二版，而是在第二版的人引导深度循环外面加一个很薄的执行壳：

```text
终端 A 运行 while 脚本
脚本写入 round request
终端 B/C 的 Claude 或 Codex 读取 request
AI 写回完整 Markdown
脚本读取 status 字段
脚本决定继续、停止或返回人
```

它的重点不是让脚本替 AI 思考，而是让脚本承担轮次控制、文件交换和状态检查。

### 主要结构

位置：

```text
$HOME/Desktop/myloop/ai-loop-mini3
```

关键文件：

- `02-runtime/run-loop.sh`：while 脚本，负责最多轮次、生成 request、读取 status。
- `02-runtime/lock-protocol.md`：锁和原子写入规则。
- `03-exchange/`：多终端、多 Agent（智能体）的文件交换区。
- `03-exchange/inbox/`：脚本写给 AI 的 request。
- `03-exchange/outbox/`：Claude/Codex 写回给脚本的结果。
- `03-exchange/tmp/`：临时写入目录。
- `03-exchange/locks/`：锁文件目录，避免半写半读。

### 第三版的经验

- Markdown（Markdown 文档）适合作为策略层和说明书。
- while 脚本适合作为很薄的执行层。
- 多终端可以用文件交换，但必须处理“写了一半被读”的问题。
- `tmp + rename` 比直接写目标文件稳。
- lock（锁）可以处理异常写入或长期占用。
- status 字段必须稳定，例如 `continue`、`done`、`needs-human`、`failed`。
- 复杂判断仍然返回给人，不能因为有脚本就强行自动化。

## 当前根目录治理层

### 核心想法

`$HOME/Desktop/myloop` 现在不只是装三个模板的文件夹，它还承担治理层职责：

```text
myloop 根目录
  README.md：告诉人和 AI 该选哪个模板
  task-initializer.md：把母模板特化成任务专用 Loop
  00-change-log/change-log.md：记录每次修改的前后、原因、隐患和 git 提交
  ai-loop-mini*：三个独立模板，每个模板有自己的本地 git
```

这解决两个问题：

- 不改 `$HOME/Desktop/myskill/myloop/SKILL.md`，skill 仍按老路径读取 `ai-loop-mini2/loop.md`。
- 新流程不写死在 skill 里，而是写在 `$HOME/Desktop/myloop`，后续升级只改模板和说明。

### 任务特化初始化

以后真实任务不建议直接写进母模板，而是在目标项目下面创建任务专用 Loop：

```text
目标项目/
  .project-loops/
    任务名/
      00-alignment/
        initial-understanding.md
        user-confirmation.md
        final-alignment.md
      ...
```

推荐流程：

1. AI 先读目标项目的 README、AGENTS、docs、记录、测试、配置和 git 状态。
2. AI 尝试读取当前工具可访问的会话/记忆线索，但不假设 Codex/Claude Code 一定有稳定窗口历史接口。
3. AI 写 `initial-understanding.md`，把自己的任务理解给人看。
4. 人补充目标、限制、测试、实验和偏好。
5. AI 特化 Loop，并写 `final-alignment.md`。
6. 人确认后再开始第 1 轮。

这个设计保留了“相信 AI”，但增加了一次显式对齐，避免 AI 一上来就按错目标跑。

当前三个母模板也都预留了 `00-alignment/` 占位目录，用来说明初始化阶段会生成哪些材料；真实长期任务仍然建议把这些文件放到目标项目的任务专用 Loop 中。

### git 版本管理

当前采用两层 git（版本控制）：

- 根目录 git：只追踪治理文档、任务初始化协议和变更日志。
- 模板 git：每个模板自己追踪内部变化。

这样设计是为了避免嵌套仓库混乱。Git 官方 submodule（子模块）文档说明，submodule 会让父仓库记录子仓库某个提交，而不是普通追踪子目录文件。因此这里不把三个模板目录放进根仓库追踪，根仓库用 `.gitignore` 忽略它们。

### 变更日志要求

以后每次改 Loop，至少要记录：

- 改了哪里。
- 改前是什么。
- 改后是什么。
- 为什么改。
- 有什么隐患。
- 怎么验证。
- 对应 git commit（提交）。
- 是否影响 `myloop` skill 的稳定入口。

## 常见问题

| 问题 | 判断方式 | 处理办法 |
| --- | --- | --- |
| 这个算 Loop 吗？ | 是否有目标、状态、评价、记录和下一轮判断 | 算文档驱动 Loop（循环），但不是强自动化 Loop |
| 没有脚本控制是不是问题？ | 看目标是全自动还是人机协作 | 人引导型 Loop 不一定需要脚本，脚本可以作为后续增强 |
| Done 条件文字化是不是问题？ | 看任务能否机器验证 | 探索型任务可以软 Done，但要留下证据 |
| Tester 是否要每轮生成？ | 看是否需要稳定评价口径 | 推荐初始化一次固定 Tester（测试者），后面复用 |
| AI 问人是不是失败？ | 是否涉及复杂判断或风险动作 | 不是失败，是正常 handoff（交接） |

## 排查清单

- [ ] 是否有明确目标？
- [ ] 是否有足够上下文包？
- [ ] 是否写了 Done（完成）判断？
- [ ] 是否区分简单任务和复杂判断？
- [ ] 是否每轮有评价和证据？
- [ ] 是否记录了历史和状态？
- [ ] 是否没有质变时先反思？
- [ ] 是否最多三轮内收敛？
- [ ] 是否复杂处返回给人？

## 相关来源

- `$HOME/Desktop/myloop/ai-loop-mini`
- `$HOME/Desktop/myloop/ai-loop-mini2`
- `$HOME/Desktop/myloop/ai-loop-mini3`
- `$HOME/Desktop/myloop/task-initializer.md`
- `$HOME/Desktop/myloop/00-change-log/change-log.md`
- Git 官方 submodule（子模块）文档：https://git-scm.com/book/en/v2/Git-Tools-Submodules

## 后续可改进

- 把 `ai-loop-mini2` 中的 Tester（测试者）正式转成 Codex 的 `.codex/agents/tester.toml`。
- 真实试跑 `ai-loop-mini3` 的 `run-loop.sh`，观察多终端文件交换是否顺手。
- 真实跑一次小任务，观察记录质量和反思质量。
- 对比 Codex（代码智能体）和 Claude Code（代码智能体）在同一 Loop（循环）结构下的表现。
- 真实试跑一次 `task-initializer.md`，观察 AI 生成的初始理解是否足够准确。
- 真实任务中比较母模板占位 `00-alignment/` 和项目内 `.project-loops/<任务名>/00-alignment/` 的使用体验。

## 白话总结

第一版是“AI 自主工作台”，第二版是“会用 AI 的人的操作流程”，第三版是在第二版外面加了一个很薄的 while 执行壳。核心不是全自动，而是让 AI 使用过程更稳、更可追踪、更不容易忘步骤；需要自动节奏时交给脚本，需要思考和判断时仍交给 AI 和人。
