---
name: skill-check
description: Use when the user says /skill-check, skill 自检, 检查 skill 是否触发, 检查 Claude Code skill 安装, or wants to verify local skill links, entry files, and trigger readiness without changing business files.
---

# skill-check

This skill is a thin self-check entrypoint for local skills.
Do not duplicate the full setup docs inside this skill. Read the current local skill folders and skill links at runtime.

## Stable Locations

- Skill source root: `$HOME/Desktop/myskill`
- Claude Code skill install root: `$HOME/.claude/skills`
- Codex skill install root: `$HOME/.codex/skills`

If the source root is missing, stop and report what is missing.

## Runtime Workflow

1. Inspect `$HOME/Desktop/myskill`.
2. Inspect `$HOME/.claude/skills` when Claude Code skill installation is relevant.
3. Inspect `$HOME/.codex/skills` when Codex skill installation is relevant.
4. Verify, at minimum:
   - the requested skill directory exists in `myskill`
   - the install-side entry is present when expected
   - soft links point to the expected source directory when symlink mode is used
   - `SKILL.md` exists on both the source side and resolved install side
   - optional `agents/openai.yaml` exists when the source skill already uses that metadata pattern
5. Default check scope is `my知识库` and `myloop`. If the user names another skill, include it too.
6. Report a concise pass/fail matrix and the first fixing action for each failure.
7. Stay read-only unless the user explicitly asks to install, relink, or repair a skill.

## Human Interaction Boundaries

Ask the user before:

- creating, deleting, moving, or renaming skill folders
- changing symlinks under `~/.claude/skills` or `~/.codex/skills`
- editing `SKILL.md`, `agents/openai.yaml`, or setup docs
- adding new aliases or new install locations

## Output Contract

Return a short result with:

- checked skills
- pass/fail per check
- exact broken path if any
- one recommended next action

## Design Rule

This skill is for diagnosis only. Source-of-truth behavior stays in `$HOME/Desktop/myskill` and the setup docs, not in this file.
