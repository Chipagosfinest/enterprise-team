# Enterprise Team - Hire a Whole Company

One plugin to staff your entire virtual organization with 50+ specialized AI agents.

## Quick Install

```bash
# Install the full enterprise team
npx skills add Chipagosfinest/enterprise-team --yes
```

## What You Get

```
                    enterprise-orchestrator
                            │
        ┌───────────┬───────┴───────┬───────────┐
        ▼           ▼               ▼           ▼
   Engineering  Infrastructure   Product    Business
        │           │               │           │
   ┌────┴────┐  ┌───┴───┐     ┌────┴────┐  ┌───┴───┐
   backend   devops    product   sales
   frontend  sre       ux        marketing
   mobile    database  ui        finance
   fullstack deploy    review    legal
   ml        platform            hr
   blockchain
   embedded
```

## Departments

| Department | Orchestrator | Agents |
|------------|--------------|--------|
| **Engineering** | `engineering-orchestrator` | backend, frontend, mobile, fullstack, embedded, blockchain, ML, architect, reviewer, debugger, docs |
| **Infrastructure** | `infrastructure-orchestrator` | devops, sre, database, deployment, sysadmin, platform |
| **Product** | `product-orchestrator` | product-architect, product-manager, ux-researcher, ui-designer, reviewer |
| **Data** | `data-orchestrator` | data-engineer, analytics, qa, test-architect, ci-engineer, data-scientist |
| **Security** | `security-orchestrator` | security-engineer, auditor, compliance |
| **Business** | `business-orchestrator` | sales, marketing, finance, legal, hr |

## Usage

Just describe what you need - the orchestrator routes to the right specialist:

```
"Build a REST API for user management"
→ engineering-orchestrator → backend-engineer

"Set up CI/CD with GitHub Actions"
→ infrastructure-orchestrator → devops-engineer

"Design a settings page with dark mode"
→ product-orchestrator → product-architect → ui-designer

"Create a financial model for Q2"
→ business-orchestrator → financial-analyst
```

## Install Individual Departments

Don't need the whole company? Install just what you need:

```bash
# Engineering only
npx skills add Chipagosfinest/engineering-team --yes

# Infrastructure only
npx skills add Chipagosfinest/infrastructure-team --yes

# Product & Design only
npx skills add Chipagosfinest/product-design-team --yes

# DevOps & SRE only
npx skills add Chipagosfinest/devops-team --yes

# Data & Analytics only
npx skills add Chipagosfinest/data-team --yes

# Security only
npx skills add Chipagosfinest/security-team --yes

# QA & Testing only
npx skills add Chipagosfinest/qa-team --yes
```

## Manual Install

```bash
git clone https://github.com/Chipagosfinest/enterprise-team.git ~/.claude/plugins/enterprise-team
```

## How It Works

1. **Passive Activation** - Skills auto-trigger on relevant keywords
2. **Smart Routing** - Orchestrators (opus model) route to the right specialist
3. **Deep Expertise** - Each specialist agent has domain-specific knowledge

## License

MIT
