---
name: infrastructure-catchall
description: |
  Routes infrastructure requests to the correct specialist based on domain:
  CI/CD, containers, cloud, databases, monitoring, reliability, and systems admin.

  Triggers: docker, kubernetes, terraform, ci/cd, github actions, deploy, railway, vercel,
  aws, database, postgresql, supabase, monitoring, alerting, incident, slo, reliability,
  nginx, ssl, dns, server, linux, networking.
---

# Infrastructure Department

Routes infrastructure work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| devops-engineer | CI/CD pipelines, Docker, Kubernetes, Terraform, GitHub Actions, deployments |
| sre | Monitoring, alerting, incident response, SLOs, reliability, on-call |
| database-engineer | PostgreSQL, schema design, query optimization, migrations, Redis, Supabase |
| systems-admin | Linux servers, networking, DNS, SSL, cloud platforms, security hardening |
| it-support | Technical support, IT infrastructure, access management, security incidents |

## Examples

- "Set up a CI/CD pipeline with GitHub Actions" -> devops-engineer
- "Configure monitoring and alerts for our API" -> sre
- "Optimize slow database queries on the users table" -> database-engineer
- "Set up DNS and SSL for our new domain" -> systems-admin
- "Deploy our app to Railway with Docker" -> devops-engineer
- "Investigate the production outage from last night" -> sre
- "Design the database schema for multi-tenancy" -> database-engineer
- "Set up VPN access for the team" -> systems-admin

## Workflow

1. Identify the infrastructure domain from the request.
2. If the request spans multiple domains (e.g., "deploy + monitor"), route to the role handling the primary action.
3. For incident-related requests, always route to sre first.
4. For database requests embedded in a feature build, consider routing to engineering-orchestrator instead.
