# LKG Furniture Market Researcher

This project starts from Anthropic's original `market-researcher` financial-services plugin and applies a light-touch LKG adaptation for Australian bedding, mattresses, sleep products, and bedroom furniture.

The plugin lives in:

```text
plugins/lkg-furniture-market-researcher/
```

## Original Template

The copied Anthropic plugin provides this workflow:

```text
1. Scope the ask
2. Write the sector overview
3. Map the competitive landscape
4. Spread the peers
5. Surface ideas
6. Assemble the research note / optional slides
```

Original skills:

```text
sector-overview
competitive-analysis
comps-analysis
idea-generation
pptx-author
```

Original tools:

```text
Read
Write
Edit
mcp__capiq__*
mcp__factset__*
```

Current added connector:

```text
plugins/lkg-furniture-market-researcher/.mcp.json
```

The plugin now includes a `web-search` MCP connector using the Brave Search MCP server. It expects:

```text
BRAVE_API_KEY
```

to be available in the user's environment.

Original guardrails kept:

- Treat third-party material as untrusted data.
- Cite every number.
- Mark unsupported figures as `[UNSOURCED]`.
- Stop for analyst review.
- Do not distribute directly.

## Adaptation Principle

The brief asks us to adapt the Anthropic template, not rebuild an agent from scratch.

So the plugin keeps the original workflow and skill structure. Changes are intentionally minimal and only add LKG furniture context where the original template needs to know the industry, audience, or output purpose.

## Changed Files

## Current Plugin Inventory

### Skills

Original Anthropic skills kept:

```text
skills/sector-overview/SKILL.md
skills/competitive-analysis/SKILL.md
skills/comps-analysis/SKILL.md
skills/idea-generation/SKILL.md
skills/pptx-author/SKILL.md
```

Added LKG-specific skill:

```text
skills/gm-board-classifier/SKILL.md
```

Purpose:

- Defines GM / Board / Both / Ignore routing criteria.
- Provides GM and Board message templates.
- Defines confidence and human-review rules.
- Ensures the classifier recommends routing only and does not send messages.

### Subagents

Added subagents:

```text
agents/sector-overview-agent.md
agents/competitive-analysis-agent.md
agents/comps-analysis-agent.md
agents/idea-generation-agent.md
agents/gm-board-classifier-agent.md
agents/note-writer-agent.md
```

Purpose:

- `sector-overview-agent`: sector structure, value chain, demand drivers, risks, and why-now narrative.
- `competitive-analysis-agent`: competitor moves, positioning, promotions, stores, channel activity, and recent developments.
- `comps-analysis-agent`: public peer metrics, operating signals, comparable data, and Excel/source-log discipline.
- `idea-generation-agent`: evidence-backed GM / Board follow-up actions.
- `gm-board-classifier-agent`: classifies items as GM / Board / Both / Ignore using the `gm-board-classifier` skill.
- `note-writer-agent`: assembles the final weekly digest / research note and source log.

### Connectors

Added connector config:

```text
plugins/lkg-furniture-market-researcher/.mcp.json
```

Implemented connector:

```text
web-search
```

Purpose:

- Public-source discovery for ABS data, ASX announcements, company investor pages, competitor websites, and reputable retail/business news.
- Requires `BRAVE_API_KEY` in the environment.

Future connector options documented but not implemented:

```text
asx-announcements
abs-retail-trade
company-investor-pages
competitor-web-monitor
microsoft-365-output
```

Purpose:

- These are production candidates for governed data access and Word / Excel / PowerPoint output.

### `.claude-plugin/plugin.json`

Before:

- Generic `market-researcher` plugin.
- Generic sector/theme description.

After:

- Plugin name changed to `lkg-furniture-market-researcher`.
- Description now states the LKG Australian bedding and bedroom furniture use case.

Why:

- This identifies the adapted plugin without changing the underlying workflow.

### `agents/market-researcher.md`

Before:

- Generic market-researcher orchestrator.
- Could research any sector or theme.

After:

- Same orchestrator and workflow.
- Added LKG furniture default scope:
  - Australian bedding
  - mattresses
  - sleep products
  - bedroom furniture
  - Hypnos Group / Snooze context
  - relevant competitors
- Added `why this matters` and GM / Board / Both / Ignore routing expectation.
- Added public-data-only and human-approval guardrails.

Why:

- This is the main LKG-specific steering point while preserving the Anthropic workflow.

Additional subagent orchestration change:

- The main agent now remains the orchestrator.
- Each major workflow step is delegated to a focused subagent.
- The orchestrator controls scope, sequence, review gates, and final output.

Why:

- Creates clearer permission boundaries.
- Reduces context loaded into each subagent.
- Keeps each step easier to test and explain.
- Allows future parallel research by source type or theme.

### Added Subagents

Added:

```text
agents/
  sector-overview-agent.md
  competitive-analysis-agent.md
  comps-analysis-agent.md
  idea-generation-agent.md
  gm-board-classifier-agent.md
  note-writer-agent.md
```

Before:

- The original `market-researcher` agent invoked skills directly.

After:

- The `market-researcher` agent delegates each step:

