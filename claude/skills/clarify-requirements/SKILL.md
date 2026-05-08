---
name: clarify-requirements
description: Use when starting a project, feature, or ambiguous task where requirements might be unclear, underspecified, or assumed rather than stated
---

# Clarify Requirements First

## Overview

Before you plan or build, have Claude interview you. It surfaces what you actually want rather than what you asked for.

## The Prompt

Run this before any planning session, `/office-hours`, or new project kickoff:

```
Interview me until you have 95% confidence about what I actually want, not what I think I should want.
```

Answer Claude's questions until it can write a clear spec from your answers.

## When to Use

- Starting a new project or feature
- Before running `/office-hours` or `/ce:plan`
- When the request feels vague or you're not sure what "done" looks like
- When you catch yourself making assumptions about scope

## When to Skip

- Task is already fully specified with clear acceptance criteria
- You're executing a step inside an existing plan
