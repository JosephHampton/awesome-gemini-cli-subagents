<div align="center">

# 🤖 Awesome Gemini CLI Subagents [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

### A curated collection of production-ready subagents for [Gemini CLI](https://github.com/google-gemini/gemini-cli).

**81 specialist subagents** across 9 domains — drop them into `.gemini/agents/` and let Gemini CLI delegate the right expert for the job.

[![License: CC0-1.0](https://img.shields.io/badge/License-CC0%201.0-lightgrey.svg)](LICENSE)
![Subagents](https://img.shields.io/badge/subagents-81-4285F4)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
![Gemini CLI](https://img.shields.io/badge/for-Gemini%20CLI-8E75B2)

</div>

---

## What is this?

[Gemini CLI](https://github.com/google-gemini/gemini-cli) supports **subagents**: focused, specialist AI assistants that the main agent can delegate to. Each subagent has its own system prompt, its own tools, and its own context window, so it stays sharp on one job instead of trying to be good at everything.

This repo is a curated, ready-to-use library of them. Every agent is a single Markdown file with the official frontmatter format, written to be genuinely useful rather than a one-line stub. Copy the ones you want and go.

## Why subagents?

- **Focus** — a `code-reviewer` that only reviews beats a general assistant that sometimes reviews.
- **Isolated context** — each subagent works in its own context window, so a big task does not pollute your main conversation.
- **Tool scoping** — a read-only `security-auditor` cannot accidentally write files; tools are declared per agent.
- **Composability** — chain them. Let `tech-lead-orchestrator` plan, then hand pieces to the specialists.

## Quick start

**Install everything (user-level, available in every project):**

```bash
git clone https://github.com/JosephHampton/awesome-gemini-cli-subagents.git
cd awesome-gemini-cli-subagents
./install-agents.sh          # copies all agents to ~/.gemini/agents/
```

**Install one agent manually:**

```bash
# User-level (all projects)
cp agents/quality-testing/code-reviewer.md ~/.gemini/agents/

# Project-level (this repo only, shareable with your team)
mkdir -p .gemini/agents
cp agents/quality-testing/code-reviewer.md .gemini/agents/
```

Then in Gemini CLI just describe the work — *"review this diff for security issues"* — and it will delegate to the matching subagent. You can also list and manage them with the `/agents` command.

## How a subagent is defined

Every agent is a Markdown file with YAML frontmatter. The body becomes the agent's system prompt:

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
You are a defensive security reviewer. Your job is to help teams find and
fix weaknesses in their own code before release...
```

| Field | Required | Purpose |
|-------|:--------:|---------|
| `name` | ✅ | Unique slug used as the tool name |
| `description` | ✅ | When to use this agent (helps the router pick it) |
| `kind` | | `local` (default) or `remote` |
| `tools` | | Tool allowlist; supports `*` and `mcp_*` wildcards |
| `model` | | Pin a model, or inherit the session's |
| `temperature` | | `0.0`–`2.0` |
| `max_turns` | | Turn budget for the agent |

See the [official Gemini CLI subagents docs](https://geminicli.com/docs/core/subagents/) for the full reference.

---

## 📚 The Collection

- [🏗️ Core Development](#-core-development) · [🧠 Language Specialists](#-language-specialists) · [☁️ Infrastructure & DevOps](#-infrastructure--devops)
- [✅ Quality & Testing](#-quality--testing) · [🛡️ Security](#-security) · [📊 Data, AI & Databases](#-data-ai--databases)
- [🧰 Developer Experience](#-developer-experience) · [🎯 Specialized Domains](#-specialized-domains) · [🧭 Product & Orchestration](#-product--orchestration)

### 🏗️ Core Development

| Agent | What it does |
|-------|--------------|
| [`backend-architect`](agents/core-development/backend-architect.md) | Scalable backend systems, service boundaries, and data models |
| [`frontend-developer`](agents/core-development/frontend-developer.md) | Accessible, performant UI components and state |
| [`fullstack-engineer`](agents/core-development/fullstack-engineer.md) | End-to-end vertical feature slices across the whole stack |
| [`api-designer`](agents/core-development/api-designer.md) | Clean, consistent REST / GraphQL / gRPC contracts |
| [`microservices-architect`](agents/core-development/microservices-architect.md) | Service decomposition and distributed-system design |
| [`mobile-app-developer`](agents/core-development/mobile-app-developer.md) | Cross-platform and native mobile features |
| [`graphql-architect`](agents/core-development/graphql-architect.md) | GraphQL schemas, resolvers, and federation without N+1s |
| [`electron-desktop-developer`](agents/core-development/electron-desktop-developer.md) | Secure Electron apps with native-feeling UX |
| [`browser-extension-developer`](agents/core-development/browser-extension-developer.md) | Manifest V3 extensions for Chrome and Firefox |
| [`realtime-websocket-engineer`](agents/core-development/realtime-websocket-engineer.md) | WebSocket / SSE systems that survive disconnects |

### 🧠 Language Specialists

| Agent | What it does |
|-------|--------------|
| [`typescript-pro`](agents/language-specialists/typescript-pro.md) | Advanced, type-safe TypeScript |
| [`python-pro`](agents/language-specialists/python-pro.md) | Clean, idiomatic, fully typed Python |
| [`go-pro`](agents/language-specialists/go-pro.md) | Idiomatic, concurrent Go |
| [`rust-pro`](agents/language-specialists/rust-pro.md) | Safe, idiomatic Rust that works with the borrow checker |
| [`java-pro`](agents/language-specialists/java-pro.md) | Modern Java and the JVM ecosystem |
| [`react-pro`](agents/language-specialists/react-pro.md) | Modern React patterns, hooks, and performance |
| [`nextjs-pro`](agents/language-specialists/nextjs-pro.md) | Next.js App Router, server components, and rendering strategy |
| [`vue-pro`](agents/language-specialists/vue-pro.md) | Vue 3 Composition API, Pinia, and Nuxt |
| [`angular-pro`](agents/language-specialists/angular-pro.md) | Modern Angular with signals and standalone components |
| [`svelte-pro`](agents/language-specialists/svelte-pro.md) | Svelte 5 runes and SvelteKit |
| [`flutter-pro`](agents/language-specialists/flutter-pro.md) | Flutter and Dart for fast native-feeling apps |
| [`swift-ios-pro`](agents/language-specialists/swift-ios-pro.md) | SwiftUI and structured concurrency on iOS |
| [`kotlin-android-pro`](agents/language-specialists/kotlin-android-pro.md) | Kotlin and Jetpack Compose on Android |
| [`csharp-dotnet-pro`](agents/language-specialists/csharp-dotnet-pro.md) | Modern C# and ASP.NET Core |
| [`laravel-pro`](agents/language-specialists/laravel-pro.md) | PHP and Laravel the way the framework intends |
| [`rails-pro`](agents/language-specialists/rails-pro.md) | Ruby on Rails with convention over configuration |
| [`cpp-pro`](agents/language-specialists/cpp-pro.md) | Modern C++ with RAII discipline and sanitizers |

### ☁️ Infrastructure & DevOps

| Agent | What it does |
|-------|--------------|
| [`devops-engineer`](agents/infrastructure-devops/devops-engineer.md) | CI/CD pipelines and release automation |
| [`kubernetes-operator`](agents/infrastructure-devops/kubernetes-operator.md) | K8s workloads, manifests, and troubleshooting |
| [`terraform-engineer`](agents/infrastructure-devops/terraform-engineer.md) | Modular, safe Terraform / OpenTofu |
| [`cloud-architect`](agents/infrastructure-devops/cloud-architect.md) | Cloud infra on AWS / GCP / Azure with cost in mind |
| [`docker-specialist`](agents/infrastructure-devops/docker-specialist.md) | Lean, secure Dockerfiles and Compose setups |
| [`sre-incident-responder`](agents/infrastructure-devops/sre-incident-responder.md) | Incident triage and blameless postmortems |
| [`aws-specialist`](agents/infrastructure-devops/aws-specialist.md) | AWS services, IAM, networking, and cost awareness |
| [`github-actions-specialist`](agents/infrastructure-devops/github-actions-specialist.md) | Fast, secure GitHub Actions pipelines |
| [`serverless-architect`](agents/infrastructure-devops/serverless-architect.md) | Event-driven serverless with idempotency built in |
| [`observability-engineer`](agents/infrastructure-devops/observability-engineer.md) | Logs, metrics, traces, SLOs, and alerts that matter |
| [`cicd-pipeline-engineer`](agents/infrastructure-devops/cicd-pipeline-engineer.md) | Build-once promotion pipelines with tested rollback |

### ✅ Quality & Testing

| Agent | What it does |
|-------|--------------|
| [`code-reviewer`](agents/quality-testing/code-reviewer.md) | Thorough, prioritized code review |
| [`test-automator`](agents/quality-testing/test-automator.md) | Meaningful unit and integration tests |
| [`e2e-tester`](agents/quality-testing/e2e-tester.md) | Stable Playwright / Cypress end-to-end tests |
| [`performance-optimizer`](agents/quality-testing/performance-optimizer.md) | Evidence-based performance fixes |
| [`debugger`](agents/quality-testing/debugger.md) | Systematic root-cause debugging |
| [`refactoring-specialist`](agents/quality-testing/refactoring-specialist.md) | Safe, behaviour-preserving refactors |
| [`load-testing-engineer`](agents/quality-testing/load-testing-engineer.md) | Realistic load tests that name the bottleneck |
| [`visual-regression-tester`](agents/quality-testing/visual-regression-tester.md) | Flake-proof screenshot testing for UI changes |

### 🛡️ Security

| Agent | What it does |
|-------|--------------|
| [`security-auditor`](agents/security/security-auditor.md) | Defensive code review for common vulnerability classes |
| [`dependency-auditor`](agents/security/dependency-auditor.md) | Third-party CVE and supply-chain review |
| [`secrets-detector`](agents/security/secrets-detector.md) | Detect committed secrets so they can be rotated and removed |
| [`threat-modeler`](agents/security/threat-modeler.md) | Design-time STRIDE threat modeling |
| [`auth-reviewer`](agents/security/auth-reviewer.md) | Review authentication and authorization logic |
| [`container-security-auditor`](agents/security/container-security-auditor.md) | Image, Kubernetes, and supply-chain hardening |

### 📊 Data, AI & Databases

| Agent | What it does |
|-------|--------------|
| [`data-engineer`](agents/data-ai-databases/data-engineer.md) | Reliable ETL / ELT and data pipelines |
| [`ml-engineer`](agents/data-ai-databases/ml-engineer.md) | Reproducible ML training, evaluation, and deployment |
| [`prompt-engineer`](agents/data-ai-databases/prompt-engineer.md) | Testable LLM prompts and agent instructions |
| [`sql-pro`](agents/data-ai-databases/sql-pro.md) | Query writing and performance tuning |
| [`postgres-expert`](agents/data-ai-databases/postgres-expert.md) | Deep PostgreSQL tuning and features |
| [`database-designer`](agents/data-ai-databases/database-designer.md) | Relational schema and data modeling |
| [`analytics-engineer`](agents/data-ai-databases/analytics-engineer.md) | Trustworthy analytics models and metrics |
| [`llm-integration-engineer`](agents/data-ai-databases/llm-integration-engineer.md) | LLM product features with evals and cost control |
| [`rag-architect`](agents/data-ai-databases/rag-architect.md) | Retrieval-augmented generation that cites its sources |
| [`mongodb-expert`](agents/data-ai-databases/mongodb-expert.md) | Document modelling and aggregation performance |
| [`redis-expert`](agents/data-ai-databases/redis-expert.md) | Caching, queues, and realtime data in Redis |
| [`mlops-engineer`](agents/data-ai-databases/mlops-engineer.md) | Reproducible training pipelines and monitored models |
| [`data-visualization-engineer`](agents/data-ai-databases/data-visualization-engineer.md) | Honest, fast charts and dashboards |

### 🧰 Developer Experience

| Agent | What it does |
|-------|--------------|
| [`documentation-writer`](agents/developer-experience/documentation-writer.md) | Clear developer and user documentation |
| [`api-documenter`](agents/developer-experience/api-documenter.md) | Accurate API reference and OpenAPI specs |
| [`git-workflow-manager`](agents/developer-experience/git-workflow-manager.md) | Clean Git history and workflow |
| [`dependency-upgrader`](agents/developer-experience/dependency-upgrader.md) | Safe, staged dependency upgrades |
| [`dx-optimizer`](agents/developer-experience/dx-optimizer.md) | Faster builds and a smoother local dev loop |
| [`monorepo-manager`](agents/developer-experience/monorepo-manager.md) | Turborepo / Nx / workspaces with trustworthy caching |

### 🎯 Specialized Domains

| Agent | What it does |
|-------|--------------|
| [`accessibility-auditor`](agents/specialized-domains/accessibility-auditor.md) | WCAG accessibility audit and fixes |
| [`seo-optimizer`](agents/specialized-domains/seo-optimizer.md) | Technical and on-page SEO |
| [`blockchain-developer`](agents/specialized-domains/blockchain-developer.md) | Smart contracts and on-chain safety |
| [`game-developer`](agents/specialized-domains/game-developer.md) | Gameplay systems and real-time performance |
| [`embedded-systems-engineer`](agents/specialized-domains/embedded-systems-engineer.md) | Firmware for resource-constrained devices |
| [`stripe-payments-integrator`](agents/specialized-domains/stripe-payments-integrator.md) | Payment flows and webhooks treated as safety-critical |

### 🧭 Product & Orchestration

| Agent | What it does |
|-------|--------------|
| [`product-strategist`](agents/product-orchestration/product-strategist.md) | Scoping, specs, and ruthless prioritization |
| [`tech-lead-orchestrator`](agents/product-orchestration/tech-lead-orchestrator.md) | Decompose and sequence large tasks |
| [`code-archaeologist`](agents/product-orchestration/code-archaeologist.md) | Understand legacy and unfamiliar codebases |
| [`agent-workflow-designer`](agents/product-orchestration/agent-workflow-designer.md) | Design multi-agent workflows and pipelines |

---

## Contributing

New agents, improvements to existing prompts, and fixes are all welcome. Keep each agent focused, use the standard frontmatter, and write a system prompt you would actually want doing the job. See [CONTRIBUTING.md](CONTRIBUTING.md) for the short version.

## License

[CC0 1.0 Universal](LICENSE) — public domain. Copy, adapt, and use these agents freely, no attribution required.

<div align="center">

**If these subagents save you time, a ⭐ helps other Gemini CLI users find them.**

</div>
