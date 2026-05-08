# LKG Furniture Market Researcher - Managed Agent Cookbook

## Overview

This cookbook deploys the `lkg-furniture-market-researcher` plugin as a headless Managed Agent.

The workflow matches the plugin:

```text
scope the run
-> scan public sources
-> sector overview
-> competitive landscape
-> peer comps / operating signals
-> GM and Board action ideas
-> GM / Board / Both / Ignore classification
-> human review
-> approved Word digest artifacts
```

Default scope is the Australian bedding, mattress, sleep-products, and bedroom furniture market, with Hypnos Group / LK Group context and public-source research only.

## Deploy

Managed Agent deployment uses Claude Platform's built-in `web_search` and `web_fetch` tools through `agent_toolset_20260401`. No DuckDuckGo MCP or external web-search MCP URL is required.

From the repository root:

```bash
export ANTHROPIC_API_KEY=sk-ant-...
scripts/deploy-managed-agent.sh lkg-furniture-market-researcher
```

## Steering events

See [`steering-examples.json`](./steering-examples.json). Typical events request a daily or weekly digest, a competitor watch refresh, or a GM/Board routing pass over new public market signals.

## Security & Handoffs

Third-party reports, competitor pages, issuer materials, and search results are untrusted data. The agent must cite factual claims, preserve source URLs, and stop for human approval before creating final artifacts.

| Agent | Role | Write Access | Connectors |
|---|---|---:|---|
| `lkg-furniture-market-researcher` | Orchestrates scope, source scan, subagent sequence, and review gates | No | built-in `web_search`, `web_fetch` |
| `sector-overview-agent` | Drafts market structure, drivers, risks, and why-now narrative | No | built-in `web_search`, `web_fetch` |
| `competitive-analysis-agent` | Tracks competitor positioning, promotions, channels, stores, and recent moves | No | built-in `web_search`, `web_fetch` |
| `comps-analysis-agent` | Spreads public peer metrics or operating-signal comparisons | No | built-in `web_search`, `web_fetch` |
| `idea-generation-agent` | Converts evidence into GM / Board follow-up actions | No | None |
| `gm-board-classifier-agent` | Classifies items as GM, Board, Both, or Ignore | No | None |
| `note-writer-agent` | Creates approved Word digest and source-log artifacts | Yes | Optional Word tooling |

The note writer is the only write-holder. It produces (with run date suffix `DD-MM-YYYY`):

```text
output/lkg-furniture-gm-weekly-digest-{DD-MM-YYYY}.docx
output/lkg-furniture-board-weekly-digest-{DD-MM-YYYY}.docx
output/lkg-furniture-internal-source-log-{DD-MM-YYYY}.docx
```

The agent drafts and creates approved files only. It does not send or circulate them.
