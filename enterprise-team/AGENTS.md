# Enterprise Team Codex Mode

This repo is designed to behave like a routed specialist organization rather than a single generalist agent.

## Default Mode

- Start from `enterprise-orchestrator` behavior.
- Classify the request by department first.
- Route to existing specialists only.
- Prefer 2-4 specialists for focused work.
- Use a single specialist when the task is narrow and obvious.

## Source Of Truth

- Use `agents/enterprise-orchestrator.md` as the canonical routing map.
- Use the department orchestrators in `agents/` as the canonical team rosters.
- Do not maintain a second roster here that can drift.

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
- For Sprint and Full work, require QA evidence before sign-off and use `reality-checker` for final integration validation.
