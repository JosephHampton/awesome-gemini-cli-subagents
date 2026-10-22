#!/usr/bin/env bash
#
# Check every agent before it ships. Run locally or in CI:
#   ./scripts/validate.sh
#
# - frontmatter opens and closes, has name + description
# - name is a lowercase-hyphenated slug that matches the filename, and is unique
# - tools are real Gemini CLI tools
# - every agent has a row in README.md, and the README count matches
# - the Antigravity plugin is in sync with agents/ (re-run scripts/build-antigravity.sh)
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

KNOWN_TOOLS=" read_file read_many_files write_file replace glob grep_search list_directory run_shell_command google_web_search web_fetch save_memory "
errors=0
fail() { echo "  ✗ $1"; errors=$((errors + 1)); }

names=""
total=0
for f in agents/*/*.md; do
  total=$((total + 1))
  base="$(basename "$f" .md)"
  [[ "$(head -1 "$f")" == "---" ]] || { fail "$f: must start with --- frontmatter"; continue; }
  fm="$(awk 'NR == 1 { next } /^---$/ { exit } { print }' "$f")"
  [[ "$(awk '/^---$/ { c++ } END { print c + 0 }' "$f")" -ge 2 ]] || fail "$f: frontmatter is not closed with ---"

  name="$(sed -n 's/^name: *//p' <<< "$fm")"
  [[ -n "$name" ]] || fail "$f: missing name"
  [[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || fail "$f: name '$name' must be lowercase-hyphenated"
  [[ "$name" == "$base" ]] || fail "$f: name '$name' does not match the filename"
  grep -qx "$name" <<< "$names" && fail "$f: duplicate name '$name'"
  names+="$name"$'\n'

  grep -q '^description: *[^ ]' <<< "$fm" || fail "$f: missing description"

  while IFS= read -r tool; do
    [[ -z "$tool" ]] && continue
    [[ "$KNOWN_TOOLS" == *" $tool "* || "$tool" == "*" || "$tool" == mcp_* ]] || fail "$f: unknown tool '$tool'"
  done < <(awk '/^tools:/ { t = 1; next } t && /^  - / { print $2; next } { t = 0 }' <<< "$fm")

  [[ -n "$(awk 'BEGIN { c = 0 } /^---$/ { c++; next } c >= 2 && NF' "$f")" ]] || fail "$f: empty system prompt"

  grep -q "](${f})" README.md || fail "$f: no row in README.md"
done

readme_rows="$(grep -c '^| \[`' README.md || true)"
[[ "$readme_rows" -eq "$total" ]] || fail "README.md lists $readme_rows agents but agents/ has $total"
grep -q "subagents-${total}-" README.md || fail "README.md badge does not say $total subagents"

./scripts/build-antigravity.sh > /dev/null
if ! git diff --quiet -- antigravity || [[ -n "$(git ls-files --others --exclude-standard -- antigravity)" ]]; then
  fail "antigravity/ is out of date: run ./scripts/build-antigravity.sh and commit the result"
fi

if [[ $errors -gt 0 ]]; then
  echo "$errors problem(s) found in $total agents"
  exit 1
fi
echo "✓ $total agents valid, README in sync, Antigravity plugin in sync"
