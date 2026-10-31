<div align="center">

# 🤖 Awesome Gemini CLI & Antigravity Subagents [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

### 81 production-ready subagents for [Gemini CLI](https://github.com/google-gemini/gemini-cli) and [Antigravity CLI](https://antigravity.google/docs/subagents)

Code review, security audits, testing, DevOps, data and AI, and 17 language and framework experts. Install them in one line and let the main agent delegate to the right specialist.

[![validate](https://github.com/JosephHampton/awesome-gemini-cli-subagents/actions/workflows/validate.yml/badge.svg)](https://github.com/JosephHampton/awesome-gemini-cli-subagents/actions/workflows/validate.yml)
![Subagents](https://img.shields.io/badge/subagents-81-4285F4)
[![GitHub stars](https://img.shields.io/github/stars/JosephHampton/awesome-gemini-cli-subagents?style=flat&logo=github&color=4285F4)](https://github.com/JosephHampton/awesome-gemini-cli-subagents/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JosephHampton/awesome-gemini-cli-subagents?style=flat&logo=github&color=34A853)](https://github.com/JosephHampton/awesome-gemini-cli-subagents/fork)
![Gemini CLI](https://img.shields.io/badge/Gemini%20CLI-supported-8E75B2)
![Antigravity CLI](https://img.shields.io/badge/Antigravity%20CLI-supported-34A853)
![License: CC0-1.0](https://img.shields.io/badge/License-CC0%201.0-lightgrey.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

</div>

---

## What is this

Gemini CLI and Antigravity CLI both support **subagents**: specialist assistants the main agent hands work to. Each one has its own system prompt, its own tools and its own context window, so it stays sharp on one job instead of being average at everything.

This repo is a curated library of them. Every agent is a single Markdown file with a real, opinionated system prompt (focus areas, a method, an output format and guardrails), not a one-line stub. Each one ships in **both formats**, checked automatically on every change.

Each one is **focused** (a `code-reviewer` that only reviews beats a general assistant that sometimes reviews), keeps its **context isolated** (a big investigation runs in the subagent's window, not yours), has **scoped tools** (reviewers and auditors get no file-writing tools, so they report problems instead of quietly changing your code), and is **composable** (let `tech-lead-orchestrator` plan, then hand the pieces to the specialists — see [Recipes](#-recipes)).

## 🚀 Install

**One line, no clone needed:**

```bash
# Gemini CLI
curl -fsSL https://raw.githubusercontent.com/JosephHampton/awesome-gemini-cli-subagents/main/install-agents.sh | bash

# Antigravity CLI (agy)
curl -fsSL https://raw.githubusercontent.com/JosephHampton/awesome-gemini-cli-subagents/main/install-agents.sh | bash -s -- --antigravity
```

**Or clone and pick what you want:**

```bash
git clone https://github.com/JosephHampton/awesome-gemini-cli-subagents.git
cd awesome-gemini-cli-subagents

./install-agents.sh --list                           # see every category and agent
./install-agents.sh --category security              # just one category (repeatable)
./install-agents.sh --project                        # this project only, shareable with your team
./install-agents.sh --antigravity --category quality-testing
./install-agents.sh --uninstall                      # remove them again
```

**Antigravity users can also install it as a plugin:**

```bash
agy plugin install ./antigravity/awesome-subagents
```

|                            | Gemini CLI          | Antigravity CLI                                                   |
| -------------------------- | ------------------- | ----------------------------------------------------------------- |
| User-level (every project) | `~/.gemini/agents/` | `~/.gemini/config/agents/`                                        |
| Project-level              | `.gemini/agents/`   | `.agents/agents/`                                                 |
| Source files               | [`agents/`](agents) | [`antigravity/awesome-subagents/`](antigravity/awesome-subagents) |

Then just describe the work, e.g. _"review this diff for security issues"_, and the main agent delegates to the matching subagent. In Gemini CLI you can also call one directly with `@security-auditor`, or manage them with `/agents`.

> **Moving from Gemini CLI to Antigravity?** Your `.gemini/agents/*.md` files will not load in Antigravity as they are: it rejects Gemini model names such as `gemini-3-pro-preview` and uses different tool names. Run `./install-agents.sh --antigravity` to get versions converted for it.

---

## 📚 The collection

### 🏗️ Core Development

| Agent                                                                                   | What it does                                                  |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [`backend-architect`](agents/core-development/backend-architect.md)                     | Scalable backend systems, service boundaries, and data models |
| [`frontend-developer`](agents/core-development/frontend-developer.md)                   | Accessible, performant UI components and state                |
| [`fullstack-engineer`](agents/core-development/fullstack-engineer.md)                   | End-to-end vertical feature slices across the whole stack     |
| [`api-designer`](agents/core-development/api-designer.md)                               | Clean, consistent REST / GraphQL / gRPC contracts             |
| [`microservices-architect`](agents/core-development/microservices-architect.md)         | Service decomposition and distributed-system design           |
| [`mobile-app-developer`](agents/core-development/mobile-app-developer.md)               | Cross-platform and native mobile features                     |
| [`graphql-architect`](agents/core-development/graphql-architect.md)                     | GraphQL schemas, resolvers, and federation without N+1s       |
| [`electron-desktop-developer`](agents/core-development/electron-desktop-developer.md)   | Secure Electron apps with native-feeling UX                   |
| [`browser-extension-developer`](agents/core-development/browser-extension-developer.md) | Manifest V3 extensions for Chrome and Firefox                 |
| [`realtime-websocket-engineer`](agents/core-development/realtime-websocket-engineer.md) | WebSocket / SSE systems that survive disconnects              |

### 🧠 Language Specialists

| Agent                                                                     | What it does                                                  |
| ------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [`typescript-pro`](agents/language-specialists/typescript-pro.md)         | Advanced, type-safe TypeScript                                |
| [`python-pro`](agents/language-specialists/python-pro.md)                 | Clean, idiomatic, fully typed Python                          |
| [`go-pro`](agents/language-specialists/go-pro.md)                         | Idiomatic, concurrent Go                                      |
| [`rust-pro`](agents/language-specialists/rust-pro.md)                     | Safe, idiomatic Rust that works with the borrow checker       |
| [`java-pro`](agents/language-specialists/java-pro.md)                     | Modern Java and the JVM ecosystem                             |
| [`react-pro`](agents/language-specialists/react-pro.md)                   | Modern React patterns, hooks, and performance                 |
| [`nextjs-pro`](agents/language-specialists/nextjs-pro.md)                 | Next.js App Router, server components, and rendering strategy |
| [`vue-pro`](agents/language-specialists/vue-pro.md)                       | Vue 3 Composition API, Pinia, and Nuxt                        |
| [`angular-pro`](agents/language-specialists/angular-pro.md)               | Modern Angular with signals and standalone components         |
| [`svelte-pro`](agents/language-specialists/svelte-pro.md)                 | Svelte 5 runes and SvelteKit                                  |
| [`flutter-pro`](agents/language-specialists/flutter-pro.md)               | Flutter and Dart for fast native-feeling apps                 |
| [`swift-ios-pro`](agents/language-specialists/swift-ios-pro.md)           | SwiftUI and structured concurrency on iOS                     |
| [`kotlin-android-pro`](agents/language-specialists/kotlin-android-pro.md) | Kotlin and Jetpack Compose on Android                         |
| [`csharp-dotnet-pro`](agents/language-specialists/csharp-dotnet-pro.md)   | Modern C# and ASP.NET Core                                    |
| [`laravel-pro`](agents/language-specialists/laravel-pro.md)               | PHP and Laravel the way the framework intends                 |
| [`rails-pro`](agents/language-specialists/rails-pro.md)                   | Ruby on Rails with convention over configuration              |
| [`cpp-pro`](agents/language-specialists/cpp-pro.md)                       | Modern C++ with RAII discipline and sanitizers                |

### ☁️ Infrastructure & DevOps

| Agent                                                                                    | What it does                                         |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [`devops-engineer`](agents/infrastructure-devops/devops-engineer.md)                     | CI/CD pipelines and release automation               |
| [`kubernetes-operator`](agents/infrastructure-devops/kubernetes-operator.md)             | Kubernetes workloads, manifests, and troubleshooting |
| [`terraform-engineer`](agents/infrastructure-devops/terraform-engineer.md)               | Modular, safe Terraform / OpenTofu                   |
| [`cloud-architect`](agents/infrastructure-devops/cloud-architect.md)                     | Cloud infra on AWS / GCP / Azure with cost in mind   |
| [`docker-specialist`](agents/infrastructure-devops/docker-specialist.md)                 | Lean, secure Dockerfiles and Compose setups          |
| [`sre-incident-responder`](agents/infrastructure-devops/sre-incident-responder.md)       | Incident triage and blameless postmortems            |
| [`aws-specialist`](agents/infrastructure-devops/aws-specialist.md)                       | AWS services, IAM, networking, and cost awareness    |
| [`github-actions-specialist`](agents/infrastructure-devops/github-actions-specialist.md) | Fast, secure GitHub Actions pipelines                |
| [`serverless-architect`](agents/infrastructure-devops/serverless-architect.md)           | Event-driven serverless with idempotency built in    |
| [`observability-engineer`](agents/infrastructure-devops/observability-engineer.md)       | Logs, metrics, traces, SLOs, and alerts that matter  |
| [`cicd-pipeline-engineer`](agents/infrastructure-devops/cicd-pipeline-engineer.md)       | Build-once promotion pipelines with tested rollback  |

### ✅ Quality & Testing

| Agent                                                                            | What it does                                  |
| -------------------------------------------------------------------------------- | --------------------------------------------- |
| [`code-reviewer`](agents/quality-testing/code-reviewer.md)                       | Thorough, prioritized code review             |
| [`test-automator`](agents/quality-testing/test-automator.md)                     | Meaningful unit and integration tests         |
| [`e2e-tester`](agents/quality-testing/e2e-tester.md)                             | Stable Playwright / Cypress end-to-end tests  |
| [`performance-optimizer`](agents/quality-testing/performance-optimizer.md)       | Evidence-based performance fixes              |
| [`debugger`](agents/quality-testing/debugger.md)                                 | Systematic root-cause debugging               |
| [`refactoring-specialist`](agents/quality-testing/refactoring-specialist.md)     | Safe, behaviour-preserving refactors          |
| [`load-testing-engineer`](agents/quality-testing/load-testing-engineer.md)       | Realistic load tests that name the bottleneck |
| [`visual-regression-tester`](agents/quality-testing/visual-regression-tester.md) | Flake-proof screenshot testing for UI changes |

### 🛡️ Security

| Agent                                                                         | What it does                                                |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------- |
| [`security-auditor`](agents/security/security-auditor.md)                     | Defensive code review for common vulnerability classes      |
| [`dependency-auditor`](agents/security/dependency-auditor.md)                 | Third-party CVE and supply-chain review                     |
| [`secrets-detector`](agents/security/secrets-detector.md)                     | Detect committed secrets so they can be rotated and removed |
| [`threat-modeler`](agents/security/threat-modeler.md)                         | Design-time STRIDE threat modeling                          |
| [`auth-reviewer`](agents/security/auth-reviewer.md)                           | Review authentication and authorization logic               |
| [`container-security-auditor`](agents/security/container-security-auditor.md) | Image, Kubernetes, and supply-chain hardening               |

### 📊 Data, AI & Databases

| Agent                                                                                    | What it does                                          |
| ---------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| [`data-engineer`](agents/data-ai-databases/data-engineer.md)                             | Reliable ETL / ELT and data pipelines                 |
| [`ml-engineer`](agents/data-ai-databases/ml-engineer.md)                                 | Reproducible ML training, evaluation, and deployment  |
| [`prompt-engineer`](agents/data-ai-databases/prompt-engineer.md)                         | Testable LLM prompts and agent instructions           |
| [`sql-pro`](agents/data-ai-databases/sql-pro.md)                                         | Query writing and performance tuning                  |
| [`postgres-expert`](agents/data-ai-databases/postgres-expert.md)                         | Deep PostgreSQL tuning and features                   |
| [`database-designer`](agents/data-ai-databases/database-designer.md)                     | Relational schema and data modeling                   |
| [`analytics-engineer`](agents/data-ai-databases/analytics-engineer.md)                   | Trustworthy analytics models and metrics              |
| [`llm-integration-engineer`](agents/data-ai-databases/llm-integration-engineer.md)       | LLM product features with evals and cost control      |
| [`rag-architect`](agents/data-ai-databases/rag-architect.md)                             | Retrieval-augmented generation that cites its sources |
| [`mongodb-expert`](agents/data-ai-databases/mongodb-expert.md)                           | Document modelling and aggregation performance        |
| [`redis-expert`](agents/data-ai-databases/redis-expert.md)                               | Caching, queues, and realtime data in Redis           |
| [`mlops-engineer`](agents/data-ai-databases/mlops-engineer.md)                           | Reproducible training pipelines and monitored models  |
| [`data-visualization-engineer`](agents/data-ai-databases/data-visualization-engineer.md) | Honest, fast charts and dashboards                    |

### 🧰 Developer Experience

| Agent                                                                         | What it does                                         |
| ----------------------------------------------------------------------------- | ---------------------------------------------------- |
| [`documentation-writer`](agents/developer-experience/documentation-writer.md) | Clear developer and user documentation               |
| [`api-documenter`](agents/developer-experience/api-documenter.md)             | Accurate API reference and OpenAPI specs             |
| [`git-workflow-manager`](agents/developer-experience/git-workflow-manager.md) | Clean Git history and workflow                       |
| [`dependency-upgrader`](agents/developer-experience/dependency-upgrader.md)   | Safe, staged dependency upgrades                     |
| [`dx-optimizer`](agents/developer-experience/dx-optimizer.md)                 | Faster builds and a smoother local dev loop          |
| [`monorepo-manager`](agents/developer-experience/monorepo-manager.md)         | Turborepo / Nx / workspaces with trustworthy caching |

### 🎯 Specialized Domains

| Agent                                                                                    | What it does                                          |
| ---------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| [`accessibility-auditor`](agents/specialized-domains/accessibility-auditor.md)           | WCAG accessibility audit and fixes                    |
| [`seo-optimizer`](agents/specialized-domains/seo-optimizer.md)                           | Technical and on-page SEO                             |
| [`blockchain-developer`](agents/specialized-domains/blockchain-developer.md)             | Smart contracts and on-chain safety                   |
| [`game-developer`](agents/specialized-domains/game-developer.md)                         | Gameplay systems and real-time performance            |
| [`embedded-systems-engineer`](agents/specialized-domains/embedded-systems-engineer.md)   | Firmware for resource-constrained devices             |
| [`stripe-payments-integrator`](agents/specialized-domains/stripe-payments-integrator.md) | Payment flows and webhooks treated as safety-critical |

### 🧭 Product & Orchestration

| Agent                                                                                | What it does                                |
| ------------------------------------------------------------------------------------ | ------------------------------------------- |
| [`product-strategist`](agents/product-orchestration/product-strategist.md)           | Scoping, specs, and ruthless prioritization |
| [`tech-lead-orchestrator`](agents/product-orchestration/tech-lead-orchestrator.md)   | Decompose and sequence large tasks          |
| [`code-archaeologist`](agents/product-orchestration/code-archaeologist.md)           | Understand legacy and unfamiliar codebases  |
| [`agent-workflow-designer`](agents/product-orchestration/agent-workflow-designer.md) | Design multi-agent workflows and pipelines  |

---

## 🧪 Recipes

Subagents are most useful in combination. A few that work well together:

| Goal                                | Hand it to                                                                     | Prompt to try                                                                    |
| ----------------------------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| Ship a feature safely               | `tech-lead-orchestrator` → specialists → `code-reviewer`                       | _"Plan this feature, build it, then review the diff before I commit."_           |
| Pre-release security pass           | `threat-modeler` → `security-auditor` → `auth-reviewer` → `dependency-auditor` | _"Do a security pass on the payments module before release."_                    |
| Fix a nasty bug                     | `debugger` → `test-automator`                                                  | _"Find the root cause of this failing test, fix it, and add a regression test."_ |
| Make it faster                      | `performance-optimizer` → `load-testing-engineer`                              | _"Profile the checkout API and prove the fix under load."_                       |
| Get to grips with a legacy codebase | `code-archaeologist` → `documentation-writer`                                  | _"Explain how billing works here and write it up for new joiners."_              |
| Clean up safely                     | `refactoring-specialist` → `test-automator`                                    | _"Refactor this module without changing behaviour, tests first."_                |
| Production incident                 | `sre-incident-responder` → `observability-engineer`                            | _"Triage this outage, then add the alert that would have caught it."_            |
| Scope a new product idea            | `product-strategist` → `api-designer` → `backend-architect`                    | _"Turn this idea into a scoped spec and an API design."_                         |

## 📐 Agent format

Each agent in `agents/` is a Markdown file with YAML frontmatter. The body is the system prompt.

#### Gemini CLI

```markdown
---
name: security-auditor
description: Reviews code for security weaknesses and recommends fixes.
kind: local
tools:
  - read_file
  - grep_search
model: gemini-3-pro-preview
temperature: 0.2
max_turns: 20
---

You are a defensive security reviewer...
```

| Field          | Required | Purpose                                                                       |
| -------------- | :------: | ----------------------------------------------------------------------------- |
| `name`         |   Yes    | Unique slug, used as the tool name and with `@name`                           |
| `description`  |   Yes    | When to use this agent; the router reads it to decide                         |
| `kind`         |          | `local` (default) or `remote` (A2A)                                           |
| `tools`        |          | Tool allowlist; supports `*` and `mcp_*` wildcards. Omit to inherit all tools |
| `mcpServers`   |          | MCP servers available only to this agent                                      |
| `model`        |          | Pin a model, or `inherit` the session's                                       |
| `temperature`  |          | `0.0` to `2.0` (default `1`)                                                  |
| `max_turns`    |          | Turn budget (default `30`)                                                    |
| `timeout_mins` |          | Time budget in minutes (default `10`)                                         |

#### Antigravity CLI

The same agent, converted by [`scripts/build-antigravity.sh`](scripts/build-antigravity.sh):

```markdown
---
name: security-auditor
description: Reviews code for security weaknesses and recommends fixes.
tools:
  - view_file
  - list_dir
  - grep_search
  - find_by_name
model: pro
---

You are a defensive security reviewer...
```

Antigravity uses `model: pro | flash | inherit` and its own tool names (`view_file`, `grep_search`, `find_by_name`, `write_to_file`, `replace_file_content`, `run_command`, `search_web` and others). It also supports `mainAgent`, `subagent`, `commandExecutionPolicy`, `mcpServers` and `skills`. See the Antigravity subagents docs and the [Gemini CLI subagents docs](https://geminicli.com/docs/core/subagents/) for the full references.

## ❓ FAQ

**Which should I use, Gemini CLI or Antigravity CLI?**
Google moved free and Google One users from Gemini CLI to Antigravity CLI in June 2026. Gemini CLI is still maintained for Gemini Code Assist Standard and Enterprise. This collection supports both, so use whichever you have.

**Will 81 agents slow things down or confuse the router?**
Not noticeably. Until it delegates, the main agent only sees each agent's name and one-line description, not the full prompt. If you want a leaner set, install just the categories you use with `--category`.

**Can a subagent change my files?**
Only through the tools it declares. Reviewers and auditors such as `code-reviewer`, `security-auditor` and `secrets-detector` have no file-writing tools. Some of them can run shell commands (for example `git diff` or a dependency scan), which go through your CLI's normal approval and sandbox settings. Builders such as `python-pro` can edit files and run commands.

**Can I edit them?**
Yes, they are CC0. Copy one, change the prompt, and make it yours. If your change would help everyone, open a PR.

## Contributing

New agents, sharper prompts and fixes are all welcome. Edit or add files in `agents/` only, then run:

```bash
./scripts/build-antigravity.sh   # regenerate the Antigravity versions
./scripts/validate.sh            # the same checks CI runs
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the quality bar.

## 📈 Star history

<a href="https://star-history.com/#JosephHampton/awesome-gemini-cli-subagents&Date">
  <img src="https://api.star-history.com/svg?repos=JosephHampton/awesome-gemini-cli-subagents&type=Date" alt="Star History Chart" width="600">
</a>

<div align="center">

**If these subagents save you time, a ⭐ helps other Gemini CLI and Antigravity users find them.**

</div>
