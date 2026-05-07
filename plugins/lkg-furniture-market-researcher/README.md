# LKG Furniture Market Researcher Plugin

This plugin adapts Anthropic's financial-services market-researcher pattern into an LKG-focused workflow for Australian bedding, mattresses, sleep products, and bedroom furniture.

It is designed for analyst-led use in Claude Code or Claude Cowork. The same workflow can also be represented in a Managed Agent cookbook for production deployment on Claude Platform.

## Problem Solved

LKG needs a repeatable way to monitor public market signals and turn scattered information into sourced, reviewable business insight for:

- Portfolio company GMs.
- The LKG board.
- Analysts preparing board-pack or operating-rhythm inputs.

The workflow focuses on Hypnos Group, Snooze, Future Sleep, G&G Furniture, and relevant competitors such as Forty Winks, Bedshed, Harvey Norman, Domayne, IKEA Australia, Temple & Webster, Adairs, Nick Scali, Freedom, Fantastic Furniture, and Amart Furniture.

## Workflow

```text
Main market-researcher agent
  -> research-agent
  -> weekly-digest-writer
  -> source-validator
  -> gm-board-classifier
  -> human approval gate
  -> approved Word / Excel / PowerPoint / email-ready output
```

The human approval gate sits after GM/Board classification. The agent may recommend routing, but a human reviewer decides what is approved, edited, suppressed, or sent to each audience.

## Agents

- `market-researcher`: main orchestrator. Defines scope, calls subagents, enforces guardrails, and stops for human approval.
- `research-agent`: gathers public market signals from reliable sources.
- `weekly-digest-writer`: converts findings into a weekly digest.
- `source-validator`: checks citations, source quality, confidence, and unsupported claims.
- `gm-board-classifier`: recommends whether each item is for a GM, the board, both, or neither.

## Skills

- `lkg-research-plan`: predefined research tasks, source priorities, companies, and finding format.
- `weekly-digest-template`: digest structure for executive summary, market signals, competitor watch, demand trends, margin signals, GM items, board items, and source log.
- `source-validation`: citation and confidence checklist.
- `gm-board-classification`: routing criteria and message templates for GM/Board review.

The original finance-heavy comps and investment idea-generation skills are removed from the active workflow because they are not needed for LKG's bedding and bedroom furniture digest.

## Command

Use:

```text
/lkg-market-digest
```

The command runs the workflow for a weekly Australian bedding and bedroom furniture market digest.

## Connectors

For the demo, the plugin expects governed access to public data through available Claude tools/connectors:

- `web_search`: public search across company, news, ASX, ABS, and competitor sources.
- `browser`: inspect public webpages and source evidence.
- `file_read`: read saved assumptions, source logs, and fallback outputs.
- `microsoft_word`: produce a reviewable digest.
- `microsoft_excel`: produce a structured source log.
- `microsoft_ppt`: produce a board-summary outline or presentation-ready output.

The `.mcp.json` file documents these expected connectors. Actual MCP server definitions can be added when the target Claude Code/Cowork environment provides the relevant servers.

## Production Extensions

In production, the research step could be parallelised:

```text
research-agent
  -> competitor-research subagent
  -> market-demand subagent
  -> supply-chain-margin subagent
  -> macro-and-housing subagent
```

Additional connectors could include:

- ASX announcements.
- ABS retail trade datasets.
- Company investor relations page monitoring.
- Competitor price and promotion monitoring.
- Microsoft 365 Word, Excel, PowerPoint, and SharePoint.
- Approval workflow tooling.
- Internal portfolio knowledge systems, if approved.

## Guardrails

- Public data only.
- No confidential LKG data.
- Every factual claim needs a source link.
- Facts and interpretation must be separated.
- Low-confidence or high-impact items require human review.
- The digest is draft work product only.
- The agent must not distribute directly to GMs or the board.

