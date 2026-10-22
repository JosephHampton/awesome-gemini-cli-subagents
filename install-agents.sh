#!/usr/bin/env bash
#
# Install the Awesome Gemini CLI Subagents for Gemini CLI or Antigravity CLI.
#
# Usage:
#   ./install-agents.sh                        # Gemini CLI, user-level (~/.gemini/agents)
#   ./install-agents.sh --antigravity          # Antigravity CLI, user-level (~/.gemini/config/agents)
#   ./install-agents.sh --project              # current project only (.gemini/agents or .agents/agents)
#   ./install-agents.sh --category security    # one category (repeatable)
#   ./install-agents.sh --list                 # list categories and agents
#   ./install-agents.sh --uninstall            # remove the agents this collection installed
#
# Without cloning:
#   curl -fsSL https://raw.githubusercontent.com/JosephHampton/awesome-gemini-cli-subagents/main/install-agents.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/JosephHampton/awesome-gemini-cli-subagents/main/install-agents.sh | bash -s -- --antigravity
#
set -euo pipefail

REPO="JosephHampton/awesome-gemini-cli-subagents"
TARGET="gemini"
SCOPE="user"
ACTION="install"
CATEGORIES=()

usage() { sed -n '3,15p' "${BASH_SOURCE[0]:-/dev/null}" 2>/dev/null | sed 's/^# \{0,1\}//' || true; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --antigravity|--agy) TARGET="antigravity" ;;
    --gemini) TARGET="gemini" ;;
    --project) SCOPE="project" ;;
    --category|-c)
      [[ -n "${2:-}" ]] || { echo "Error: --category needs a name (see --list)" >&2; exit 1; }
      CATEGORIES+=("$2"); shift ;;
    --list|-l) ACTION="list" ;;
    --uninstall) ACTION="uninstall" ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Error: unknown option $1" >&2; usage; exit 1 ;;
  esac
  shift
done

# Locate the collection: next to this script, or download it when piped from curl.
SCRIPT_DIR=""
if [[ -n "${BASH_SOURCE[0]:-}" && -f "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi
if [[ -n "$SCRIPT_DIR" && -d "$SCRIPT_DIR/agents" ]]; then
  ROOT="$SCRIPT_DIR"
else
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  echo "Downloading $REPO..."
  curl -fsSL "https://codeload.github.com/$REPO/tar.gz/refs/heads/main" | tar -xz -C "$TMP" --strip-components=1
  ROOT="$TMP"
fi

SRC="$ROOT/agents"
AGY_SRC="$ROOT/antigravity/awesome-subagents/agents"

if [[ "$ACTION" == "list" ]]; then
  for dir in "$SRC"/*/; do
    cat="$(basename "$dir")"
    printf '\n%s (%s)\n' "$cat" "$(find "$dir" -name '*.md' | wc -l | tr -d ' ')"
    for f in "$dir"*.md; do printf '  %s\n' "$(basename "$f" .md)"; done
  done
  exit 0
fi

if [[ "$TARGET" == "antigravity" ]]; then
  [[ "$SCOPE" == "project" ]] && DEST="$(pwd)/.agents/agents" || DEST="$HOME/.gemini/config/agents"
  CLI="Antigravity CLI (agy)"
else
  [[ "$SCOPE" == "project" ]] && DEST="$(pwd)/.gemini/agents" || DEST="$HOME/.gemini/agents"
  CLI="Gemini CLI"
fi

# Pick the agents: every category, or only the ones asked for.
FILES=()
if [[ ${#CATEGORIES[@]} -eq 0 ]]; then
  while IFS= read -r -d '' f; do FILES+=("$f"); done < <(find "$SRC" -type f -name '*.md' -print0 | sort -z)
else
  for cat in "${CATEGORIES[@]}"; do
    [[ -d "$SRC/$cat" ]] || { echo "Error: no category '$cat'. Run with --list to see them." >&2; exit 1; }
    while IFS= read -r -d '' f; do FILES+=("$f"); done < <(find "$SRC/$cat" -type f -name '*.md' -print0 | sort -z)
  done
fi

count=0
if [[ "$ACTION" == "uninstall" ]]; then
  for f in "${FILES[@]}"; do
    name="$(basename "$f")"
    if [[ -f "$DEST/$name" ]]; then rm "$DEST/$name"; count=$((count + 1)); fi
  done
  echo "Removed $count subagents from $DEST"
  exit 0
fi

mkdir -p "$DEST"
for f in "${FILES[@]}"; do
  name="$(basename "$f")"
  if [[ "$TARGET" == "antigravity" ]]; then cp "$AGY_SRC/$name" "$DEST/$name"; else cp "$f" "$DEST/$name"; fi
  count=$((count + 1))
done

echo "Installed $count subagents for $CLI"
echo "  -> $DEST"
echo
if [[ "$TARGET" == "antigravity" ]]; then
  echo "Start agy and describe a task; it will delegate to the matching subagent."
else
  echo "Start gemini and run /agents to see them, or type @code-reviewer to call one directly."
fi