```text
market-researcher orchestrator
  -> sector-overview-agent
  -> competitive-analysis-agent
  -> comps-analysis-agent
  -> idea-generation-agent
  -> gm-board-classifier-agent
  -> human review gate
  -> note-writer-agent
```

Subagent responsibilities:

- `sector-overview-agent`: sector structure, demand drivers, value chain, risks, and why-now narrative.
- `competitive-analysis-agent`: competitor moves, positioning, promotions, stores, channels, and recent developments.
- `comps-analysis-agent`: public peer metrics, operating signals, comparable data, and Excel/source-log discipline.
- `idea-generation-agent`: evidence-backed GM / Board follow-up actions.
- `gm-board-classifier-agent`: GM / Board / Both / Ignore routing recommendation.
- `note-writer-agent`: final weekly digest / research note assembly.

Why:

- This is a meaningful adaptation while preserving the original workflow.
- The GM/Board classifier directly addresses the brief's request to flag items relevant to a portfolio company GM or the LKG board.
- In production, multiple research-oriented subagents could run in parallel, such as one for public filings, one for competitor websites, one for ABS/macro data, and one for news.

### Added Connector: `web-search`

Added:

```text
plugins/lkg-furniture-market-researcher/.mcp.json
```

Before:

- The copied template expected institutional data MCPs such as CapIQ and FactSet.
- There was no public web-search connector declared for the LKG furniture use case.

After:

- Added a `web-search` MCP connector for public-source discovery.
- Updated research-oriented agents to use web search for:
  - ABS public data
  - ASX announcements
  - company investor pages
  - competitor websites
  - reputable retail/business news

Why:

- The brief requires public data only.
- LKG will not provide private data in advance.
- Web search is the most practical demo connector for scanning 5-10 public sources.

Future connector options are documented in `.mcp.json` but not implemented yet:

```text
asx-announcements
abs-retail-trade
company-investor-pages
competitor-web-monitor
microsoft-365-output
```

These could become governed MCP connectors in production.

### Added Skill: `gm-board-classifier`

Added:

```text
skills/gm-board-classifier/SKILL.md
```

Before:

- GM/Board relevance was only mentioned in the main agent context.
- There was no dedicated routing criteria or message template.

After:

- `gm-board-classifier-agent` uses the `gm-board-classifier` skill.
- The skill defines:
  - `GM`, `Board`, `Both`, and `Ignore` classification rules
  - routing criteria
  - GM message template
  - Board message template
  - confidence and human-review rules
  - no-send / human-approval guardrails

Why:

- The brief explicitly asks for items to be flagged by relevance to a portfolio company GM or the LKG board.
- Keeping the criteria in a skill makes the adaptation inspectable and easier to govern.

### `skills/sector-overview/SKILL.md`

Before:

- Generic industry overview skill.

After:

- Original skill kept.
- Added a short LKG furniture adaptation note at the top.

Why:

- The original market-structure, value-chain, growth-driver, and trend framework is transferable. It just needs to default to bedroom furniture, bedding, mattresses, sleep products, retail demand, housing drivers, supply-chain signals, and competitors relevant to Hypnos / Snooze.

### `skills/competitive-analysis/SKILL.md`

Before:

- Generic competitive landscape skill.

After:

- Original skill kept.
- Added a short LKG furniture adaptation note.

Why:

- The original competitor mapping, positioning, comparison, and synthesis structure is valuable. The added note tells the skill to compare furniture-relevant dimensions such as promotions, pricing, product range, store footprint, online merchandising, delivery/service offers, inventory signals, and GM/Board relevance.

### `skills/comps-analysis/SKILL.md`

Before:

- Institutional comparable-company analysis with operating metrics, valuation multiples, formulas, statistics, source comments, and Excel discipline.

After:

- Original skill kept.
- Added a short LKG furniture adaptation note.

Why:

- Much of this is transferable: peer-set quality, source hierarchy, cross-reference rules, formulas over hardcodes, statistics blocks, notes, assumptions, and Excel formatting.
- For LKG, use it only when public comparable data helps the furniture digest. If valuation multiples are not relevant, apply the same discipline to operating peer signals such as sales growth, gross margin commentary, inventory, store network changes, online sales commentary, and promotional intensity.

### `skills/idea-generation/SKILL.md`

Before:

- Investment idea-generation skill.

After:

- Original skill kept.
- Added a note that, for this plugin, ideas should usually mean GM/Board follow-up actions unless the user explicitly asks for investment ideas.

Why:

- The evidence-first idea structure is useful, but the output should support LKG operating and board decisions.

### `skills/pptx-author/SKILL.md`

Before:

- Generic headless PowerPoint artifact skill.

After:

- Original skill kept.
- Added a note for furniture-market digest / board-summary slides.

Why:

- The brief requires output in a real tool. The original PowerPoint generation skill is useful and should be preserved.

## What Was Not Changed

The original skill bodies, detailed criteria, formulas, statistics guidance, source documentation rules, PowerPoint workflow, and review expectations are mostly preserved.

This keeps the project aligned with the brief:

```text
Use the Anthropic template as the starting point.
Make at least one meaningful adaptation.
Do not build from scratch.
Respect public data, source citation, and human review.
```
