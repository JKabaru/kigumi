# Wiki workflow

## What this is
Instructions for maintaining and using the project knowledge base. The wiki compounds knowledge over time so that no agent session has to rediscover what was already learned.

## The two layers

### raw/
Immutable source material. Papers, notes, articles, experiment results, backtest logs, research findings, meeting notes, anything you want remembered. You add to raw/. No agent ever modifies or deletes files in raw/. Files here are append-only truth.

Naming: `raw/[topic]/YYYY-MM-DD-short-description.md`

### wiki/
LLM-maintained knowledge pages. Summaries, concept pages, entity pages, cross-references, comparison tables, synthesis pages. The agent writes and updates wiki/ based on what is in raw/. You read wiki/. The agent writes wiki/.

Structure:
```
wiki/
├── index.md          ← table of contents, always up to date
├── log.md            ← append-only log of every wiki operation
├── concepts/         ← how things work
├── entities/         ← people, tools, projects, systems
├── findings/         ← conclusions from experiments or research
└── syntheses/        ← cross-topic connections and big-picture views
```

## Operations

### Ingest
When told to ingest a source file:
1. Confirm the file exists in raw/
2. Read it fully
3. Identify which wiki pages it affects — update existing ones or create new ones
4. Update index.md to reflect any new pages
5. Append one line to log.md: `[date] ingested [filename] → updated [list of wiki pages]`

Never summarize so aggressively that you lose the important detail. Never copy so literally that the wiki page is just the raw file again. The wiki page should be what you would want to read instead of the raw file.

### Query
When asked a question about the project domain:
1. Search wiki/ first using keywords from the question
2. If the wiki has a relevant page, answer from it and cite the page
3. If the wiki does not have the answer, say so — then answer from your general knowledge and note that this knowledge is not yet in the wiki
4. Never silently answer from general knowledge when the wiki has a relevant page

### Update
When new information arrives that contradicts an existing wiki page:
1. Note the contradiction explicitly — do not silently overwrite
2. Update the page with the new information
3. Add a note at the bottom: "Updated [date] — [what changed and why]"
4. Append to log.md

### Lint (run periodically)
Check for: broken internal links, wiki pages with no source in raw/, index.md entries that do not match actual files, pages that have not been updated in a long time relative to related raw/ additions. Report findings. Do not auto-fix without instruction.

## Hard rules
- Never modify files in raw/. Ever.
- Never answer a domain question without checking wiki/ first.
- Always update log.md when making wiki changes.
- Keep wiki pages focused — one concept, one entity, or one finding per page. Cross-reference rather than duplicate.
- Write wiki pages so that any agent, on any tool, reading them cold can understand them. No assumed context.

## On model quality
The wiki is specifically designed so that weaker models can operate effectively. The wiki holds the synthesized knowledge so the model does not need to hold it in context. A model that reads the wiki before answering will outperform a stronger model that does not. Use the wiki.
