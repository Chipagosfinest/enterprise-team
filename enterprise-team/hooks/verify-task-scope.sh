#!/usr/bin/env bash
#
# verify-task-scope.sh — PostToolUse hook for Task tool
#
# Tier 2 enforcement of task-scope declarations. Runs after a Task tool invocation
# and rejects work products that touched files outside their declared scope.
#
# CORRECTNESS MODEL:
#   A "scope violation" means the subagent modified a file that was NOT in the
#   declared scope AND that file changed DURING this task (not before it started).
#
#   The only reliable way to measure "changed during this task" is to diff against
#   a baseline commit SHA captured at dispatch time. We do NOT diff the whole
#   working tree — that would produce false violations from unrelated dirty state.
#
# CONTRACT (orchestrator MUST include in Task prompt):
#   ## Expected file scope: [file1, file2, glob/*]
#   ## Baseline SHA: <git sha at dispatch>
#
#   Orchestrator captures baseline with: git rev-parse HEAD (at dispatch time)
#   or for worktree-isolated agents: the worktree's base commit.
#
# BEHAVIOR:
#   - No baseline SHA declared → skip verification (graceful degradation).
#     Prompt-level (Tier 1) enforcement remains in the orchestrator prompt.
#   - Baseline present → diff against it. Only flag files that:
#       (a) changed relative to the baseline, AND
#       (b) are not in the declared scope
#
# INSTALLATION:
#   chmod +x enterprise-team/hooks/verify-task-scope.sh
#   Register in settings.json:
#     {
#       "hooks": {
#         "PostToolUse": [{
#           "matcher": "Task",
#           "hooks": [{ "type": "command",
#                       "command": "$CLAUDE_PLUGIN_ROOT/hooks/verify-task-scope.sh" }]
#         }]
#       }
#     }
#
# OUTPUT: exit 0 = OK; exit 2 = scope violation (blocks acceptance, feedback to Claude)

set -euo pipefail

INPUT=$(cat)

# Extract the task prompt
TASK_PROMPT=$(echo "$INPUT" | jq -r '.tool_input.prompt // empty')

if [ -z "$TASK_PROMPT" ]; then
  # No Task tool input — nothing to verify
  exit 0
fi

# Require BOTH declarations to run. Missing either → skip (Tier 1 fallback applies).
if ! echo "$TASK_PROMPT" | grep -q "Expected file scope"; then
  echo "verify-task-scope: no Expected file scope declared, skipping (Tier 1 enforcement applies)" >&2
  exit 0
fi

if ! echo "$TASK_PROMPT" | grep -q "Baseline SHA"; then
  echo "verify-task-scope: no Baseline SHA declared, skipping (cannot measure 'changed during task' without baseline)" >&2
  exit 0
fi

# Parse baseline SHA
BASELINE_SHA=$(echo "$TASK_PROMPT" \
  | grep -oE 'Baseline SHA[^a-fA-F0-9]*[a-fA-F0-9]{7,40}' \
  | head -1 \
  | grep -oE '[a-fA-F0-9]{7,40}' \
  | head -1)

if [ -z "$BASELINE_SHA" ]; then
  echo "verify-task-scope: malformed Baseline SHA declaration, skipping" >&2
  exit 0
fi

# Verify baseline SHA exists in repo
if ! git cat-file -e "$BASELINE_SHA^{commit}" 2>/dev/null; then
  echo "verify-task-scope: baseline SHA $BASELINE_SHA not found in repo, skipping" >&2
  exit 0
fi

# Parse declared file scope
# Format: "## Expected file scope: [file1, file2, ...]" OR "| Expected file scope | [...] |"
DECLARED=$(echo "$TASK_PROMPT" \
  | grep -oE 'Expected file scope[^\[]*\[[^]]*\]' \
  | head -1 \
  | grep -oE '\[[^]]*\]' \
  | tr -d '[]' \
  | tr ',' '\n' \
  | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
  | grep -v '^$' || true)

if [ -z "$DECLARED" ]; then
  echo "verify-task-scope: empty or malformed file scope, skipping" >&2
  exit 0
fi

# Compute files changed DURING this task by diffing against the baseline.
# This includes: committed changes since baseline + staged + unstaged tracked files
# that differ from baseline. Untracked files are included only if they didn't
# exist at baseline (i.e., they were created during this task).
CHANGED_VS_BASELINE=$(git diff --name-only "$BASELINE_SHA" -- 2>/dev/null || true)
# Also include untracked files NOT in baseline tree
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null || true)
NEW_FILES=""
if [ -n "$UNTRACKED" ]; then
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    # Was this file present at baseline?
    if ! git cat-file -e "$BASELINE_SHA:$f" 2>/dev/null; then
      NEW_FILES="$NEW_FILES"$'\n'"$f"
    fi
  done <<< "$UNTRACKED"
fi

CHANGED=$(echo "$CHANGED_VS_BASELINE"$'\n'"$NEW_FILES" | grep -v '^$' | sort -u || true)

if [ -z "$CHANGED" ]; then
  echo "verify-task-scope: no changes vs baseline $BASELINE_SHA, OK" >&2
  exit 0
fi

# Check each changed file against declared scope.
# Match rules:
#   (a) literal file path
#   (b) directory prefix (pattern ends with /)
#   (c) glob (pattern contains * or ?)
VIOLATIONS=()
while IFS= read -r file; do
  [ -z "$file" ] && continue
  allowed=0
  while IFS= read -r pattern; do
    [ -z "$pattern" ] && continue
    # Literal
    if [ "$file" = "$pattern" ]; then
      allowed=1
      break
    fi
    # Directory prefix
    case "$pattern" in
      */)
        case "$file" in
          "$pattern"*) allowed=1; break ;;
        esac
        ;;
    esac
    # Glob
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
SCOPE VIOLATION: Task modified files outside its declared scope (measured vs baseline $BASELINE_SHA).

Declared scope:
$(echo "$DECLARED" | sed 's/^/  - /')

Changes vs baseline that are NOT in scope:
$(printf '  - %s\n' "${VIOLATIONS[@]}")

Action required:
  1. File a scope-expansion Interaction Record (type: consultation) justifying each undeclared change, OR
  2. Revert the undeclared changes and re-submit work within declared scope.

Unrecorded peer-driven changes are invalid work products per the enterprise-team
collaboration protocol. See enterprise-team/skills/handoff-protocol/SKILL.md.
EOF
  exit 2
fi

echo "verify-task-scope: $(echo "$CHANGED" | wc -l | tr -d ' ') files changed vs baseline, all within declared scope" >&2
exit 0
