# kigumi

> *A master carpenter builds a bridge with no nails — each piece held by geometry alone. Stronger, lighter, and more elegant than anything over-engineered.*

A model-agnostic, tool-agnostic agent methodology. Drop it into any project. Any agent picks it up. Quality stays consistent regardless of which tool or model is running.

---

## Works with any coding agent

Cursor · Kilo Code · Windsurf · Antigravity · Claude Code · OpenCode · Google AI Studio · Lovable · Codex · Gemini CLI · anything released tomorrow

---

## The problem

Coding agents are inconsistent. They over-engineer. They commit broken code. They forget context between sessions. They hit rate limits on free models. They pick expensive tools when free ones work. They push without asking.

Kigumi fixes this with plain text skill files that live in your repo. The methodology travels with the code, not the tool. The agent is just the reader.

---

## Why it works on free and weak models

Most agent frameworks load everything upfront. One task → entire context filled → rate limit hit → degraded output.

Kigumi uses **progressive disclosure**:

| What loads | When | Size |
|------------|------|------|
| `SKILL.md` (routing table) | Always, every session | ~30 lines |
| `references/mindset.md` | Always after routing | ~20 lines |
| `references/build-discipline.md` | Only when writing code | ~30 lines |
| `references/wiki-workflow.md` | Only for domain questions | ~35 lines |
| `references/research-loop.md` | Only when running a loop | ~35 lines |
| `references/github-workflow.md` | Only for git actions | ~40 lines |
| `references/versioning.md` | Only alongside git | ~35 lines |

Any single task loads **50–100 lines** of instructions. Never all six at once. Runs clean on Groq free tier, Google AI Studio free tier, any open model.

---

## Structure

```
your-project/
├── AGENTS.md              ← universal (Codex, OpenCode, Antigravity, Gemini CLI)
├── CLAUDE.md              ← Claude Code
├── GEMINI.md              ← Gemini CLI
├── .cursorrules           ← Cursor, Kilo Code, Windsurf, Antigravity
├── program.md             ← your research directions (you write this)
│
├── skills/kigumi/
│   ├── SKILL.md           ← routing table only — loaded first, always tiny
│   ├── references/        ← loaded on demand, never upfront
│   │   ├── mindset.md
│   │   ├── build-discipline.md
│   │   ├── wiki-workflow.md
│   │   ├── research-loop.md
│   │   ├── github-workflow.md
│   │   └── versioning.md
│   ├── templates/         ← starter files for new projects
│   └── scripts/
│       └── init_kigumi.py ← cross-platform installer
│
├── raw/                   ← your immutable sources
├── wiki/                  ← agent-maintained knowledge base
└── results/               ← research loop logs and baselines
```

---

## Install

**Any OS — Python 3.6+:**
```bash
# into current directory
python skills/kigumi/scripts/init_kigumi.py

# into a specific project
python skills/kigumi/scripts/init_kigumi.py /path/to/project

# check what's installed
python skills/kigumi/scripts/init_kigumi.py --check
```

Safe on existing projects — never overwrites `program.md`, `wiki/`, or `results/`.

**Web tools (AI Studio, Lovable, no file access):**
Paste `AGENTS.md` as system prompt. Then paste `skills/kigumi/SKILL.md` and `references/mindset.md`. Load other references inline as needed.

---

## The six disciplines

**Mindset** — masterful simplicity, free-first, model-agnostic, quality through precision

**Build discipline** — spec → plan → build → test → review. Never skip the spec.

**Wiki workflow** — `raw/` holds your sources untouched. `wiki/` is agent-maintained. Every session starts smarter than the last.

**Research loop** — one change, measure on real data, keep if better, revert if worse, repeat. Runs overnight on free compute.

**GitHub workflow** — agent suggests every git action with what and why, then stops. You confirm. Navigator, not driver.

**Versioning** — hard test gate before any commit. Smart session-end check so clean checkpoints are never lost.

---

## The key principle

**The methodology carries the intelligence, not the model.**

A capable model with no structure wastes tokens and produces inconsistent work. A weaker model following kigumi produces disciplined, tested, well-committed output. The process enforces quality. The model just executes.

---

## Contributing

Skills are plain markdown. Improve one → open a PR. Write a new skill that works across projects → it belongs here.

## License

MIT
