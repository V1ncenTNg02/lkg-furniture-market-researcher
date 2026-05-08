---
name: lkg-furniture-market-digest
description: Custom LKG skill for producing a daily or weekly Australian bedding, mattress, sleep-products, and bedroom furniture digest for Hypnos Group under LK Group.
---

# LKG Furniture Market Digest

## Business Context

LK Group has exposure to bedding and bedroom furniture through Hypnos Group.

Relevant Hypnos Group businesses:

- Snooze
- Future Sleep
- G&G Furniture

Primary sector:

- Australian bedding
- mattresses
- sleep products
- bedroom furniture
- adjacent home retail where directly relevant

## Default Competitor / Market Watchlist

Track the following players unless the user narrows the scope:

- Snooze
- Forty Winks
- Bedshed
- Sleeping Giant
- Harvey Norman
- Domayne
- IKEA Australia
- Temple & Webster
- Adairs
- Nick Scali
- Freedom
- Fantastic Furniture
- Amart Furniture

## Required 10 Public Sources

For each daily or weekly digest, scan up to 10 public sources. Prefer exactly 10 when available and relevant.

Use this source mix:

1. Snooze / Hypnos public website or news page
2. Forty Winks public website or offers page
3. Harvey Norman / Domayne public website, investor material, or announcements
4. Temple & Webster investor updates, ASX announcements, or public news
5. Adairs investor updates, ASX announcements, or public news
6. Nick Scali investor updates, ASX announcements, or public news
7. IKEA Australia public news, range, or store updates
8. ABS retail trade or household-goods data
9. Reputable Australian retail/business news source
10. Another relevant competitor/public source, such as Bedshed, Sleeping Giant, Freedom, Fantastic Furniture, Amart, or a public annual report

If fewer than 10 relevant sources are available, state the reason and do not pad with weak sources.

## Stable Source URL Fallbacks

Use web search first. If web search returns empty, weak, or inconsistent results, fetch from these stable public URLs before giving up:

| Source bucket | Stable URL | Use for |
|---|---|---|
| Snooze | https://www.snooze.com.au/ | product range, promotions, store/service signals |
| Forty Winks | https://www.fortywinks.com.au/ | product range, promotions, store/service signals |
| Harvey Norman investor / corporate | https://www.harveynormanholdings.com.au/ | public trading, annual report, corporate announcements |
| Harvey Norman furniture | https://www.harveynorman.com.au/furniture-outdoor-bbqs/bedroom.html | bedding and bedroom retail signals |
| Domayne bedroom | https://www.domayne.com.au/furniture-bedding/bedroom.html | bedroom furniture and bedding retail signals |
| Temple & Webster investor | https://www.templeandwebstergroup.com.au/investors/ | ASX releases, results, online home-retail commentary |
| Adairs investor centre | https://www.adairs.com.au/investor-centre/ | ASX releases, results, homewares commentary |
| Nick Scali investor relations | https://www.nickscali.com.au/investor-relations | ASX releases, results, furniture retail commentary |
| IKEA Australia | https://www.ikea.com/au/en/ | range, pricing, bedroom category signals |
| ABS retail trade | https://www.abs.gov.au/statistics/industry/retail-and-wholesale-trade/retail-trade-australia | retail trade and household-goods demand context |
| ASX announcements search | https://www2.asx.com.au/markets/trade-our-cash-market/announcements | company announcements if direct investor pages are unavailable |
| Inside Retail Australia | https://insideretail.com.au/ | retail news and industry context |

When using a stable URL fallback:

- State `Source discovery method: stable URL fallback`.
- Use `web_fetch` on the URL and cite the URL used.
- Do not infer facts that are not visible in the fetched page.
- If the source cannot be fetched, mark it as unavailable and move to the synthetic demo fallback rules below only when the user/demo context permits synthetic data.

## Synthetic Demo Fallback Rules

