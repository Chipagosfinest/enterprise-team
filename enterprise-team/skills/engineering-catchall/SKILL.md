---
name: engineering-catchall
description: |
  Routes engineering requests to the correct specialist based on technology domain,
  task type, and stack involved. Covers backend, frontend, mobile, fullstack, embedded,
  blockchain, ML/AI, QA, architecture, and technical documentation.

  Triggers: build feature, write code, implement, develop, api, component, mobile app, ios,
  android, react, vue, node, python, smart contract, machine learning, system design,
  testing, QA, documentation, architecture, deploy, CI/CD, database, microservices.
---

# Engineering Department

Routes engineering work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| backend-engineer | APIs, servers, databases, microservices, authentication |
| frontend-engineer | Web UI, React/Vue/Angular components, CSS, accessibility |
| fullstack-engineer | End-to-end features spanning client and server |
| mobile-developer | iOS (Swift), Android (Kotlin), React Native, Flutter apps |
| embedded-engineer | Firmware, IoT devices, RTOS, hardware interfaces |
| blockchain-engineer | Smart contracts, Solidity, DeFi protocols, on-chain logic |
| ml-developer | Model training, data pipelines, inference, NLP, computer vision |
| solutions-architect | System design, infrastructure planning, scaling strategy |
| qa-engineer | Test plans, automation frameworks, regression, load testing |
| technical-writer | API docs, runbooks, architecture decision records |

## Examples

- "Build a REST API for user management" -> backend-engineer
- "Create a responsive dashboard with React" -> frontend-engineer
- "Add a new feature with a form that saves to the database" -> fullstack-engineer
- "Build an iOS app for scanning barcodes" -> mobile-developer
- "Write firmware for the temperature sensor module" -> embedded-engineer
- "Deploy an ERC-20 token contract" -> blockchain-engineer
- "Train a classification model on our support tickets" -> ml-developer
- "Design the architecture for our event-driven order system" -> solutions-architect
- "Set up end-to-end tests for the checkout flow" -> qa-engineer
- "Write API reference docs for the payments service" -> technical-writer

## Workflow

1. Identify the primary technology domain from the user request.
2. If the request spans multiple domains, route to the role closest to the core task.
3. For ambiguous requests (e.g., "build a feature"), default to fullstack-engineer.
4. For requests focused on planning or design rather than implementation, route to solutions-architect.
