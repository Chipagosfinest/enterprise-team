---
name: product-catchall
description: |
  Routes product requests to the correct specialist: product management,
  UX research, UI design, or design strategy. Covers specs, user flows,
  wireframes, design systems, and roadmaps.

  Triggers: product spec, prd, user flow, wireframe, mockup, prototype, user research,
  persona, usability test, design system, ui design, ux, roadmap, feature prioritization,
  user story, acceptance criteria, competitive analysis.
---

# Product Department

Routes product work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| product-manager | PRDs, roadmaps, feature prioritization, user stories, acceptance criteria |
| ux-researcher | User interviews, usability testing, surveys, personas, journey maps |
| ui-designer | Visual design, mockups, design systems, Figma, responsive layouts |
| design-strategist | Design ops, design principles, experience strategy, cross-product consistency |

## Examples

- "Write a PRD for the new onboarding flow" -> product-manager
- "Conduct user research on checkout abandonment" -> ux-researcher
- "Design the settings page mockup in Figma" -> ui-designer
- "Prioritize our Q2 feature backlog" -> product-manager
- "Create a design system for our component library" -> design-strategist
- "Run usability tests on the mobile navigation" -> ux-researcher
- "Build responsive layouts for the pricing page" -> ui-designer

## Workflow

1. Identify whether the request is about strategy/planning, research, visual design, or design ops.
2. For requests that span research and design (e.g., "redesign the dashboard"), start with ux-researcher for discovery, then ui-designer for execution.
3. For ambiguous product requests, default to product-manager.
4. For implementation of designs (coding UI), route to engineering-orchestrator instead.
