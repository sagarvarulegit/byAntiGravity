---
type: Plan
title: Integration Plan — SkillOpt for CBSE Class 10 Learning Portal
description: This plan outlines the installation, integration, and execution of Microsoft's SkillOpt self-improvement loop for the Antigravity agent workspace.
tags: [plan, skillopt]
timestamp: 2026-07-10T14:43:00Z
---
# Integration Plan — SkillOpt for CBSE Class 10 Learning Portal

We integrated the **SkillOpt** framework (Microsoft Research) into our CBSE Class 10 Online Learning Portal workspace to allow the AI agent's instruction files (e.g., `GEMINI.md`, `.agents/skills/**/*.md`) to evolve and optimize automatically based on session logs and task performance.

---

## 1. Objectives

- **Clone & Install**: Clone the `microsoft/SkillOpt` repository into `skillopt_framework/` and install it in editable mode.
- **Register Agent Skill**: Implement a custom Codex-style skill `skillopt-sleep` under `.agents/skills/skillopt-sleep/SKILL.md` to register the capability for the Antigravity agent.
- **Transcripts Harvester**: Add a custom script `scripts/harvest_antigravity.py` to parse Antigravity's JSONL transcripts into standard SkillOpt `TaskRecord` lists.
- **Provide Run Guides**: Outline clear commands to run status checks, dry-runs, and live optimizations.

---

## 2. Components Created

### A. Custom Harvester: `scripts/harvest_antigravity.py`
This script parses the local Antigravity transcript (`transcript.jsonl` located in the agent's app data directory under `brain/<conv-id>/.system_generated/logs/`), detects user feedback patterns, extracts user intents and agent responses, and formats them into a `tasks_file` payload (`skillopt_sleep.tasks.v1`) for the SkillOpt replay loop.

### B. Registered Skill: `.agents/skills/skillopt-sleep/SKILL.md`
Equips the Antigravity agent with knowledge on:
- When to trigger a sleep/dream cycle.
- How to drive the command-line commands for dry-run/adopt/status.
- Rules for offline consolidation.

---

## 3. Workflow & Usage

### Step 1: Mined Tasks Extraction (Harvest)
Run the harvester on the current conversation log to extract tasks:
```bash
python scripts/harvest_antigravity.py "C:\Users\sunwa\.gemini\antigravity-cli\brain\<conversation-id>\.system_generated\logs\transcript.jsonl" "scratch/antigravity_tasks.json"
```

### Step 2: Dry Run Check
Perform a dry-run of the optimization cycle using a free mock backend to verify the pipeline:
```bash
python -m skillopt_sleep dry-run --tasks-file scratch/antigravity_tasks.json --backend mock --progress
```

### Step 3: Run Live Optimization
To run a real optimization cycle (requires API key credentials, e.g., OpenAI or Anthropic):
```bash
python -m skillopt_sleep run --tasks-file scratch/antigravity_tasks.json --backend claude --progress
```

### Step 4: Adopt Staged Proposals
Review the staged changes under `.skillopt-sleep/staging/<date>/`, then apply them:
```bash
python -m skillopt_sleep adopt --project "C:\Sagar\Projects\CBSE\byAntiGravity"
```

---

## 4. Verification Plan

1. **Deterministic Mock Test**: Running `python -m skillopt_sleep.experiments.run_experiment --persona researcher --assert-improves` completes successfully.
2. **Harvester Verification**: Running the parser script outputs a valid `tasks` payload in `scratch/antigravity_tasks.json`.
3. **Dry-Run verification**: Running the `skillopt_sleep` CLI with mock backend validates the gate checks and outputs the consolidation report.
