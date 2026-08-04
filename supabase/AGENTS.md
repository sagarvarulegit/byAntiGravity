# Supabase and Local Backend Rules

## Local Development

- If `supabase start` fails to bind ports `54321` or `54322`, or Flutter cannot
  reach local Supabase with `statusCode: null`, ask the user to run
  `net stop winnat; net start winnat` in Administrator PowerShell and restart
  Supabase.
- If startup reports a missing `deno.json` import map for an empty Edge Function
  directory, set `enabled = false` for that function in
  `supabase/config.toml`.

## SQL Seed Safety

- Never put semicolons inside seed SQL string literals; use commas.
- Escape apostrophes by doubling them, such as `doesn''t`.
- For broader seed, Unicode, NCERT, or PYQ work, also read `db/AGENTS.md`.

