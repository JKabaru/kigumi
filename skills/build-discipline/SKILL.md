# Build discipline

## What this is
A workflow discipline for building software on this project. Follow this sequence on every task, every time. It applies regardless of which agent or model is running.

## The sequence

### Step 1 — understand before acting
Before writing a single line of code or making any file change, confirm you understand what is actually being asked. If the request is ambiguous, ask one clarifying question. Only one. Wait for the answer.

Do not infer intent and proceed. Do not ask multiple questions at once. One question, then wait.

### Step 2 — spec first
State back what you are going to build in plain language before building it. Keep it short — three to five sentences maximum. Cover: what it does, what it does not do, and what the success condition is.

Wait for explicit confirmation before proceeding. "Sounds good" or "yes" is enough. Silence is not confirmation.

### Step 3 — plan before coding
Write a brief implementation plan. Not pseudocode — a numbered list of real steps in the order you will do them. Each step should be small enough to complete and verify independently.

Show this plan before writing code. If the plan changes during implementation, note the change and why.

### Step 4 — build in small verifiable steps
Implement one step at a time. After each step, verify it works before moving to the next. Do not implement five steps and test at the end.

If a step fails, fix it before continuing. Do not accumulate broken steps.

### Step 5 — test as you go
Write a test for each piece of logic before or immediately after writing it. The test does not need to be elaborate — it needs to tell you clearly whether the thing works. A failing test is information. Suppress nothing.

### Step 6 — review before delivering
Before calling anything done, read through what you built. Check: does it match the spec from Step 2? Are there loose ends? Is anything more complicated than it needs to be? Is anything missing?

Fix what you find. Then deliver.

## Hard rules

- Never skip the spec step, even for small tasks. Small tasks that skip the spec are where most mistakes happen.
- Never implement more than was agreed in the spec. If you see something worth adding, note it for later — do not add it now.
- Never leave a broken state between steps. Each step should leave the project in a working condition.
- Never assume a dependency is available. Check first.
- Never use a paid API, service, or tool without explicit instruction to do so. Default to free alternatives.

## When things go wrong
If you hit a blocker, state it clearly: what you tried, what happened, what you think the cause is. Do not silently try five different approaches and deliver the one that worked without explanation. Explain what happened.

If you realize mid-build that the spec was wrong, stop and say so. Do not continue building toward a wrong target.

## On model quality
These steps are designed so that any capable model can follow them correctly. The discipline is in the process, not in the model's judgment. If a step feels unnecessary for a simple task — do it anyway. The habit is the point.
