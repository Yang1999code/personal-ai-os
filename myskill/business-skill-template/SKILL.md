---
name: business-skill-template
description: Use this as a template when creating a local skill for a specific business tool, desktop app, internal service, robot, or verification workflow. Do not commit real business secrets or private endpoints.
---

# business-skill-template

This is a reusable template for a specific business skill（业务技能）.

Use it when a task needs a stable entrypoint for one business tool, app, robot, service, or verification chain.

## Core Rule

Do not store secrets in this skill.

Never commit:

- token（令牌）
- key（密钥）
- password（密码）
- private key（私钥）
- full internal URL（完整内网地址）
- real account identifiers（真实账号标识）
- SSH secrets（SSH 机密）

## Stable Locations

Replace these placeholders with local paths when installing privately:

- Business project root: `$HOME/path/to/project`
- Tool config: `$HOME/path/to/config`
- Log path: `$HOME/path/to/log`
- Knowledge base entry: `$HOME/Desktop/my知识库`

## Trigger Examples

- 用户说“验证业务机器人链路”
- 用户说“操作某个桌面工具发一条测试消息”
- 用户说“检查某个 bridge/Webhook/API 链路”
- 用户说“模拟真实用户操作并验证日志”

## Runtime Workflow

1. Read the business project rule file first, such as `AGENTS.md`, `CLAUDE.md`, or `README.md`.
2. Confirm the target environment, target group, app, service, or log file.
3. Prefer read-only checks first.
4. If UI operation is required, inspect the current UI state before clicking or typing.
5. If a message or event must be sent, clearly separate:
   - what the Agent sent
   - what the user sent manually
   - what the backend logs prove
6. Verify success through logs or observable state, not only through UI appearance.
7. Report action taken, evidence, risk, and next step.

## Human Interaction Boundaries

Ask the user before:

- sending real messages to other people
- changing production configuration
- restarting services
- deploying code
- editing credentials
- using privileged accounts
- deleting or overwriting logs
- claiming success without evidence

## Failure Patterns

| Symptom | Likely Cause | Fix |
| --- | --- | --- |
| UI shows sent but backend has no event | UI action did not trigger backend path | Verify logs and retry through the supported route |
| Backend received event but no reply | Service processing failed | Check service log and error stack |
| Agent cannot click reliably | UI focus or accessibility state is stale | Refresh app state, retry once, then ask user to do manual action |
| A command works locally but not in production | Environment mismatch | Compare cwd, env vars, config and service user |

## Output Contract

Return a concise result:

```text
结论：
我做了什么：
证据：
风险：
需要你确认：
下一步：
白话总结：
```

## Design Rule

This file is a template. Private installations may add concrete names, paths and logs locally, but public repositories should keep it generic and secret-free.
