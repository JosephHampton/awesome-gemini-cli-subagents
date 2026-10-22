# Repository context for coding agents

This repository is **Awesome Gemini CLI & Antigravity Subagents**: a curated library of subagent definitions for Gemini CLI and Antigravity CLI.

## Structure

- `agents/<category>/<agent-name>.md`: the source of truth. One subagent per file, YAML frontmatter plus a system prompt in the body, in Gemini CLI format.
- `antigravity/awesome-subagents/`: an Antigravity CLI plugin GENERATED from `agents/` by `scripts/build-antigravity.sh`. Never edit it by hand.
- `README.md`: the categorized index of every agent.
- `install-agents.sh`: installs the agents for either CLI (`--antigravity`, `--project`, `--category`, `--list`, `--uninstall`).
- `scripts/validate.sh`: the checks CI runs on every push and pull request.

## Conventions when editing here

- Frontmatter fields: `name`, `description`, and optionally `kind`, `tools`, `model`, `temperature`, `max_turns`.
- `name` is a unique lowercase-hyphenated slug that matches the filename.
- Keep system prompts focused: one clear responsibility per agent, with focus areas, a method, an expected output and explicit guardrails.
- Prompts must stay tool-agnostic (no tool names in the body), because the same body is used by both CLIs.
- Reviewers and auditors do not get `write_file`.
- Security agents are always framed defensively (audit, detect, harden, remediate).
- After adding, renaming or editing an agent: update its row in `README.md` (and the count badge), run `./scripts/build-antigravity.sh`, then `./scripts/validate.sh`.
