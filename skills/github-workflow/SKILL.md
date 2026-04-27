# GitHub workflow

## What this is
Instructions for working with GitHub on this project. The agent assists with GitHub operations — it never performs them autonomously. Every git or GitHub action requires explicit human confirmation before executing.

## The core rule
**Suggest, explain, wait. Never act unilaterally.**

The agent surfaces GitHub actions at the right moment, explains what it would do and why, then stops. The human says yes or no. Only then does the agent execute.

This applies to every single GitHub operation without exception: commits, pushes, branch creation, PRs, issues, tags, merges, reverts.

---

## Commits

### When to suggest a commit
Suggest a commit when:
- A feature or fix is complete AND tested AND working
- A meaningful chunk of wiki has been updated
- A research loop iteration has been committed to results/
- The human explicitly asks

Never suggest a commit when:
- Tests are failing or untested
- The build is broken
- You are mid-task
- Code was just written but not yet verified

### How to suggest
State clearly:
1. What changed (one sentence)
2. What was tested and how
3. The proposed commit message
4. Ask for confirmation

Example:
```
The auth middleware is complete and all three tests pass.
Proposed commit: "feat: add JWT auth middleware with expiry check"
Shall I commit?
```

Wait for yes before running `git commit`.

### Commit message format
```
type: short description (max 72 chars)

Optional body if the change needs explanation.
```

Types: `feat` `fix` `refactor` `test` `docs` `chore` `research`

Never write vague messages like "updates" or "fixes" or "wip".

---

## Branches

### When to suggest a branch
- Starting work on a new feature or experiment
- Starting a research loop run
- Any work that might be thrown away

### How to suggest
```
This looks like a self-contained feature.
Suggested branch: feat/short-description
Create it?
```

Wait for yes. Never create branches silently.

### Branch naming
```
feat/short-description
fix/short-description
research/short-description
docs/short-description
```

---

## Push

### When to suggest a push
- After one or more commits that feel like a logical unit
- End of a working session
- Before starting something risky
- When the human asks

### How to suggest
```
3 commits since last push. Ready to push to origin/main?
```

Wait for yes. Never auto-push.

---

## Issues

### When to suggest an issue
- You find a bug that is real but out of scope for the current task
- You notice something worth tracking that is not urgent now
- A task is too large to do in one session and should be tracked

### How to suggest
```
Found a potential issue: [description].
Worth creating a GitHub issue for tracking?
I'd title it: "[suggested title]"
```

Wait for yes. Never create issues silently.

### When NOT to suggest an issue
- For things you can fix right now in the current task
- For speculative future ideas that are not concrete yet
- More than once per session for the same thing

---

## Pull Requests

### When to suggest a PR
- A feature branch is complete and tested
- The human asks

### How to suggest
```
feat/auth-middleware looks complete and tested.
Ready to open a PR to main?
Suggested title: "Add JWT auth middleware"
```

Wait for yes.

---

## Reverts

### When to suggest a revert
- A commit introduced a regression
- The research loop decides to revert (see research-loop skill)
- The human asks

### How to suggest
```
The last commit broke [X]. Suggest reverting: [commit hash - short description].
Revert it?
```

Wait for yes. Always show what will be reverted before doing it.

---

## What the agent never does without confirmation
- `git commit`
- `git push`
- `git merge`
- `git revert`
- `git branch` (create or delete)
- `gh issue create`
- `gh pr create`
- Any destructive git operation

## One-line rule
The agent is the navigator. The human is the driver. The navigator says "turn left here" — the driver decides whether to turn.
