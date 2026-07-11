#!/usr/bin/env bash
#
# Install the Awesome Gemini CLI Subagents into your Gemini CLI agents directory.
#
# Usage:
#   ./install-agents.sh              # install to ~/.gemini/agents (user-level, all projects)
#   ./install-agents.sh --project    # install to ./.gemini/agents (current project only)
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/agents"

if [[ "${1:-}" == "--project" ]]; then
  DEST_DIR="$(pwd)/.gemini/agents"
  SCOPE="project (current directory)"
else
  DEST_DIR="$HOME/.gemini/agents"
  SCOPE="user (all projects)"
fi

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Error: could not find the agents/ directory next to this script." >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

count=0
while IFS= read -r -d '' file; do
  cp "$file" "$DEST_DIR/"
  count=$((count + 1))
done < <(find "$SRC_DIR" -type f -name '*.md' -print0)

echo "Installed $count subagents to $DEST_DIR"
echo "Scope: $SCOPE"
echo
echo "Start Gemini CLI and run '/agents' to see them, or just describe a task and let it delegate."
