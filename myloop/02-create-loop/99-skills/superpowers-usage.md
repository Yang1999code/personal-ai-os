# Superpowers Usage

Superpowers 是可选开发方法参考，不在本 Loop（循环）中默认启用，也不要求全局安装。

## 默认规则

- 不安装 Superpowers 插件。
- 不自动启用 Superpowers 模式。
- 只有用户明确说“启用 Superpowers 模式”或“参考 Superpowers”时才读取本文件。
- 只在 `02-create-loop` 中作为创建/实现阶段的增强方法。
- 不替代 `01-research-loop`、`02-create-loop`、`03-test-loop` 的分层。
- 不影响 `$HOME/Desktop/myskill/myloop/SKILL.md` 的默认入口。

## 什么时候参考

适合：

- 复杂 Agent（智能体）开发。
- 需要 spec（规格）、plan（计划）、TDD（测试驱动开发）的任务。
- 需要拆分多个子任务或并行推进。
- 需要 code review（代码审查）和 root-cause debugging（根因排查）。
- 需要更严格的实现前澄清和实现后验证。

不适合：

- 目标还没查清楚，应先回到 `01-research-loop`。
- 只是轻量改文档、整理说明。
- 已经进入独立验收，应交给 `03-test-loop`。
- 用户没有明确要求启用。

## 使用提示词

```text
这次 02-create-loop 使用 Superpowers 模式作为参考：
先澄清需求，再写 spec，再写 plan，再按 TDD 推进，最后做代码审查和验证。
不要全局启用，不要安装插件，不要替代 myloop 的 research/create/test 分层。
```

## 隔离说明

可靠隔离方式是“文档参考”，不是“插件安装”：

- 文档参考：只在当前任务中读取本文件，隔离性高。
- 全局安装：可能改变 Codex/Claude 的整体开发行为，隔离性低。

## 白话总结

Superpowers 可以当 `02-create-loop` 的可选增强脑法，但不要安装成全局插件；只有你点名时才让 AI 参考。
