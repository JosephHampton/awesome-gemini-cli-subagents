## What does this PR add?

<!-- A new agent? An improvement to an existing one? A fix to the README or docs? -->

## Checklist

- [ ] The agent has correct frontmatter (`name`, `description`, and any of `kind`, `tools`, `model`, `temperature`, `max_turns`)
- [ ] `name` is a unique lowercase-hyphenated slug that matches the filename
- [ ] The system prompt is focused: one clear responsibility, with focus areas, a method, and explicit guardrails
- [ ] Read-only agents (reviewers, auditors) do not request write tools
- [ ] Security agents are framed defensively (audit, detect, harden, remediate)
- [ ] Added a row for the agent in the matching table in `README.md`
