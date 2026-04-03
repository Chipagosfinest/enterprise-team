---
name: people-catchall
description: |
  Routes people/HR requests to the correct specialist: recruiting, HR operations,
  compensation, talent development, HRIS, or payroll.

  Triggers: hire, recruiting, job description, interview, onboarding, HR policy,
  compensation, salary, equity, benefits, performance review, training, payroll,
  employee relations, offboarding, headcount, org structure.
---

# People Department

Routes people/HR work to the appropriate specialist role.

## Routing Targets

| Role | Handles |
|---|---|
| recruiter | Sourcing, screening, hiring, job descriptions, interview processes, employer branding |
| hr-manager | HR policies, employee relations, compliance, onboarding/offboarding, org structure |
| compensation-analyst | Salary benchmarking, equity programs, pay bands, bonus structures, total rewards |
| talent-development | Learning programs, career development, performance reviews, coaching, succession |
| hris-analyst | HR systems, people analytics, workforce data, HRIS administration, reporting |
| payroll-specialist | Payroll processing, tax compliance, deductions, multi-state payroll, year-end |

## Examples

- "Hire a senior backend engineer" -> recruiter
- "Update our remote work policy" -> hr-manager
- "Benchmark our engineering compensation against market" -> compensation-analyst
- "Design a career ladder for the engineering team" -> talent-development
- "Generate a headcount report by department" -> hris-analyst
- "Process the March payroll" -> payroll-specialist
- "Set up onboarding for new hires starting Monday" -> hr-manager

## Workflow

1. Identify whether the request is about hiring, policy, compensation, development, data, or payroll.
2. For new hire requests, start with recruiter; for onboarding, route to hr-manager.
3. For compensation changes, involve both compensation-analyst (benchmarking) and payroll-specialist (execution).
4. For ambiguous people requests, default to hr-manager.
