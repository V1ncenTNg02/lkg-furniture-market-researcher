# Assumptions

## Interview Scope

- This project uses Option 1: Market researcher.
- The chosen sector is Australian bedding, mattresses, sleep products, and bedroom furniture.
- The LKG-relevant business context is Hypnos Group under LK Group, including Snooze, Future Sleep, and G&G Furniture.

## Data Assumptions

- Public data only.
- No confidential LK Group, LKG, Hypnos, Snooze, employer, client, or private data is used.
- Public sources may include company websites, ASX announcements, investor pages, ABS data, public annual reports, public news, and publicly accessible broker or industry commentary.
- If synthetic data is used for fallback or demo stability, it must be labelled as synthetic and not presented as real market evidence.

## Source Assumptions

- The live demo aims to scan 10 relevant public sources where available.
- If fewer than 10 relevant sources are available, the agent should explain the gap instead of padding with weak sources.
- Search results are discovery only. Important claims should be verified against primary or reputable sources where possible.
- Paywalled snippets should not be used as the sole source for material claims.

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

- The demo uses a `web-search` MCP connector for public-source discovery.
- The connector uses DuckDuckGo Search MCP through `uvx duckduckgo-mcp-server`.
- No search API key is required for this demo connector.
- Future production connectors may include ASX announcements, ABS retail trade data, company investor pages, competitor website monitoring, and Microsoft 365 output.
