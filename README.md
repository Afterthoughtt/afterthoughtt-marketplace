# afterthoughtt-marketplace

Personal Claude Code plugin marketplace. Every entry except `wrap` is a pointer at its upstream repo (Anthropic's official and community plugin repos, `anthropics/skills`, `cursor/plugins`), so installed plugins auto-update from their original sources. `wrap` lives in this repo.

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

- Installed plugins refresh from their upstreams automatically at startup.
- A newly added catalog entry needs a one-time `claude plugin install <name>@afterthoughtt-marketplace` per machine.

## Adding entries

Edit `.claude-plugin/marketplace.json` (copy an existing entry), then check it with:

```
claude plugin validate .
```
