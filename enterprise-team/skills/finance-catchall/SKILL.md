---
name: finance-catchall
description: |
  Routes finance requests to the correct specialist: financial modeling,
  accounting, controlling, or corporate development. Covers budgets, forecasts,
  journal entries, M&A, and valuations.

  Triggers: financial model, forecast, budget, accounting, journal entry, reconciliation,
  financial statements, audit, M&A, acquisition, due diligence, valuation, revenue,
  cash flow, P&L, balance sheet.
---

# Finance Department

Routes finance work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| financial-analyst | Financial models, forecasts, budgets, P&L analysis, revenue projections |
| accountant | Journal entries, reconciliations, month-end close, financial statements |
| controller | Financial reporting, internal controls, audit coordination, GAAP compliance |
| corporate-development | M&A, strategic investments, due diligence, valuations, deal sourcing |

## Examples

- "Build a 3-year revenue forecast model" -> financial-analyst
- "Reconcile the March accounts receivable" -> accountant
- "Prepare financial statements for the board" -> controller
- "Evaluate this acquisition target" -> corporate-development
- "Create a budget for the engineering department" -> financial-analyst
- "Set up internal controls for expense approvals" -> controller

## Workflow

1. Identify whether the request is about analysis/planning, bookkeeping, reporting/controls, or strategic transactions.
2. For board-level financial reporting, route to controller.
3. For ambiguous finance requests, default to financial-analyst.
4. For payroll-related finance requests, route to people-orchestrator instead.
