#!/usr/bin/env bash
# Refresh vendored plugins and rebuild dist/ zips for anything that changed
# since the last time zips were uploaded to the Desktop app.
#
#   scripts/update-zips.sh          # pull + sync upstreams + rebuild changed zips
#   scripts/update-zips.sh --done   # after re-uploading, mark current state as uploaded
set -euo pipefail
cd "$(cd "$(dirname "$0")/.." && pwd)"

if [[ "${1:-}" == "--done" ]]; then
  git tag -f last-upload >/dev/null
  git push -qf origin last-upload
  echo "Marked current state as uploaded."
  exit 0
fi

git pull -q
./scripts/sync-plugins.sh

if [ -n "$(git status --porcelain plugins)" ]; then
  git add -A plugins
  git commit -qm "Sync vendored plugins from upstream"
  git push -q
fi

# The last-upload tag records what the Desktop app currently has.
git rev-parse -q --verify last-upload >/dev/null || git tag last-upload

changed=$(git diff --name-only last-upload HEAD -- plugins | cut -d/ -f2 | sort -u)
if [ -z "$changed" ]; then
  echo "Nothing changed since your last upload — the Desktop app is current."
  exit 0
fi

mkdir -p dist
for name in $changed; do
  rm -f "dist/$name.zip"
  (cd "plugins/$name" && zip -qr "../../dist/$name.zip" . -x "*.DS_Store")
done

echo "Changed since last upload — re-upload these from dist/:"
printf '  %s.zip\n' $changed
echo "Then run: scripts/update-zips.sh --done"
open dist 2>/dev/null || true
