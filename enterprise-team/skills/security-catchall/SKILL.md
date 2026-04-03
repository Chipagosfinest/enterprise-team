---
name: security-catchall
description: |
  Routes security requests to the correct specialist: secure coding,
  auditing, compliance, or penetration testing. Covers OWASP, SOC2, GDPR,
  authentication, encryption, and vulnerability management.

  Triggers: security audit, vulnerability, penetration test, compliance, gdpr, soc2,
  secure coding, owasp, authentication, authorization, encryption, security policy,
  access control, secrets management, threat model.
---

# Security Department

Routes security work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| security-engineer | Secure coding, auth implementation, encryption, OWASP fixes, secrets management |
| security-auditor | Penetration testing, vulnerability assessments, threat modeling, risk reports |
| compliance-officer | SOC2, GDPR, HIPAA, regulatory audits, compliance programs, policy review |

## Examples

- "Review this auth implementation for vulnerabilities" -> security-engineer
- "Run a security audit on our API endpoints" -> security-auditor
- "Ensure our data handling is GDPR-compliant" -> compliance-officer
- "Fix the XSS vulnerability in the search input" -> security-engineer
- "Create a threat model for our payment system" -> security-auditor
- "Prepare documentation for our SOC2 audit" -> compliance-officer
- "Implement rate limiting and API key rotation" -> security-engineer

## Workflow

1. Identify whether the request is about implementation, assessment, or compliance.
2. For broad security reviews, start with security-auditor for assessment, then security-engineer for fixes.
3. For compliance-related requests, always involve compliance-officer.
4. For security incidents, route to sre (via infrastructure-orchestrator) for immediate response, then security-auditor for post-mortem.
