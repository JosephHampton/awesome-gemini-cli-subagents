# Repository context for Gemini CLI

This repository is **Awesome Gemini CLI Subagents** — a curated library of subagent definitions for Gemini CLI.

## Structure

- `agents/<category>/<agent-name>.md` — each file is one subagent: YAML frontmatter plus a system prompt in the body.
- `README.md` — the curated, categorized index of every agent.
- `install-agents.sh` — copies the agents into `~/.gemini/agents/` (or `./.gemini/agents/` with `--project`).

## Conventions when editing here

- Each agent is a single Markdown file with frontmatter fields: `name`, `description`, and optionally `kind`, `tools`, `model`, `temperature`, `max_turns`.
- The `name` must be a unique lowercase-hyphenated slug that matches the filename.
- Keep system prompts focused: one clear responsibility per agent, with focus areas, a method, an expected output, and explicit guardrails.
- Security agents are always framed defensively (audit, detect, harden, remediate).
- When you add or rename an agent, update the corresponding table row in `README.md` so the index stays accurate.
