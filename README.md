# afterthoughtt-marketplace

Personal Claude Code plugin marketplace. All plugin content is vendored into `plugins/` (copied from Anthropic's official and community plugin repos, `anthropics/skills`, and `cursor/plugins`) so the marketplace also works in the Claude Desktop app, which only loads plugins stored inside the marketplace repo itself. `wrap` is original to this repo.

A weekly GitHub Action (`.github/workflows/sync-plugins.yml`) re-copies the vendored plugins from their upstream repos; run `scripts/sync-plugins.sh` to do it manually.

## Install

Add the marketplace (once per machine):

```
/plugin marketplace add Afterthoughtt/afterthoughtt-marketplace
```

Then install each plugin you want:

```
claude plugin install canvas-design@afterthoughtt-marketplace
claude plugin install claude-code-setup@afterthoughtt-marketplace
claude plugin install claude-md-management@afterthoughtt-marketplace
claude plugin install code-review@afterthoughtt-marketplace
claude plugin install code-simplifier@afterthoughtt-marketplace
claude plugin install context7@afterthoughtt-marketplace
claude plugin install discernment-nudge@afterthoughtt-marketplace
claude plugin install document-skills@afterthoughtt-marketplace
claude plugin install eli5@afterthoughtt-marketplace
claude plugin install frontend-design@afterthoughtt-marketplace
claude plugin install github@afterthoughtt-marketplace
claude plugin install mcp-builder@afterthoughtt-marketplace
claude plugin install pstack-picks@afterthoughtt-marketplace
claude plugin install security-guidance@afterthoughtt-marketplace
claude plugin install skill-creator@afterthoughtt-marketplace
claude plugin install wrap@afterthoughtt-marketplace
```

Or pick from the list interactively with `/plugin` → Discover.

## Updating

- The weekly sync Action commits upstream changes into this repo; installed plugins pick them up when the marketplace refreshes at startup.
- A newly added catalog entry needs a one-time `claude plugin install <name>@afterthoughtt-marketplace` per machine.

## Adding entries

Edit `.claude-plugin/marketplace.json` (copy an existing entry), then check it with:

```
claude plugin validate .
```
