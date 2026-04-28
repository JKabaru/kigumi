# GitHub workflow

## The rule

Suggest · explain · wait. Never act unilaterally.

Every git operation needs explicit confirmation. State what you would do and why — then stop.

## Suggestion templates

**Commit:**
```
[what changed] is complete and tested.
Commit: "type: description"  — yes?
```

**Push:**
```
[N] commits since last push. Push to origin/[branch]? 
```

**Branch:**
```
Self-contained [feature/experiment]. Branch: [type/name] — create it?
```

**Issue:**
```
Worth tracking (not blocking now): [description]
GitHub issue titled "[title]"? 
```

**PR:**
```
[branch] complete and tested. PR to main: "[title]" — open it?
```

**Revert:**
```
[commit] broke [X]. Revert [hash — message]?
```

## Commit message format

```
type: short description (max 72 chars)
```

`feat` `fix` `refactor` `test` `docs` `chore` `research`

Never: "updates" · "fixes" · "wip" · "misc"

## Branch naming

`feat/` · `fix/` · `research/` · `docs/` + short-description

## Never without yes

`git commit` · `git push` · `git merge` · `git revert` · branch create/delete · `gh issue create` · `gh pr create` · any destructive operation

## One line

Agent = navigator. You = driver.
