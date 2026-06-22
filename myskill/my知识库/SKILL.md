---
name: my知识库
description: Use when the user says /my知识库, $my知识库, my知识库, 沉淀经验, 更新本地知识库, or asks to capture the current solved task into their local private wiki at $HOME/Desktop/my知识库.
---

# my知识库

This skill is a thin entrypoint for the user's local private LLM Wiki（大语言模型维基）.
Do not duplicate the knowledge-base workflow inside this skill. Always read the latest rules from the knowledge-base folder at runtime.

## Stable Location

- Knowledge base root: `$HOME/Desktop/my知识库`
- Required entry rules: `$HOME/Desktop/my知识库/AGENTS.md`

If the root folder or `AGENTS.md` is missing, stop and tell the user what is missing.

## Runtime Workflow

1. Read `$HOME/Desktop/my知识库/AGENTS.md` first.
2. Follow the current read order and maintenance rules from that file.
3. Use the current conversation as the source material when the user wants to capture the just-finished task.
4. Decide from the knowledge-base rules whether to create a new Markdown page or update an existing one.
5. Prefer updating existing relevant wiki pages over creating duplicates.
6. Update required indexes and logs only as required by the current knowledge-base rules.
7. Keep the final report concise and include changed file paths.

## Human Interaction Boundaries

Ask the user before:

- changing the knowledge-base directory structure
- deleting, moving, or renaming existing knowledge-base files
- adding or changing core maintenance rules
- choosing between multiple plausible categories when the tradeoff matters
- writing sensitive details such as tokens, keys, passwords, full private URLs, account identifiers, machine addresses, or SSH secrets

If the current conversation does not contain enough context to produce a useful durable note, ask for the missing context instead of writing a weak page.

## Writing Style

Follow the writing style, templates, sensitivity policy, and index rules from the knowledge base itself. Do not let this skill override newer rules in `$HOME/Desktop/my知识库`.
