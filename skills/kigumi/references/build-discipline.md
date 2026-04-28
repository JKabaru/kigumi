# Build discipline

## Sequence — no skipping, even on small tasks

**1. Spec** — 2-3 sentences: what it does, what it does not do, what done looks like. Confirm before continuing.

**2. Plan** — numbered steps in execution order. Each step small enough to verify alone. Show before building.

**3. Build** — one step at a time. Verify each step works before starting the next.

**4. Test** — run it. Confirm expected output with real execution. Reading and judging is not a test.

**5. Review** — matches spec? Loose ends? Simpler possible? Fix, then deliver.

## Hard rules

- Spec step is never optional. Small tasks that skip it cause most mistakes.
- Never build beyond the spec. Note ideas — do not add them now.
- Never leave the project broken between steps.
- Never assume a dependency exists. Check.
- No paid tools without explicit instruction.

## When blocked

State: what you tried · what happened · what you think the cause is. Do not silently try alternatives and deliver the winner. Explain.

If the spec is wrong mid-build — stop and say so. Do not build toward a wrong target.
