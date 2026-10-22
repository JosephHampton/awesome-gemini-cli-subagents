# Changelog

All notable changes to this project are documented here.

## v1.2.0

- **Antigravity CLI support.** All 81 agents now ship in Antigravity's subagent format as a ready-made plugin (`antigravity/awesome-subagents/`), generated from `agents/` by `scripts/build-antigravity.sh` and checked with `agy plugin validate --strict`. Gemini-format files are skipped by Antigravity, so this is needed to use them there.
- **New installer.** One-line `curl | bash` install with no clone, `--antigravity`, `--category` (repeatable), `--list` and `--uninstall`, alongside the existing `--project`.
- **CI.** `scripts/validate.sh` checks frontmatter, names, tools, README rows and the count badge, and that the Antigravity plugin is in sync. It runs on every push and pull request.
- README rewritten: install for both CLIs, a recipes section pairing agents for common workflows, updated field reference (`mcpServers`, `timeout_mins`, `@name` invocation) and an FAQ.
- Full CC0 1.0 license text, so GitHub detects the license.
- `AGENTS.md` added for agents working on this repo; `GEMINI.md` updated to match.

## v1.1.0

- 30 new subagents (81 total): ten new language specialists (Vue, Angular, Svelte, Flutter, Swift/iOS, Kotlin/Android, C#/.NET, Laravel, Rails, C++), LLM/RAG/MLOps and database experts, AWS / GitHub Actions / serverless / observability / CI-CD infrastructure agents, load and visual regression testing, container security, monorepo management, GraphQL, Electron, browser extensions, realtime systems, data visualization, and Stripe payments.
- Removed stray placeholder files from the repository root.

## v1.0.0 (Initial release)

- 51 subagents across 9 categories: core development, language specialists, infrastructure and DevOps, quality and testing, security, data/AI/databases, developer experience, specialized domains, and product and orchestration.
- One-line installer (`install-agents.sh`) to copy every agent into `~/.gemini/agents/`.
- Correct Gemini CLI frontmatter on every agent (`name`, `description`, `tools`, `model`, `temperature`, `max_turns`).
- Contributing guide and CC0 license.
