---
name: handoff-protocol
description: |
  Structured templates for agent-to-agent communication and quality gates.
  Use when work flows between agents/departments.

  Triggers: handoff, hand off, pass to, route to, transfer, quality gate,
  QA review, escalate, sprint boundary, incident, phase gate.
---

# Handoff Protocol

Standardized templates for agent-to-agent handoffs. Use these to prevent context loss — the #1 cause of multi-agent coordination failure.

## 1. Standard Handoff (any agent-to-agent transfer)

```markdown
## Handoff
| From | [Agent/Department] |
| To | [Agent/Department] |
| Priority | [Critical / High / Medium / Low] |

## Context
**Current State**: [What's been completed]
**Relevant Files**: [file paths and what they contain]
**Dependencies**: [What this depends on]
**Constraints**: [Technical, timeline, resource]

## Deliverable Request
**What's needed**: [Specific, measurable deliverable]
**Acceptance criteria**:
- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]

## Quality Expectations
**Must pass**: [Specific quality bar]
**Evidence required**: [What proof looks like]
```

## 2. QA Verdict: PASS

```markdown
## QA Verdict: PASS
| Task | [Description] |
| Attempt | [N] of 3 |

**Verified**:
- [x] [Criterion 1] — verified via [evidence]
- [x] [Criterion 2] — verified via [evidence]

**Next**: Mark complete, advance to next task.
```

## 3. QA Verdict: FAIL

```markdown
## QA Verdict: FAIL
| Task | [Description] |
| Attempt | [N] of 3 |

### Issues Found
**Issue 1**: [Severity: Critical/High/Medium]
- Expected: [What should happen]
- Actual: [What actually happens]
- Fix: [Specific instruction]
- File: [Exact path]

**Retry Instructions**:
1. Fix ONLY the issues listed above
2. Do NOT introduce new features
3. This is attempt [N] of 3 maximum
4. If attempt 3 fails → escalation
```

## 4. Escalation Report (task exceeds 3 retries)

```markdown
## Escalation Report
| Task | [Description] |
| Attempts Exhausted | 3/3 |

### Failure History
- Attempt 1: [Issue] → [Fix applied] → [Why it still failed]
- Attempt 2: [Issue] → [Fix applied] → [Why it still failed]
- Attempt 3: [Issue] → [Fix applied] → [Why it still failed]

### Root Cause
[Why the task keeps failing]

### Recommended Resolution
- [ ] Reassign to different specialist
- [ ] Decompose into smaller sub-tasks
- [ ] Revise approach (architecture change needed)
- [ ] Accept current state with documented limitations
```

## 5. Phase Gate (transitioning between project phases)

```markdown
## Phase Gate
| From | Phase [N] — [Name] |
| To | Phase [N+1] — [Name] |
| Result | PASSED / FAILED |

### Gate Criteria
| Criterion | Threshold | Result | Evidence |
|-----------|-----------|--------|----------|
| [Criterion] | [Threshold] | PASS/FAIL | [Evidence] |

### Carried Forward
- [Key constraint from this phase]
- [Risk identified]

### Next Phase Agents
| Agent | Role | Priority |
|-------|------|----------|
| [Agent] | [Role] | Immediate/Day 2 |
```

## Dev↔QA Loop

Defined in `enterprise-orchestrator`. Uses templates #2 (PASS), #3 (FAIL), and #4 (Escalation) above.
