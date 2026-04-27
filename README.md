# kigumi

> *A master Japanese carpenter builds a bridge with no nails — each piece shaped with precision, held by geometry and natural forces alone. The result is stronger, lighter, and more elegant than anything over-engineered.*

**A model-agnostic, tool-agnostic agent methodology. Drop it into any project. Any agent picks it up.**

---

## Works with any coding agent

Cursor · Kilo Code · Windsurf · Antigravity · Claude Code · OpenCode · Google AI Studio · Lovable · Codex · Gemini CLI · and any tool released tomorrow

---

## The problem it solves

Coding agents are powerful but inconsistent. They over-engineer. They commit broken code. They forget context between sessions. They pick expensive tools when free ones exist. They push to git without asking. They never remind you to push when something actually works.

Kigumi fixes this with a set of skills — plain text files that live in your repo — that any agent reads at session start. The methodology travels with the code, not with the tool. Swap agents freely. Quality stays consistent.

---

## How it works

Everything lives in text files in the repo, not inside any tool's settings. The agent reads its bootstrap file on first open, loads the skill files, and operates from them. No plugins. No extensions. No configuration UI.

```
your-project/
├── AGENTS.md              ← universal bootstrap
├── CLAUDE.md              ← Claude Code / OpenCode
├── GEMINI.md              ← Gemini CLI
├── .cursorrules           ← Cursor / Kilo Code / Windsurf / Antigravity
├── program.md             ← your research directions (you write this)
│
├── skills/
│   ├── kigumi/            ← core mindset
│   ├── build-discipline/  ← spec → plan → build → test → review
│   ├── wiki-workflow/     ← compounding knowledge base
│   ├── research-loop/     ← autonomous iterative improvement
│   ├── github-workflow/   ← GitHub assistance, never automatic
│   └── versioning/        ← test gate + smart commit timing
│
├── raw/                   ← your immutable sources (agent never touches)
├── wiki/                  ← agent-maintained knowledge base
└── results/               ← research loop logs and baselines
```

---

## The six skills

### 1 — Kigumi (core mindset)
The foundation everything else builds on. Masterful simplicity over complexity. Free and open tools first. Quality through precision, not through adding more. Written so that any capable model internalizes it as instinct, not a checklist.

### 2 — Build discipline
Spec before code. Plan before building. One step at a time. Test as you go. The agent confirms what it is building before building it, and never ships a step without verifying it worked. Eliminates the most common source of wasted cycles.

### 3 — Wiki workflow
A two-layer knowledge base. `raw/` holds your immutable sources — notes, papers, findings, anything you want remembered. `wiki/` is agent-maintained: summaries, concept pages, cross-references, synthesis. Every session starts smarter than the last. The wiki compounds; the agent never has to rediscover what is already known.

### 4 — Research loop
Autonomous iterative improvement on any measurable target. One change. Measure on real data. Keep if better, `git revert` if worse. Repeat. Adapted from Karpathy's autoresearch pattern. Works on any metric, any domain, with free compute.

### 5 — GitHub workflow
The agent is the navigator, you are the driver. It surfaces GitHub actions at the right moment — "this looks like a clean commit, shall I?" — and stops. It never commits, pushes, creates issues, or opens PRs without explicit confirmation. Every suggestion includes what it would do and why.

### 6 — Versioning
Solves two specific pains: committing broken code, and never committing when something works. A hard test gate — nothing goes to git until it has been executed and confirmed working, not just read and judged correct. Plus smart session-end checks so clean checkpoints are never lost.

---

## Install on a new project

```cmd
mkdir my-project
cd my-project
git init
xcopy /E /I path\to\kigumi\* .
```

Open in any agent tool. Done.

## Install on an existing project

Drag your project folder onto `install.bat` — or run it from inside the project:

```cmd
cd my-existing-project
path\to\kigumi\install.bat
```

The installer is safe on existing projects — it never overwrites your `program.md`, `wiki/`, or `results/` if they already exist.

## Use with web-based tools (AI Studio, Lovable, etc.)

Paste `AGENTS.md` as the system prompt. Then paste the contents of each `SKILL.md` below it. The agent operates with the full methodology for that session.

---

## The key design principle

**The methodology carries the intelligence, not the model.**

Every skill is written so that a capable but not exceptional model follows it correctly on first read. No inference required. No assumed context. A weaker model running these skills will outperform a stronger model with no structure — because the process enforces quality, not the model's judgment.

This is also why it is free-first by design. Groq, Google AI Studio free tier, Together AI, OpenRouter — these are not second-class options. They are the constraint that forces elegant solutions.

---

## The versioning flow in practice

```
you:   build the auth feature
agent: [reads skills] → confirms spec → builds step by step → tests it →
       "auth is working, all tests pass.
        commit as feat/add-jwt-auth?
        proposed message: feat: add JWT auth middleware"
you:   yes
agent: commits — then keeps building
```

No surprise pushes. No broken commits. No lost checkpoints.

---

## Contributing

The skills are plain markdown. If you improve one, open a PR. If you write a new skill that works well across projects, it belongs here.

---

## License

MIT
