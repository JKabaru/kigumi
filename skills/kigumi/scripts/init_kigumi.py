#!/usr/bin/env python3
"""
kigumi init — scaffold kigumi into any project
Works on Windows, Mac, Linux. Requires Python 3.6+

Usage:
  python init_kigumi.py                  # installs into current directory
  python init_kigumi.py /path/to/project # installs into target directory
  python init_kigumi.py --check          # check if kigumi is installed here
"""

import os
import sys
import shutil
from pathlib import Path
from datetime import datetime

KIGUMI_DIR = Path(__file__).parent.parent  # skills/kigumi/
SCRIPT_ROOT = KIGUMI_DIR.parent.parent     # project root (where kigumi lives)

CYAN  = "\033[96m"
GREEN = "\033[92m"
YELLOW= "\033[93m"
RED   = "\033[91m"
RESET = "\033[0m"
BOLD  = "\033[1m"

def c(color, text): 
    return f"{color}{text}{RESET}" if sys.stdout.isatty() else text

def banner():
    print(f"""
{BOLD}  kigumi{RESET} — agent methodology installer
  {'─' * 44}""")

def check_mode(target: Path):
    installed = []
    missing = []
    checks = [
        "AGENTS.md", "CLAUDE.md", "GEMINI.md", ".cursorrules",
        "skills/kigumi/SKILL.md",
        "skills/kigumi/references/mindset.md",
        "skills/kigumi/references/build-discipline.md",
        "skills/kigumi/references/wiki-workflow.md",
        "skills/kigumi/references/research-loop.md",
        "skills/kigumi/references/github-workflow.md",
        "skills/kigumi/references/versioning.md",
    ]
    for f in checks:
        (installed if (target / f).exists() else missing).append(f)
    
    print(f"\n  Target: {target}\n")
    for f in installed: print(f"  {c(GREEN, '✓')} {f}")
    for f in missing:   print(f"  {c(RED,   '✗')} {f}")
    print()
    if not missing:
        print(f"  {c(GREEN, 'kigumi is fully installed')}\n")
    else:
        print(f"  {c(YELLOW, f'{len(missing)} files missing')} — run without --check to install\n")

def copy(src: Path, dst: Path, skip_if_exists=False) -> str:
    """Copy file. Returns status string."""
    if dst.exists() and skip_if_exists:
        return c(YELLOW, "skip")
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
    return c(GREEN, "ok")

def install(target: Path):
    print(f"\n  Target: {c(BOLD, str(target))}\n")

    # Verify target is not kigumi itself
    if target.resolve() == SCRIPT_ROOT.resolve():
        print(f"  {c(RED, 'Error:')} cannot install kigumi into itself\n")
        sys.exit(1)

    if not target.exists():
        print(f"  {c(RED, 'Error:')} target directory does not exist\n")
        sys.exit(1)

    results = []

    # ── Bootstrap files (always overwrite — single source of truth)
    for name, content in BOOTSTRAP_FILES.items():
        dst = target / name
        dst.write_text(content, encoding="utf-8")
        results.append((name, c(GREEN, "ok")))

    # ── Skill files (always overwrite)
    skills_src = KIGUMI_DIR
    for skill_file in ["SKILL.md",
                       "references/mindset.md",
                       "references/build-discipline.md",
                       "references/wiki-workflow.md",
                       "references/research-loop.md",
                       "references/github-workflow.md",
                       "references/versioning.md"]:
        src = skills_src / skill_file
        dst = target / "skills" / "kigumi" / skill_file
        if src.exists():
            status = copy(src, dst)
            results.append((f"skills/kigumi/{skill_file}", status))

    # ── Templates → project files (skip if already exist — preserve user content)
    template_map = {
        "templates/program.md":    ("program.md",        True),
        "templates/wiki-index.md": ("wiki/index.md",     True),
    }
    for tmpl, (dest, skip) in template_map.items():
        src = skills_src / tmpl
        dst = target / dest
        if src.exists():
            status = copy(src, dst, skip_if_exists=skip)
            results.append((dest, status))

    # ── Required directories
    for d in ["raw", "wiki", "results/archive"]:
        (target / d).mkdir(parents=True, exist_ok=True)

    # ── Starter logs (skip if exist)
    starters = {
        "wiki/log.md":      "# Wiki log\n\nAppend-only. Format: `[date] [op] [file] → [pages]`\n\n---\n",
        "results/log.md":   "# Research loop log\n\nAppend-only. Format: `[datetime] PROPOSE/RESULT/KEEP/REVERT: ...`\n\n---\n",
        "results/baseline.md": "# Baseline\n\n**Metric:** _not set — fill program.md first_\n\n**Value:** _not measured_\n",
    }
    for path, content in starters.items():
        dst = target / path
        if not dst.exists():
            dst.parent.mkdir(parents=True, exist_ok=True)
            dst.write_text(content, encoding="utf-8")
            results.append((path, c(GREEN, "ok")))
        else:
            results.append((path, c(YELLOW, "skip")))

    # ── Print results
    for name, status in results:
        print(f"  [{status}] {name}")

    print(f"""
  {'─' * 44}
  {c(GREEN, BOLD + 'kigumi installed' + RESET)}

  Next steps:
    1. Open project in your agent tool
    2. Agent reads its config file automatically
    3. For web tools: paste AGENTS.md + skill files as system prompt
    4. Fill program.md when you want the research loop
  {'─' * 44}
""")


# ── Bootstrap file contents (inline so the script is self-contained)
BOOTSTRAP_FILES = {
    "AGENTS.md": """\
# Agent instructions

Read `skills/kigumi/SKILL.md` first. Load other skills only as the task demands.
See SKILL.md for the full load map and hard constraints.
""",

    "CLAUDE.md": """\
# Claude Code

Read AGENTS.md. Then read `skills/kigumi/SKILL.md`.
Load other skill references only when the task requires them.
""",

    "GEMINI.md": """\
# Gemini CLI

Read AGENTS.md. Then read `skills/kigumi/SKILL.md`.
Load other skill references only when the task requires them.
""",

    ".cursorrules": """\
# Cursor / Kilo Code / Windsurf / Antigravity

Read AGENTS.md. Then read `skills/kigumi/SKILL.md`.
Load other skill references only when the task requires them.
""",
}


if __name__ == "__main__":
    banner()

    args = sys.argv[1:]

    if "--check" in args:
        args.remove("--check")
        target = Path(args[0]).resolve() if args else Path.cwd()
        check_mode(target)
    elif args:
        install(Path(args[0]).resolve())
    else:
        install(Path.cwd())
