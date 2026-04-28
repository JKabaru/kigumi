# Research loop

## The loop

```
read program.md → propose one change → implement → measure → keep or revert → repeat
```

One change per iteration. Always. Never bundle — you will not know what worked.

## Before starting

- Define metric: real number · auto-measurable · real data · clear direction
- Set baseline: run current version → record in `results/baseline.md`
- Read `program.md` for directions and constraints

## Each iteration

**Propose** — one sentence to `results/log.md` before touching any code:
`[datetime] PROPOSE: [what and why]`

**Implement** — smallest possible change that tests the idea. Nothing else.

**Measure** — run eval on real data:
`[datetime] RESULT: [metric] = [value] (baseline = [value])`

**Decide:**
- Better → `git commit -m "research: [what changed]"` → update baseline
- Same or worse → `git revert HEAD --no-edit`

`[datetime] KEEP` or `[datetime] REVERT: [why it likely failed]`

## Free compute

Groq free tier · Google AI Studio free · OpenRouter cheapest route · GitHub Actions free tier for overnight runs · public APIs only · keep iterations under 5 min

## Rules

- One change per iteration — non-negotiable
- Real data only — never eval on synthetic data
- Always revert failures — never leave broken experiments in the codebase
- Never modify `program.md`
- Log every proposal, result, decision
