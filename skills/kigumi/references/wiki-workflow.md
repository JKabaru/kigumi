# Wiki workflow

## Two layers

**`raw/`** — immutable sources. Agent never modifies. Append-only truth.

**`wiki/`** — agent-maintained. Summaries, concepts, findings, cross-references.

```
wiki/
├── index.md      ← table of contents
├── log.md        ← append-only operation log
├── concepts/
├── entities/
├── findings/
└── syntheses/
```

## Query

1. Search `wiki/` first using keywords from the question
2. Answer from wiki — cite the page
3. If wiki has nothing → answer from general knowledge → note "not yet in wiki"

Never answer a domain question from general knowledge when the wiki has a relevant page.

## Ingest (when asked to learn from a source in `raw/`)

1. Read the source fully
2. Update or create relevant wiki pages — not a copy, not a one-liner. Write what you would want to read instead of the raw file.
3. Update `wiki/index.md`
4. Append to `wiki/log.md`: `[date] ingested [file] → [pages updated]`

## Update

If new info contradicts an existing page — say so before changing it. Add at page bottom: `Updated [date]: [what changed and why]`

## Rules

- Never touch `raw/`
- One concept per page — cross-reference, never duplicate
- Every wiki page readable cold by any agent on any tool — no assumed context
- Always update `log.md` when writing to `wiki/`
