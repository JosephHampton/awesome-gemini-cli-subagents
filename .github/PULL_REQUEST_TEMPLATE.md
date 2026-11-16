## What does this PR add?

<!-- A new subagent? An improvement to an existing one? A fix to the README or docs? -->

## Checklist

- [ ] The subagent has correct frontmatter (`name`, `description`, and any of `kind`, `tools`, `model`, `temperature`, `max_turns`)
- [ ] `name` is a unique lowercase-hyphenated slug that matches the filename
- [ ] The system prompt is focused: one clear responsibility, with focus areas, a method, and explicit guardrails
- [ ] Read-only subagents (reviewers, auditors) do not request write tools
- [ ] Security subagents are framed defensively (audit, detect, harden, remediate)
- [ ] Added a row for the subagent in the matching table in `README.md` and bumped the count badge
- [ ] Ran `./scripts/build-antigravity.sh` and `./scripts/validate.sh` (CI runs the same checks)
