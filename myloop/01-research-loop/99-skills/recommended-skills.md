# Recommended Skills

本 Loop（循环）是查找/需求场景，推荐 skill（技能）的原则是：先用已安装、稳定、与你资料源强相关的；官方 curated（精选）skill 只作为可选增强，不默认安装。

## 核心推荐

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `my知识库` | 已有，本地 skill | 直接查你的本地私有经验库，最贴近你的历史资料和偏好 | 调研开始时，先查 `$HOME/Desktop/my知识库` |
| `internal-knowledge-skill` | 已有，本地 skill | 能读内部 KU 文档，适合内部规范、方案、流程 | 用户给 KU 链接，或任务明显依赖内部资料 |
| `openai-docs` | 系统内置/官方 | 查 OpenAI/Codex/API 官方最新文档，比普通搜索更可靠 | 调研 OpenAI、Codex、模型、API 相关问题 |

## 官方 curated 可选增强

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `define-goal` | 未安装，官方 curated | 适合把模糊目标收敛成可执行目标 | Agent（智能体）任务目标不清、Done（完成）标准不清 |
| `notion-spec-to-implementation` | 未安装，官方 curated | 适合把规格说明转成实现计划 | Agent 项目需求在 Notion（笔记工具）或规格文档里 |
| `notion-research-documentation` | 未安装，官方 curated | 适合把 Notion（笔记工具）里的资料整理成研究文档 | 资料源在 Notion 或需要研究文档化 |
| `notion-knowledge-capture` | 未安装，官方 curated | 适合把调研结果沉淀成知识库条目 | 调研结束后要沉淀到 Notion |
| `pdf` | 未安装，官方 curated | 适合读取和处理 PDF（便携式文档格式）资料 | 需求资料、规范、报告是 PDF |
| `screenshot` | 未安装，官方 curated | 适合把网页/界面截图作为证据 | 调研网页、产品页面、界面状态 |
| `transcribe` | 未安装，官方 curated | 适合把音视频资料转文字 | 需求来自会议录音、访谈、视频 |

## Agent 开发优先组合

如果主要做 Agent（智能体）开发，research 阶段优先看这些：

1. `openai-docs`：查 Agent、API、模型和 Codex 官方资料。
2. `define-goal`：把模糊需求收敛成目标、边界和 Done 标准。
3. `my知识库`：复用你自己的 Agent 开发经验和本地规范。
4. `internal-knowledge-skill`：查内部规范、方案和项目资料。
5. `notion-spec-to-implementation`：如果需求来自 Notion/规格文档，再考虑安装。

## 使用顺序

```text
本地项目资料
-> my知识库
-> internal-knowledge-skill
-> openai-docs / define-goal
-> 可选 curated skill
```

## 注意

- 当前只推荐，不自动安装新 skill。
- 安装 curated skill 前先问人。
- 每次使用外部资料都要写入 `04-evidence/`，标注来源和日期。
