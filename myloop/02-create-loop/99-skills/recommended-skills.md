# Recommended Skills

本 Loop（循环）是创建/实现场景，推荐 skill（技能）的原则是：根据项目类型按需选，不要一次全开。

## 核心推荐

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `openai-docs` | 系统内置/官方 | 查 OpenAI/Codex/API 官方最新文档，适合模型和接口项目 | OpenAI API、Codex、Agent（智能体）相关开发 |
| `my知识库` | 已有，本地 skill | 复用你的本地经验、规范、踩坑记录 | 开始实现前看历史做法 |
| `browser:control-in-app-browser` | 插件内置 | 能打开本地页面、检查前端效果 | 做网页、工具、可视化界面 |

## 官方 curated 可选增强

| skill | 状态 | 为什么推荐 | 适合什么时候用 |
| --- | --- | --- | --- |
| `cli-creator` | 未安装，官方 curated | 适合创建命令行工具脚手架 | 要做 CLI（命令行工具） |
| `chatgpt-apps` | 未安装，官方 curated | 适合创建 ChatGPT App（应用） | 要做 ChatGPT 应用 |
| `notion-spec-to-implementation` | 未安装，官方 curated | 适合把规格说明转成实现计划 | Agent 项目有明确规格、需求文档或 Notion 任务 |
| `figma-implement-design` | 未安装，官方 curated | 适合根据 Figma（设计工具）实现前端界面 | 有设计稿要落地 |
| `figma-create-design-system-rules` | 未安装，官方 curated | 适合从设计系统提炼实现规则 | 项目需要统一 UI（用户界面）规范 |
| `playwright` | 未安装，官方 curated | 适合创建后马上做浏览器自动化验证 | 前端/网页项目 |
| `gh-address-comments` | 未安装，官方 curated | 适合处理 GitHub PR（拉取请求）评论 | 项目在 GitHub 上协作 |
| `migrate-to-codex` | 未安装，官方 curated | 适合把旧工作流迁到 Codex | 迁移项目或旧 Agent 流程 |
| `jupyter-notebook` | 未安装，官方 curated | 适合数据分析、实验、Notebook（笔记本）项目 | 数据探索、实验型项目 |

## Agent 开发优先组合

如果主要做 Agent（智能体）开发，create 阶段优先看这些：

1. `openai-docs`：写 OpenAI API、Agent、Codex 相关代码时优先用。
2. `cli-creator`：Agent 经常需要 CLI（命令行工具）入口、调试命令和脚手架。
3. `playwright`：Agent 有网页界面、浏览器自动化或端到端验证时很常用。
4. `jupyter-notebook`：做评测、数据分析、prompt/模型实验时有用。
5. `gh-address-comments`：Agent 项目进入 GitHub PR 协作后，用来处理评审评论。
6. `migrate-to-codex`：把旧 Agent 流程迁移到 Codex 时使用。

## Superpowers 可选参考

`Superpowers` 不默认安装，也不默认启用。

如果用户明确说“启用 Superpowers 模式”，再读取：

```text
02-create-loop/99-skills/superpowers-usage.md
```

它只作为复杂 Agent 开发时的 spec（规格）、plan（计划）、TDD（测试驱动开发）、code review（代码审查）和 root-cause debugging（根因排查）参考，不替代 myloop 的 research/create/test 分层。

## 旧执行引擎

`02-create-loop` 默认复用旧模板：

```text
../ai-loop-mini   # 自由干活
../ai-loop-mini2  # 默认深度干活
../ai-loop-mini3  # while 脚本干活
```

## 注意

- 当前只推荐，不自动安装新 skill。
- 安装 curated skill 前先问人。
- 做完后必须写 `04-handoff-to-test/`，把测试入口交给 `03-test-loop`。
