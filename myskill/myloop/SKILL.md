---
name: myloop
description: Use when the user says /myloop, $myloop, myloop, or asks to start a human-guided deep loop workflow from $HOME/Desktop/myloop with a task description and target path.
---

# myloop

This skill is a thin entrypoint for the user's local human-guided deep loop workflow.
Do not duplicate the loop process inside this skill. Always read the latest loop files from the workflow folder at runtime.

## Stable Locations

- Loop root: `$HOME/Desktop/myloop`
- Default template: `$HOME/Desktop/myloop/ai-loop-mini2`
- Required template entry: `$HOME/Desktop/myloop/ai-loop-mini2/loop.md`

If the root folder, default template, or `loop.md` is missing, stop and tell the user what is missing.

## Runtime Workflow

1. Read the current `README.md` and `loop.md` from the selected loop template before acting.
2. Treat the files inside `$HOME/Desktop/myloop` as the source of truth for the workflow.
3. Use the user's prompt after `/myloop` or `$myloop` as the task goal, target address, and constraints.
4. If the user does not provide enough task information, ask for the missing goal or target path before starting.
5. Prefer creating a separate run workspace for each real task instead of modifying the template in place.
6. Follow the current loop rules for state, context, history, evaluation, output, stopping, and asking the user.
7. Keep the final report concise and include the run folder or changed file paths.

## Human Interaction Boundaries

Ask the user before:

- modifying the loop template itself
- deleting, moving, or renaming existing loop files
- installing dependencies
- deploying, publishing, submitting, or making irreversible external changes
- continuing when the loop rules require business judgment or a high-risk decision

If the task requires scheduled continuation, propose a thread heartbeat automation after the first run is created. Do not create an automation unless the user asks for scheduled follow-up.

## Design Rule

This skill is only a stable launcher and guardrail. Future updates should normally happen in `$HOME/Desktop/myloop`, not by copying more workflow detail into this skill.
