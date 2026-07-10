---
name: skillopt-sleep
description: "Use when the user wants the agent to self-improve from past usage, asks about a nightly/offline 'sleep' or 'dream' cycle, wants to review past sessions, learn preferences, consolidate memory/skills, run dry-run/run/adopt/status for SkillOpt-Sleep, or schedule offline self-optimization. Drives the skillopt_sleep engine: harvest past sessions -> mine recurring tasks -> replay offline -> consolidate validated memory + skills behind a held-out gate."
---

# SkillOpt-Sleep: offline self-evolution for a local Antigravity agent

SkillOpt-Sleep gives the agent a sleep cycle. While the user is offline or on demand, it reviews past local sessions, re-runs recurring tasks on the user's own budget, and consolidates what it learns into memory and skills. It keeps only changes that pass a held-out validation gate, and live files change only after the user explicitly adopts a staged proposal. There is no model-weight training.

## When to use

Trigger when the user wants any of:
- The agent to learn from past sessions or get better the more they use it;
- A nightly/scheduled or on-demand sleep/dream/offline self-improvement run;
- To review past sessions and distill recurring tasks;
- To consolidate feedback into memory or managed skills;
- To run `status`, `harvest`, `dry-run`, `run`, or `adopt` for SkillOpt-Sleep.

## The cycle

1. **Harvest** - read local session transcripts according to the engine configuration and normalize them into session digests.
2. **Mine** - turn digests into recurring `TaskRecord`s with outcomes and checkable references where possible.
3. **Replay** - re-run mined tasks offline under the current skill and memory.
4. **Consolidate** - reflect on failures and propose bounded edits.
5. **Gate** - accept edits only when the held-out validation score improves.
6. **Stage** - write the proposal under `<project>/.skillopt-sleep/staging/<date>/`; nothing live changes.
7. **Adopt** - only after explicit user approval, copy staged files over live files with backups.

## How to drive it

Invoke the bundled runner via shell. The runner finds the engine and a Python >= 3.10 automatically.

```bash
# point at the repo if it isn't auto-detected from CWD:
export SKILLOPT_SLEEP_REPO=C:/Sagar/Projects/CBSE/byAntiGravity/skillopt_framework
python -m skillopt_sleep status --project "C:/Sagar/Projects/CBSE/byAntiGravity"
python -m skillopt_sleep harvest --project "C:/Sagar/Projects/CBSE/byAntiGravity"
python -m skillopt_sleep dry-run --project "C:/Sagar/Projects/CBSE/byAntiGravity" --backend mock
python -m skillopt_sleep run --project "C:/Sagar/Projects/CBSE/byAntiGravity" --backend claude
python -m skillopt_sleep adopt --project "C:/Sagar/Projects/CBSE/byAntiGravity"
```

Actions are `status`, `harvest`, `dry-run`, `run`, `adopt`, `schedule`, and `unschedule`.

- Default backend is `mock`, which is deterministic and spends no API budget.
- `--backend claude` uses your Claude budget for real improvement.
- Keep `dry-run --backend mock` as the first smoke check unless the user explicitly asked for a real optimization run.

### Scheduling

```bash
python -m skillopt_sleep schedule --project "C:/Sagar/Projects/CBSE/byAntiGravity" --hour 3 --minute 17
python -m skillopt_sleep unschedule --project "C:/Sagar/Projects/CBSE/byAntiGravity"
```

Installs a nightly cron entry. `unschedule --all` removes every managed entry.

### All backends

- `--backend mock` — deterministic, no API spend (default)
- `--backend claude` — uses the Claude API (or Gemini API)

### Additional flags

| Flag | Description |
|------|-------------|
| `--auto-adopt` | Auto-adopt if the gate passes (default: stage only) |
| `--edit-budget N` | Max bounded edits per night (default: 4) |
| `--lookback-hours N` | Harvest window in hours (default: 72) |
| `--json` | Machine-readable JSON output |

### Config keys (`~/.skillopt-sleep/config.json`)

- **`preferences`** — free-text house rules for the optimizer
- **`gate_mode`** — `on` (validation-gated, default) or `off` (greedy)
- **`gate_metric`** — `hard` | `soft` | `mixed` (default)
- **`dream_rollouts`** — >1 for multi-rollout contrastive reflection
- **`recall_k`** — >0 recalls similar past tasks from the archive

### Memory consolidation

The sleep cycle consolidates both **memory** (GEMINI.md / UNDERSTAND.md) and **skills** (SKILL.md) by default. Each is independently toggleable via `evolve_memory` / `evolve_skill` config keys. Both are gated by the same held-out validation score.

## Steps

1. Run the requested action; capture stdout.
2. For `dry-run` and `run`, report the held-out baseline -> candidate score, gate action, task count, session count, and exact proposed edits.
3. If a staging directory is printed, read `report.md` before summarizing.
4. `run` only stages a proposal; nothing live changes until `adopt`.
5. Offer adoption only after the user has reviewed the staged proposal.
6. Never hand-edit the user's memory or skills as a substitute for `adopt`; adoption is the safety boundary and writes backups first.

## Hard rules

- Harvest is read-only. Do not edit archived sessions or raw transcripts.
- Keep raw secrets, credentials, private user data, and unsanitized transcript contents out of messages, logs, generated artifacts, and commits.
- Show validation evidence before recommending adoption.
- Treat generated edits as proposals, not as source of truth.
