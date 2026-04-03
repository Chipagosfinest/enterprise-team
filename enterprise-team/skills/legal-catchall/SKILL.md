---
name: legal-catchall
description: |
  Routes legal requests to the correct specialist: legal counsel, compliance,
  contracts, or paralegal support. Covers contracts, IP, regulatory, privacy,
  and corporate legal matters.

  Triggers: contract review, legal advice, compliance, GDPR, SOC2, NDA, terms of service,
  privacy policy, IP, trademark, litigation, regulatory, vendor agreement, employment law,
  data processing agreement.
---

# Legal Department

Routes legal work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| legal-counsel | Legal guidance, IP, corporate matters, risk assessment, litigation |
| compliance-officer | Regulatory compliance, GDPR, SOC2, HIPAA, audits, compliance programs |
| contract-manager | Contract lifecycle, vendor negotiations, SLAs, renewals, amendments |
| paralegal | Document preparation, research, filings, contract review support |

## Examples

- "Review the IP implications of using this open-source library" -> legal-counsel
- "Ensure our data processing is GDPR-compliant" -> compliance-officer
- "Negotiate the vendor contract with AWS" -> contract-manager
- "Prepare the NDA for the partnership discussion" -> paralegal
- "Draft terms of service for our new product" -> legal-counsel
- "Review the SLA terms in this enterprise contract" -> contract-manager

## Workflow

1. Identify whether the request is about legal strategy, compliance, contracts, or document prep.
2. For compliance questions that may have legal implications, involve both compliance-officer and legal-counsel.
3. For routine document preparation, route to paralegal; for strategic decisions, route to legal-counsel.
4. For security compliance (SOC2 technical controls), coordinate with security-orchestrator.
