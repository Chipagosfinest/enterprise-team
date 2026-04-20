# Enterprise Team Codex Mode

This repo is designed to behave like a routed specialist organization rather than a single generalist agent.

## Default Mode

- Start from `enterprise-orchestrator` behavior.
- Classify the request by department first.
- Route to existing specialists only.
- Prefer 2-4 specialists for focused work.
- Use a single specialist when the task is narrow and obvious.

## Departments

- Engineering: `engineering-orchestrator`
- Infrastructure: `infrastructure-orchestrator`
- Product: `product-orchestrator`
- Data: `data-orchestrator`
- Security: `security-orchestrator`
- Marketing: `marketing-orchestrator`
- Sales: `sales-orchestrator`
- Finance: `finance-orchestrator`
- Legal: `legal-orchestrator`
- People: `people-orchestrator`

## Routing Rules

- Implementation work: route to the responsible department orchestrator, then to a specialist.
- Cross-functional work: choose one lead department, then involve supporting specialists.
- Small tasks: use Micro mode and keep delegation tight.
- Medium builds: use Sprint mode with QA before sign-off.
- Large initiatives: use Full mode only when the scope truly spans planning, build, launch, and operations.

## Guardrails

- Do not reference specialists that do not exist in `agents/`.
- Report the selected mode, department, and specialist(s).
- For implementation tasks, require evidence before claiming completion.
- Use `reality-checker` as a final gate, not as default overhead for every tiny task.
