#!/usr/bin/env bash
#
# verify-task-scope.sh — PostToolUse hook for Task tool
#
# Deterministic enforcement of task-scope declarations. Runs after every Task tool
# invocation and rejects work products that touched files outside their declared scope.
#
# Installation:
#   1. Make executable: chmod +x enterprise-team/hooks/verify-task-scope.sh
#   2. Register in settings.json:
#      {
#        "hooks": {
#          "PostToolUse": [
#            {
#              "matcher": "Task",
#              "hooks": [{ "type": "command", "command": "$CLAUDE_PLUGIN_ROOT/hooks/verify-task-scope.sh" }]
#            }
#          ]
#        }
#      }
#
# Input (stdin): JSON from Claude Code hook runtime containing tool_input and tool_response
# Output: exit 0 = OK; exit 2 = scope violation (blocks acceptance, feedback returned to Claude)

set -euo pipefail

INPUT=$(cat)

# Extract the task prompt from tool_input
TASK_PROMPT=$(echo "$INPUT" | jq -r '.tool_input.prompt // empty')

# If no Expected file scope declared, skip verification (agent used Task tool outside the
# enterprise-team protocol — not our concern to enforce)
if ! echo "$TASK_PROMPT" | grep -q "Expected file scope"; then
  echo "verify-task-scope: no file scope declared, skipping" >&2
  exit 0
fi

# Parse the declared file scope.
# Format: "## Expected file scope: [file1, file2, ...]" OR
#         "| Expected file scope | [file1, file2, ...] |"
DECLARED=$(echo "$TASK_PROMPT" \
  | grep -oE 'Expected file scope[^\[]*\[[^]]*\]' \
  | head -1 \
  | grep -oE '\[[^]]*\]' \
  | tr -d '[]' \
  | tr ',' '\n' \
  | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
  | grep -v '^$' || true)

if [ -z "$DECLARED" ]; then
  echo "verify-task-scope: malformed file scope declaration, skipping" >&2
  exit 0
fi

# Compute changed files since the agent started.
# Prefer diff against the last commit the agent didn't make.
# In a worktree-isolated agent, HEAD~1 is a safe baseline.
CHANGED=$(git diff --name-only HEAD 2>/dev/null || true)
CHANGED="$CHANGED"$'\n'"$(git diff --cached --name-only 2>/dev/null || true)"
CHANGED="$CHANGED"$'\n'"$(git ls-files --others --exclude-standard 2>/dev/null || true)"
CHANGED=$(echo "$CHANGED" | grep -v '^$' | sort -u)

if [ -z "$CHANGED" ]; then
  echo "verify-task-scope: no file changes detected, OK" >&2
  exit 0
fi

# Check each changed file against the declared scope.
# A file matches if any declared pattern:
#   (a) is the literal file path
#   (b) is a directory prefix (declared ends with /)
#   (c) is a glob that matches (declared contains * or ?)
VIOLATIONS=()

while IFS= read -r file; do
  [ -z "$file" ] && continue
  allowed=0
  while IFS= read -r pattern; do
    [ -z "$pattern" ] && continue
    # Literal match
    if [ "$file" = "$pattern" ]; then
      allowed=1
      break
    fi
    # Directory prefix match
    case "$pattern" in
      */)
        case "$file" in
          "$pattern"*) allowed=1; break ;;
        esac
        ;;
    esac
    # Glob match
    case "$pattern" in
      *\**|*\?*)
        # shellcheck disable=SC2254
        case "$file" in
          $pattern) allowed=1; break ;;
        esac
        ;;
    esac
  done <<< "$DECLARED"

  if [ "$allowed" -eq 0 ]; then
    VIOLATIONS+=("$file")
  fi
done <<< "$CHANGED"

if [ ${#VIOLATIONS[@]} -gt 0 ]; then
  cat <<EOF >&2
SCOPE VIOLATION: Task modified files outside its declared scope.

Declared scope:
$(echo "$DECLARED" | sed 's/^/  - /')

Undeclared changes:
$(printf '  - %s\n' "${VIOLATIONS[@]}")

Action required:
  1. File a scope-expansion Interaction Record (type: consultation) justifying each undeclared change, OR
  2. Revert the undeclared changes and re-submit work within declared scope.

Unrecorded peer-driven changes are invalid work products per the enterprise-team
collaboration protocol. See enterprise-team/skills/handoff-protocol/SKILL.md.
EOF
  exit 2
fi

echo "verify-task-scope: all ${#CHANGED} changed files within declared scope, OK" >&2
exit 0