Synthetic fallback data is allowed only for demo continuity when live web search or stable URL fetch fails. It must never be presented as real market evidence.

Use synthetic fallback data only if all are true:

- the user asked for a demo, fallback, or synthetic data is explicitly allowed
- live search/fetch is empty, unavailable, or not reliable enough for the run
- the output clearly labels the item as `SYNTHETIC DEMO FALLBACK`
- the item is excluded from final GM/Board routing unless a human reviewer explicitly approves it for demo discussion

Synthetic fallback items must use this source label:

```text
Source: SYNTHETIC DEMO FALLBACK - constructed for interview demo because live public-source retrieval failed. Not real market data.
Confidence: Demo only
Review flag: Required - synthetic, do not circulate
```

Synthetic fallback examples the agent may use for demo structure only:

| Company / sector | Synthetic signal | Why this matters | Suggested routing |
|---|---|---|---|
| Australian bedding retail | A competitor is running a 30-40% mattress promotion in the demo period. | Demonstrates how the digest would flag promotional intensity and pricing pressure. | GM demo item only |
| Bedroom furniture retail | A public home-retail peer reports softer discretionary demand in the demo period. | Demonstrates demand-risk routing and board-level watch logic. | Board demo item only |
| Household goods retail | Household-goods retail sales are described as mixed in the demo period. | Demonstrates macro context for consumer demand. | Both demo item only |
| Supply chain / margin | Freight, FX, or inventory pressure is flagged as a possible margin watch item. | Demonstrates margin-risk follow-up without claiming a real observed event. | Board demo item only |
| Online furniture retail | Online range expansion or delivery-service positioning is used as a demo signal. | Demonstrates competitor positioning and operating follow-up. | GM demo item only |

Never mix synthetic fallback items with live facts without a clear label. In the source log, separate synthetic fallback items under a `Synthetic Demo Fallback` section.

## Signals To Extract

Look for:

- competitor promotions and pricing
- mattress, bed frame, bedroom suite, bedding, and sleep-product range changes
- delivery, installation, finance, warranty, and service offers
- store openings, closures, refurbishments, or franchise/network signals
- online merchandising and availability signals
- demand indicators from retail trade, housing, consumer confidence, or cost-of-living pressure
- margin and supply-chain signals: freight, FX, raw materials, inventory, importing, manufacturing, supplier pressure
- public trading updates, investor commentary, M&A, or strategic shifts

## Digest Output Template

Use this structure:

```text
# LKG Furniture Market Digest

Period:
Sector:
Prepared for:
Status: Draft for human review

## Executive Summary
- 5-8 bullets covering the most important signals.

## Key Market Signals
| Date | Company / Sector | What happened | Why this matters | Source | Confidence | Review flag |

## Competitor Watch
| Competitor | Signal | Evidence | GM / Board relevance | Recommended follow-up |

## Demand And Consumer Signals
| Signal | Source | Why this matters | Confidence |

## Supply Chain And Margin Signals
| Signal | Source | Why this matters | Confidence |

## GM Items
| Item | Why GM should care | Suggested action | Source | Confidence |

## Board Items
| Item | Strategic relevance | Suggested board watch item | Source | Confidence |

## Items Requiring Human Review
| Item | Reason for review | Question for reviewer |

## Source Log
| Source # | Source name | URL | Date accessed | Evidence used | Reliability |

## Disclaimer
Draft work product only. Public data only. Not financial advice. Human approval required before circulation.
```

## Rules

- Use public data only.
- Do not use confidential LK Group, LKG, Hypnos, Snooze, employer, or private data.
- Cite each factual claim.
- Include a source URL for every material item.
- Separate facts from interpretation.
- Prefer live public data. If live data fails, use stable URL fallbacks. If synthetic fallback is used, label it clearly and keep it out of circulation.
- Every material item must include "why this matters."
- Flag low-confidence or high-impact items for human review.
- Do not send or circulate output directly.
- GM/Board routing is advisory until approved by a human reviewer.
