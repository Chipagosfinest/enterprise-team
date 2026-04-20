# Enterprise Team — Codex Mode

This repo behaves like a routed specialist organization with **capability-based routing**, **risk-gated review**, and **task-ID-scoped work products**. The same protocol works in Claude Code (plugin mode) and Codex-style environments.

## Default Mode

- Start from `enterprise-orchestrator` behavior.
- Classify the request by **capability domain** first, not by department.
- Route to existing specialists only — verify in `agents/`.
- Prefer 2-4 specialists for focused work. Single specialist when the task is narrow and obvious.

## Source Of Truth

- `agents/enterprise-orchestrator.md` — canonical routing map and protocol.
- Department orchestrators in `agents/` — canonical team rosters per domain.
- `capability-aliases.yaml` — controlled capability domains + qualifier aliases.
- `skills/handoff-protocol/SKILL.md` — Interaction Record format and evidence bundles.
- Do not duplicate these rosters here.

## Capability Routing (replaces org-chart escalation)

Every agent declares capabilities in frontmatter using the controlled vocabulary:

```yaml
capabilities:
  - auth: [oauth2, pkce, jwt]
  - backend: [nodejs, python]
  - database: [postgresql, supabase, rls]
```

Routing algorithm:

1. Extract the capability requirement from the task (domain + optional qualifiers).
2. Normalize qualifiers (lowercase, trim, check alias map in `capability-aliases.yaml`).
3. Match agents whose frontmatter declares the domain.
4. Tie-break in this priority order: (1) qualifier match, (2) fewer current assignments, (3) same department, (4) pick and document why.
5. Emit a **Routing Decision** artifact with requested capability, matched agents, selected, rejected, and tie-break rule.

## Task ID Gating

Every task gets an orchestrator-issued ID (`DEPT-NNN`, e.g., `ENG-042`) and a declared file scope. Agents must file a scope-expansion Interaction Record before touching undeclared files. Undeclared changes are invalid work products — agent must revert or file the expansion record.

## Risk Classes and Evidence

Risk is classified at dispatch and re-evaluated at completion:

- **Low** (docs, configs, typos): file list + brief description.
- **Medium** (features, refactors, API changes): file list + test output mapped to criteria + before/after + breaking-change notes. Reviewer: `qa-engineer`.
- **High** (security, auth, payments, migrations, env vars): file list + test output + security implications + rollback plan + reviewer sign-off + before/after. Reviewer: `reality-checker`. Cannot auto-approve.

Reclassification triggers (applied on completion):
- LOW → MEDIUM if >3 files changed, test files modified, or API routes modified.
- MEDIUM → HIGH if auth/security/migration/payment/env-var files touched.

If reclassified, the higher risk class's evidence requirements apply retroactively.

## Failure-Reason Routing (replaces retry count)

When a specialist escalates, they classify the failure type:

- `wrong-capability` — reroute to the capability actually needed
- `task-too-large` — decompose into subtasks
- `conflicting-requirements` — escalate to product-manager for spec clarity
- `environment-issue` — route to devops-engineer or sre
- `insufficient-context` — route to the knowledge holder
- `unknown` — orchestrator investigates

Retry count is a fallback signal, not the primary one.

## Agent Teams Authority (when available)

If Agent Teams is enabled, peers can message each other directly, but:

- Peers may **propose**, not commit.
- Consequential exchanges produce **Interaction Records** before any code changes.
- The orchestrator is the single source of authority for acceptance.
- No side-channel decisions — any peer-driven change notifies the orchestrator first.

## Guardrails

- Do not reference specialists that do not exist in `agents/`.
- Every routing decision produces an auditable Routing Decision artifact.
- Every consequential exchange produces an Interaction Record.
- Every task carries a Task ID and declared file scope.
- High-risk work cannot be auto-approved; blocks to user if no reviewer available.
- Evidence bundles are **conjunctive** — all listed items required, not a menu.
