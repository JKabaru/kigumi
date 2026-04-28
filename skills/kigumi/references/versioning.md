# Versioning

## The test gate

Nothing commits until executed and confirmed working.

**Counts as tested:** ran and produced expected output · tests passed · endpoint responded · feature used end-to-end

**Does not count:** reading and judging correct · "logic seems sound" · compiled without errors · similar thing worked before

If testing is blocked → say so and fix the blocker. Do not commit untested.

## When to suggest a commit

**Yes:**
- Feature / fix / refactor complete and tested
- Before starting something risky — commit clean state as checkpoint first
- Wiki updated significantly (3+ pages)
- Research loop iteration recorded
- End of session with uncommitted working changes

**No:**
- Mid-task
- Tests not yet run
- Build broken
- Just because a lot was written

## Session-end check

If uncommitted tested changes exist:
```
Built: [what] · Tested: [how] · Incomplete: [what]
Uncommitted working changes: [list]
Commit before closing?
```

## Semantic versioning

`MAJOR.MINOR.PATCH` — suggest a tag at stable milestones:
```
Stable point. Tag as v[X.Y.Z]?
```

## The mindset

Git history = log of working states, not log of activity. Every commit means: "project worked here." Build that history intentionally.
