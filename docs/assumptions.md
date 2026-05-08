# Assumptions

## Interview Scope

- This project uses Option 1: Market researcher.
- The chosen sector is Australian bedding, mattresses, sleep products, and bedroom furniture.
- The LKG-relevant business context is Hypnos Group under LK Group, including Snooze, Future Sleep, and G&G Furniture.

## Data Assumptions

- Public data only.
- No confidential LK Group, LKG, Hypnos, Snooze, employer, client, or private data is used.
- Public sources may include company websites, ASX announcements, investor pages, ABS data, public annual reports, public news, and publicly accessible broker or industry commentary.
- If synthetic data is used for fallback or demo stability, it must be labelled as `SYNTHETIC DEMO FALLBACK` and not presented as real market evidence.

## Source Assumptions

- The live demo aims to scan 10 relevant public sources where available.
- If fewer than 10 relevant sources are available, the agent should explain the gap instead of padding with weak sources.
- Search results are discovery only. Important claims should be verified against primary or reputable sources where possible.
- Paywalled snippets should not be used as the sole source for material claims.
- If live web search returns empty or inconsistent results, the agent should fetch stable public URLs such as ABS retail trade, ASX announcements, company investor pages, and competitor websites.
- Synthetic fallback data may be used only after live search/fetch fails and only to demonstrate output structure. Synthetic fallback items must be marked `Demo only`, require human review, and must not be circulated as GM/Board intelligence.

## Output Assumptions

- The primary output is Microsoft Word format.
- Post-approval demo outputs are local files:
  - `output/lkg-furniture-gm-weekly-digest.docx`
  - `output/lkg-furniture-board-weekly-digest.docx`
  - `output/lkg-furniture-internal-source-log.docx`
- The agent drafts files only. It does not send files to GMs or the board.

## Human Review Assumptions

- GM/Board routing is advisory until approved by a human reviewer.
- A human reviewer decides which items are approved, edited, suppressed, or circulated.
- The final digest is draft work product and not financial advice.

## Connector Assumptions

- The plugin uses available web search / fetch capability where enabled.
- The Managed Agent cookbook uses Claude Platform's built-in `web_search` and `web_fetch` tools.
- No DuckDuckGo MCP connector is required.
- Future production connectors may include ASX announcements, ABS retail trade data, company investor pages, competitor website monitoring, and Microsoft 365 output.
