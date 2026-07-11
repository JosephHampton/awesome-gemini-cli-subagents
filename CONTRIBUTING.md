# Contributing

Thanks for helping grow this collection. Contributions of new subagents, improved prompts, and fixes are all welcome.

## Adding a new subagent

1. Pick the right category folder under `agents/` (or propose a new one in your PR).
2. Create a file named after the agent, e.g. `agents/quality-testing/code-reviewer.md`.
3. Use the standard frontmatter and write a focused system prompt.

```markdown
---
name: your-agent-name          # unique slug: lowercase, hyphens, matches the filename
description: One line on what it does and when to use it.
kind: local
tools:
  - read_file
  - grep_search
model: gemini-3-pro-preview     # optional; omit to inherit the session model
temperature: 0.3                # optional
max_turns: 20                   # optional
---
You are a ... [the system prompt: role, when invoked, focus areas, method, output, guardrails]
```

4. Add a row for it in the matching table in `README.md`.

## Quality bar

Agents in this list should be genuinely useful, not stubs. A good agent:

- **Does one thing well.** If it needs "and also" in the description, it is probably two agents.
- **Has a real system prompt.** Give it focus areas, a method, an expected output, and guardrails ("never do X"). Write the prompt you would actually want doing the job.
- **Declares appropriate tools.** Read-only agents (reviewers, auditors) should not request write access.
- **Uses a clear `description`.** This is what the router reads to decide when to pick the agent, so make it specific about *when to use it*.

## Style

- Keep prompts concise and concrete over long and vague.
- No offensive-security tooling; security agents are framed defensively (audit, detect, harden, remediate).
- One agent per file, one file per agent.

## Submitting

Open a pull request with a short description of the agent and why it earns a place in the list. Small, focused PRs are easiest to review and merge.
