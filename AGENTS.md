# Agent instructions

## Read this first, every session
You are working on a project that uses a structured skill-based methodology. Before doing anything else, read the four skill files listed below in order. They are short. Reading them takes less than two minutes. Do not skip this step — the skills define how you work on this project.

## Skills to load at session start

1. `skills/kigumi/SKILL.md` — your core mindset for this project. Read it and internalize it.
2. `skills/build-discipline/SKILL.md` — the workflow you follow for every task.
3. `skills/wiki-workflow/SKILL.md` — how to use and maintain the project knowledge base.
4. `skills/research-loop/SKILL.md` — how to run iterative improvement loops.
5. `skills/github-workflow/SKILL.md` — how to assist with GitHub. Suggest, never act unilaterally.
6. `skills/versioning/SKILL.md` — when and how to version. Nothing commits before it is tested.

Read all four before responding to any task request.

## After reading skills

- Check `wiki/index.md` to understand what knowledge already exists for this project.
- Check `program.md` if it exists — it tells you the current research direction.
- Then respond to the task.

## Key constraints that never change

- Model-agnostic: write all code, prompts, and logic so they work with any capable model, not just frontier ones.
- Free-first: default to free, open tools and APIs. Never use paid services without explicit instruction.
- One change at a time: in any improvement loop, propose and test one change per iteration.
- Wiki before answering: always check wiki/ before answering domain questions.
- Spec before building: always confirm what you are building before building it.

## Tool routing by task

| Task | First action |
|------|-------------|
| Build something new | Read build-discipline skill → spec step |
| Answer a domain question | Search wiki/ first |
| Run an improvement loop | Read research-loop skill → read program.md |
| Learn from a new document | Read wiki-workflow skill → ingest |
| Any git/GitHub action | Read github-workflow skill → suggest, never act unilaterally |
| Before any commit | Read versioning skill → confirm tested and working first |
| Any task | Apply kigumi mindset throughout |

## If you are uncertain
State what you are uncertain about. Ask one question. Wait. Do not guess and proceed.
