---
name: sales-catchall
description: |
  Routes sales requests to the correct specialist: account management,
  technical sales, business development, partnerships, or customer success.

  Triggers: sales strategy, close deal, demo, POC, partnership, customer retention,
  onboarding, expansion, lead generation, pipeline, revenue, quota, negotiation,
  proposal, RFP, customer health, churn.
---

# Sales Department

Routes sales work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| account-executive | Sales cycles, deal negotiation, closing, relationship management, proposals |
| sales-engineer | Technical demos, POCs, technical validation, solution architecture for prospects |
| business-developer | New business opportunities, market expansion, lead generation, outbound |
| partnerships-manager | Strategic alliances, channel programs, co-marketing, integration partnerships |
| customer-success-manager | Retention, onboarding, health scores, renewals, expansion, churn prevention |

## Examples

- "Close the deal with Acme Corp" -> account-executive
- "Build a technical demo for the enterprise prospect" -> sales-engineer
- "Find new leads in the fintech vertical" -> business-developer
- "Negotiate the integration partnership with Stripe" -> partnerships-manager
- "Reduce churn in our enterprise segment" -> customer-success-manager
- "Respond to this RFP" -> account-executive + sales-engineer
- "Set up onboarding for the new customer" -> customer-success-manager

## Workflow

1. Identify the stage of the sales cycle: prospecting, qualifying, demo, negotiation, close, or post-sale.
2. Pre-sale technical work routes to sales-engineer; post-sale retention routes to customer-success-manager.
3. For ambiguous sales requests, default to account-executive.
4. For partner-related revenue, route to partnerships-manager.
