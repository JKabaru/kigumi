# Agent stack

A model-agnostic, tool-agnostic methodology for any coding agent project. Drop this into any repo and any agent picks up the same mindset, workflow, and quality standard — regardless of which tool or model is running.

## Works with
Cursor · Kilo Code · Windsurf · Antigravity · Claude Code · OpenCode · Google AI Studio · Lovable · Codex · Gemini CLI · any future tool that reads a config file

## How it works
Everything lives in text files in the repo, not inside any tool's settings. The agent reads the bootstrap file for its tool, loads four skill files, and operates from there. Swap tools tomorrow — same methodology, zero re-setup.

## File map

```
├── AGENTS.md           ← universal bootstrap (Codex, OpenCode, Antigravity, Gemini CLI)
├── CLAUDE.md           ← Claude Code / OpenCode (points to AGENTS.md)
├── GEMINI.md           ← Gemini CLI (points to AGENTS.md)
├── .cursorrules        ← Cursor / Kilo Code / Windsurf / Antigravity
├── program.md          ← YOUR research directions (you write this, agent never touches it)
│
├── skills/
│   ├── kigumi/         ← core mindset: masterful simplicity, free-first, model-agnostic
│   ├── build-discipline/ ← spec → plan → build → test → review workflow
│   ├── wiki-workflow/  ← how to use and maintain the knowledge base
│   └── research-loop/  ← autoresearch pattern: propose → test → keep/revert → repeat
│
├── raw/                ← YOUR immutable sources (agent never modifies these)
├── wiki/               ← agent-maintained knowledge base (agent writes, you read)
└── results/            ← research loop logs and baseline tracking
```

## Using it on a new project

1. Copy this entire folder into your project root (or use it as the project root)
2. Open with any supported agent tool
3. The agent reads its bootstrap file automatically and loads the skills
4. Start working — the methodology is live

## Using it with tools that have no config file
(Google AI Studio, Lovable, web-based tools)

Paste the contents of `AGENTS.md` as the system prompt or project instructions. Then paste the four skill files below it. The agent will operate with the full methodology for that session.

## The four skills

**Kigumi** — the core instinct. Masterful simplicity. Free and open tools first. Quality that comes from precision, not complexity. Model-agnostic by design — every instruction is clear enough for any capable model to follow correctly.

**Build discipline** — the workflow. Spec before code. Plan before building. One step at a time. Test as you go. No skipping, even on small tasks.

**Wiki workflow** — compounding memory. Raw sources stay immutable. The agent builds and maintains a structured wiki from them. Every session starts smarter than the last.

**Research loop** — autonomous improvement. One change. Measure. Keep if better, revert if worse. Repeat. Works on any metric, any project, with free compute.

## The key design principle
The methodology carries the intelligence, not the model. A weaker model following these skills will outperform a stronger model with no structure. Quality is consistent across tools and models because the process enforces it — not because of what is running the process.
