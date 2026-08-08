---
name: context7
description: >-
  Provides up-to-date, version-specific library and framework documentation using Upstash Context7 CLI (`npx ctx7`).
  Use when fetching official docs, API references, or code snippets for third-party libraries (e.g. React, Remotion, Supabase, Flutter, Next.js, Tailwind, etc.).
---

# Context7 Documentation Fetcher

Context7 by Upstash provides real-time, version-accurate documentation and code examples directly from official library sources to ensure accurate code recommendations.

## Usage Workflows

### 1. Resolving a Library Name to Library ID
To find the exact Context7 library ID for a given framework or package:
```bash
npx ctx7 library <package-or-framework-name> "<optional context query>"
```

*Example:*
```bash
npx ctx7 library react "hooks useEffect"
npx ctx7 library remotion "player drag and drop"
```

### 2. Fetching Documentation & Snippets
Once you have the library ID (e.g. `/reactjs/react.dev` or `/remotion-dev/remotion`):
```bash
npx ctx7 docs "<libraryId>" "<question or query>"
```

*Example:*
```bash
npx ctx7 docs "/reactjs/react.dev" "useCallback syntax and examples"
```

## Guidelines for Agents
- Whenever working with unfamiliar or newly updated third-party APIs, run `npx ctx7 library <name>` followed by `npx ctx7 docs` to get accurate context.
- Use `npx ctx7` over guessing method signatures or relying on stale training data.
