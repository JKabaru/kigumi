# Versioning

## What this is
A discipline for when and how to version code. It exists to solve two specific problems:

1. **Committing broken code** — code goes to git before it is tested and confirmed working
2. **Never committing** — a working session ends with no commit, losing a clean checkpoint

The versioning skill works alongside the github-workflow skill. This skill defines the gates and timing. The github-workflow skill defines how to suggest and execute.

---

## The test gate

This is the most important rule in this skill:

> **No code is committed until it has been tested and confirmed working by a real execution, not by reading.**

"Looks right" is not a test. "Should work" is not a test. Running it and seeing it produce the expected output — that is a test.

### What counts as tested
- The function was called and returned the expected result
- The script ran without errors
- The endpoint responded correctly
- The test suite passed
- The feature was used end-to-end at least once

### What does not count as tested
- Reading the code and judging it correct
- A previous similar thing worked
- The logic seems sound
- It compiled / linted without errors (necessary but not sufficient)

### When the agent tries to commit untested code
The agent must catch itself. Before suggesting any commit, ask: "Has this been executed and confirmed working?" If the answer is no — do not suggest the commit. Finish testing first.

If testing is not possible right now (environment issue, dependency missing, etc.) — say so explicitly. Do not commit and note "untested." Flag the blocker and wait.

---

## Commit timing — when to suggest

### Suggest a commit after:
- A complete feature works end-to-end
- A bug is fixed and the fix is verified
- A refactor is complete and existing tests still pass
- A meaningful wiki update
- A research loop iteration with a result (keep or revert)
- Before starting something risky or experimental

### Never suggest a commit:
- Mid-feature, mid-fix, mid-refactor
- When tests are failing
- When the build is broken
- Just because a lot of code was written
- More than once every few minutes — do not spam suggestions

### The "before something risky" rule
Before starting an experiment, a large refactor, or anything that might break things — suggest committing the current clean state first. This gives a safe rollback point.

```
About to refactor the data pipeline — current state looks clean and tested.
Worth committing this as a checkpoint before we start?
"chore: checkpoint before pipeline refactor"
```

---

## Versioning the wiki and results

### Wiki commits
Suggest a wiki commit when:
- Three or more pages have been updated in a session
- A major new concept page was created
- The index was significantly updated

Format: `docs: update wiki — [what changed in one phrase]`

### Research loop commits
The research loop skill handles its own commit suggestions. This skill defers to it for loop iterations. Outside the loop, treat results/ changes like wiki changes.

---

## Version naming (for releases and tags)

Use semantic versioning: `MAJOR.MINOR.PATCH`

- PATCH — bug fix, no new features, no breaking changes
- MINOR — new feature, backward compatible
- MAJOR — breaking change or significant architecture shift

Suggest a tag when a meaningful stable version exists:
```
This feels like a stable milestone.
Worth tagging as v0.1.0?
```

Wait for yes.

---

## The session-end check

At the end of any working session, if there are uncommitted changes that are tested and working — flag it:

```
Session summary:
- [what was built/fixed]
- [what was tested and confirmed working]
- [what is incomplete or untested]

Uncommitted working changes: [list]
Want to commit before closing?
```

This prevents losing clean checkpoints at the end of a session.

---

## The versioning mindset

Think of git history as a log of working states, not a log of activity. Every commit should represent: "at this point, the project worked and was in a good state." 

A commit history full of "wip", "fixes", "more fixes", "trying something" is noise. A commit history of clean, tested, well-described states is a tool you can actually use to understand the project, roll back safely, and track what changed and why.

The agent's job is to help you build that clean history — by catching commits too early, surfacing commits at the right time, and writing messages that mean something.
