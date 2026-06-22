# CLAUDE.md

This repository is a Personal AI OS（个人 AI 操作系统）template.

## Response Style

- Prefer Chinese.
- Add Chinese explanations after English technical terms, for example skill（技能）, loop（循环）, memory（记忆）, wiki（维基）.
- Use plain language, examples, and Mermaid（流程图）for complex concepts.
- End responses with “白话总结”.

## Repository Model

- `myskill/` is the skill（技能）entry layer.
- `myloop/` is the loop（循环）workflow layer.
- `my知识库-template/` is the Markdown（文档）/ wiki（维基）knowledge-base skeleton.

## Read Order

When working in this repo:

1. Read `README.md`.
2. Read `AGENTS.md`.
3. Read the relevant layer entry file.
4. Read user-specified files.

Do not scan everything first. Use indexes and entry files.

## Safety

Do not commit secrets, tokens, passwords, private keys, internal URLs, machine addresses, account identifiers, raw sessions, or private memory files.

Ask before deleting, moving, renaming, overwriting existing local folders, publishing, or pushing remote changes unless the user explicitly requested it.

## Layer Routing

- Stable entry command -> `myskill/`.
- Complex repeatable workflow -> `myloop/`.
- Reusable experience or troubleshooting knowledge -> `my知识库-template/` or the user's real `my知识库`.
- Stable personal preference -> `AGENTS.md`, `CLAUDE.md`, or `snippets/`.

## 白话总结

Treat this repo as a reusable AI operating-system skeleton: skill calls the ability, loop drives hard work, wiki remembers what was learned.
