#!/usr/bin/env bash
# Re-vendor plugin content from upstream repos into plugins/.
# Run from anywhere; operates on the repo this script lives in.
set -euo pipefail
cd "$(cd "$(dirname "$0")/.." && pwd)"

tmp="$(mktemp -d "${TMPDIR:-/tmp}/sync-plugins.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT

clone() { git clone --quiet --depth 1 "https://github.com/$1.git" "$tmp/$2"; }

clone anthropics/skills skills
clone anthropics/claude-plugins-official official
clone anthropics/claude-plugins-community community
clone cursor/plugins cursor

# copy_dir <src> <dst>: mirror src into dst (dst is fully replaced)
copy_dir() {
  rm -rf "$2"
  mkdir -p "$(dirname "$2")"
  cp -R "$1" "$2"
  rm -rf "$2/.git"
}

# Whole plugins from anthropics/claude-plugins-official (bring their own plugin.json)
for p in claude-code-setup claude-md-management code-review code-simplifier \
         frontend-design security-guidance skill-creator; do
  copy_dir "$tmp/official/plugins/$p" "plugins/$p"
done
for p in context7 github; do
  copy_dir "$tmp/official/external_plugins/$p" "plugins/$p"
done

# eli5 from anthropics/claude-plugins-community
copy_dir "$tmp/community/eli5" "plugins/eli5"

# Skill bundles composed here (their .claude-plugin/plugin.json is authored in
# this repo and must not be overwritten — only the skills/ dirs are synced)
copy_dir "$tmp/skills/skills/canvas-design"      "plugins/canvas-design/skills/canvas-design"
copy_dir "$tmp/skills/skills/discernment-nudge"  "plugins/discernment-nudge/skills/discernment-nudge"
copy_dir "$tmp/skills/skills/mcp-builder"        "plugins/mcp-builder/skills/mcp-builder"
for s in xlsx docx pptx pdf; do
  copy_dir "$tmp/skills/skills/$s" "plugins/document-skills/skills/$s"
done
for s in bro blast-radius unslop technical-writing; do
  copy_dir "$tmp/cursor/pstack/skills/$s" "plugins/pstack-picks/skills/$s"
done

echo "Sync complete."
