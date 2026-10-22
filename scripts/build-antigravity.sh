#!/usr/bin/env bash
#
# Build the Antigravity CLI plugin from the Gemini CLI agents.
#
# agents/<category>/<name>.md is the single source of truth. This script converts
# each one to Antigravity's subagent format and writes the plugin to
# antigravity/awesome-subagents/. Run it after adding or editing an agent; CI
# fails if the committed plugin is out of date.
#
# Conversion:
#   model   gemini-*-pro*   -> pro
#           gemini-*-flash* -> flash
#   tools   read_file, read_many_files -> view_file, list_dir
#           glob                       -> find_by_name
#           grep_search                -> grep_search
#           write_file                 -> write_to_file, replace_file_content, multi_replace_file_content
#           run_shell_command          -> run_command
#           google_web_search          -> search_web, read_url_content
#   kind, temperature, max_turns are Gemini CLI only and are dropped.
#   The system prompt (body) is copied unchanged.
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/agents"
PLUGIN="$ROOT/antigravity/awesome-subagents"
OUT="$PLUGIN/agents"

rm -rf "$OUT"
mkdir -p "$OUT"

convert() {
  awk '
    function emit(t) { if (!(t in seen)) { seen[t] = 1; order[++n] = t } }
    function map(t) {
      if (t == "read_file" || t == "read_many_files") { emit("view_file"); emit("list_dir") }
      else if (t == "glob") emit("find_by_name")
      else if (t == "grep_search") emit("grep_search")
      else if (t == "write_file") { emit("write_to_file"); emit("replace_file_content"); emit("multi_replace_file_content") }
      else if (t == "run_shell_command") emit("run_command")
      else if (t == "google_web_search") { emit("search_web"); emit("read_url_content") }
      else { print "unknown tool: " t > "/dev/stderr"; exit 2 }
    }
    NR == 1 && $0 == "---" { fm = 1; next }
    fm && $0 == "---" {
      fm = 0
      print "---"
      print name
      print desc
      if (n) { print "tools:"; for (i = 1; i <= n; i++) print "  - " order[i] }
      if (model != "") print "model: " model
      print "---"
      next
    }
    fm {
      if ($0 ~ /^name:/) name = $0
      else if ($0 ~ /^description:/) desc = $0
      else if ($0 ~ /^model:/) {
        m = $2
        if (m ~ /flash/) model = "flash"
        else if (m ~ /pro/) model = "pro"
        else model = ""
      }
      else if ($0 ~ /^tools:/) intools = 1
      else if (intools && $0 ~ /^  - /) map($2)
      else intools = 0
      next
    }
    { print }
  ' "$1"
}

count=0
while IFS= read -r -d '' file; do
  convert "$file" > "$OUT/$(basename "$file")"
  count=$((count + 1))
done < <(find "$SRC" -type f -name '*.md' -print0 | sort -z)

cat > "$PLUGIN/plugin.json" <<'JSON'
{
  "name": "awesome-subagents",
  "description": "81 production-ready specialist subagents: code review, security audits, testing, DevOps, data and AI, language experts and more."
}
JSON

echo "Built $count Antigravity subagents in ${OUT#"$ROOT"/}"
