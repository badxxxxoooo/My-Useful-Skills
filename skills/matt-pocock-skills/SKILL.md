---
name: matt-pocock-skills
description: Matt Pocock skill collection wrapper for skills that cannot be installed as top-level Codex skills because their names conflict with existing installed skills. Use when the user specifically asks for Matt Pocock's qa or review skill content, or wants to inspect the Matt Pocock skill collection.
---

# Matt Pocock Skills Collection

This collection preserves Matt Pocock skills that could not be installed as top-level Codex skills because their names conflict with existing installed skills.

Included bundled skills:

- `mattpocock-conflicting-skills/qa/` from `mattpocock/skills:skills/deprecated/qa`
- `mattpocock-conflicting-skills/review/` from `mattpocock/skills:skills/in-progress/review`

When the user asks for Matt Pocock's version of `qa` or `review`, read the corresponding nested `SKILL.md` and follow that workflow. The existing top-level `qa` and `review` skills are from Gstack and were left untouched.
