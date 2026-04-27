# Research loop

## What this is
A discipline for autonomous iterative improvement on any measurable target. Adapted from Karpathy's autoresearch pattern. Works on any project where "better" can be defined with a real number on real data.

## The core loop

```
read program.md
  → propose one change
    → implement it
      → measure against baseline
        → if better: commit, update baseline
        → if worse: git revert, log what failed
          → repeat
```

One change per iteration. Always. Never bundle two ideas into one iteration — you will not know which one worked.

## Before starting a loop

### Define the metric
The metric must be:
- A real number (not a score you invent, not a qualitative judgment)
- Measurable automatically without human involvement
- Grounded in real data (not synthetic, not mocked)
- Directional — you know what "better" means (higher, lower, faster, etc.)

If you cannot define this metric, do not start the loop. Come back when you can.

### Set the baseline
Run the current version and record the metric. This is your baseline. Store it in `results/baseline.md`. Every subsequent iteration is compared to this number.

### Read program.md
`program.md` is the human-written research direction file. It tells you: what to explore, what constraints to respect, what directions are off-limits. Read it before every session. If it has not been written yet, ask the human to write it before starting.

## Running an iteration

### Propose
State your proposed change in one sentence before implementing it. Write it to `results/log.md` with the date and time. Do not implement until you have written the proposal.

Format: `[datetime] PROPOSE: [one-sentence description of change]`

### Implement
Make the change. Keep it minimal — the smallest implementation that tests the idea. Do not clean up unrelated code, do not refactor, do not add features. One idea, minimally implemented.

### Measure
Run the eval. Record the result. Do not interpret yet — just record the number.

Format: `[datetime] RESULT: [metric name] = [value] (baseline = [baseline value])`

### Decide
- If result > baseline (or better by your metric direction): `git commit -m "research: [what you changed]"`. Update baseline to this result.
- If result <= baseline: `git revert HEAD --no-edit`. Log the failure.

Format: `[datetime] KEEP` or `[datetime] REVERT: [one sentence on why it likely failed]`

### Repeat
Go back to propose. Read program.md again before proposing — the human may have updated it.

## Hard rules
- One change per iteration. Non-negotiable.
- Never use synthetic data for the eval. If you cannot measure on real data, stop and flag it.
- Never skip the revert. A failed experiment left in the codebase poisons future iterations.
- Never run more than one loop in parallel. Sequential iteration preserves interpretability.
- Always log every proposal, result, and decision to results/log.md. The log is the memory of the loop.
- Never modify program.md. That is the human's file.

## Free compute strategy
When running overnight loops without paid compute:
- Use free API tiers (Groq, Google AI Studio, Together AI, OpenRouter) for model calls
- Use GitHub Actions (free tier = 2000 min/month) for scheduled runs
- Use public data APIs — no paid data sources by default
- Keep individual iterations fast — under 5 minutes each if possible
- If an iteration requires heavy compute, flag it and skip it; do not block the loop

## On model quality
The loop design carries the quality, not the model. A weaker model running 100 clean single-change iterations will find more genuine improvements than a frontier model running 10 bundled multi-change experiments. Trust the loop. Run it more times. The compounding is in the volume of clean iterations.

## results/ structure
```
results/
├── baseline.md     ← current best metric value and what produced it
├── log.md          ← append-only log of every iteration
└── archive/        ← snapshots of notable results
```
