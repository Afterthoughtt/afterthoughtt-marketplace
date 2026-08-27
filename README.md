# afterthoughtt-marketplace

Personal Claude Code plugin marketplace. Every entry except `wrap` is a pointer at its upstream repo (Anthropic's official and community plugin repos, `anthropics/skills`, `cursor/plugins`), so installed plugins auto-update from their original sources. `wrap` lives in this repo.

## Install

Add the marketplace (once per machine):

```
/plugin marketplace add Afterthoughtt/afterthoughtt-marketplace
```

Then install everything — one paste (macOS/Linux):

```bash
for p in canvas-design claude-code-setup claude-md-management code-review code-simplifier context7 discernment-nudge document-skills eli5 frontend-design github mcp-builder pstack-picks security-guidance skill-creator wrap; do claude plugin install "$p@afterthoughtt-marketplace"; done
```

PowerShell (Windows):

```powershell
"canvas-design","claude-code-setup","claude-md-management","code-review","code-simplifier","context7","discernment-nudge","document-skills","eli5","frontend-design","github","mcp-builder","pstack-picks","security-guidance","skill-creator","wrap" | ForEach-Object { claude plugin install "$_@afterthoughtt-marketplace" }
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
