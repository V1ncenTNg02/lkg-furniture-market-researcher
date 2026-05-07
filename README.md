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
