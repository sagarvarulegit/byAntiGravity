# CBSE Class 10 Learning Portal — Custom Rules

## General

- Whenever you fix code, append the reusable learning to the nearest applicable
  `AGENTS.md`. Use this root file only for repository-wide learnings.
- **Windows UTF-8 Coding Standard:** Always open text files with
  `encoding="utf-8"` in Python scripts to avoid Windows CP1252 parsing crashes
  on symbols such as `Ω`.

## Scoped Instructions

- Before modifying Flutter UI or parser code under `apps/mobile_web_client/`,
  read `apps/mobile_web_client/AGENTS.md`.
- Before modifying Remotion/video code or scene data under
  `apps/video_generator/`, read `apps/video_generator/AGENTS.md`.
- Before modifying database seeds, curriculum notes, PYQs, or board-exam
  content anywhere in the repository, read `db/AGENTS.md`.
- Before modifying Supabase configuration or local backend behavior, read
  `supabase/AGENTS.md`.

## Graphify Retrieval Contract

- Graphify is the primary index for architecture, dependencies, and codebase
  context. Prefer bounded Graphify queries before source searches.
- Never load all of `graphify-out/graph.json` or the complete
  `graphify-out/GRAPH_REPORT.md` into model context.
- Before architecture analysis, run `graphify check-update .`.
- Use these bounded commands:
  - Broad context: `graphify query "<specific question>" --budget 600`
  - Focused flow: `graphify query "<question>" --dfs --context call --budget 800`
  - Impact analysis: `graphify affected "<symbol>" --depth 2`
  - Relationship trace: `graphify path "<source>" "<target>"`
- Open only the source files and relevant line ranges returned by Graphify.
- If the graph has insufficient evidence, fall back to targeted `rg` searches.
  Read `GRAPH_REPORT.md` only if bounded queries cannot provide the necessary
  overview.
- Base claims on graph evidence. Prefer `EXTRACTED` edges over `INFERRED`
  edges, and label uncertainty when evidence is `AMBIGUOUS`.
- After changes to imports, modules, classes, functions, signatures, or routing,
  run `$graphify . --update --directed`. Copy, styling, media, and data-only
  changes do not require a code-graph rebuild.
- Do not use the bare `graphify update .` command for this repository with
  Graphify 0.9.30: it rewrites the saved graph as undirected. Always verify
  `graphify-out/graph.json` has `"directed": true` after maintenance.
- After semantic documents or images in the active corpus change, run
  `$graphify . --update`.
- After a significant structural reorganization, rebuild with
  `$graphify . --directed --no-viz`.
- The default graph is architecture-only. Curriculum PDFs are intentionally
  isolated; build their opt-in graph with
  `powershell -File scripts/graphify-content.ps1` and enable the
  `graphify_content` MCP server only for content-research sessions.
