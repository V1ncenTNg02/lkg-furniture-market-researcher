# Assumptions

## Template Choice and Rationale

This project uses Option 1: Market researcher.

The chosen sector is Australian bedding, mattresses, sleep products, and bedroom furniture. The LKG-relevant business context is Hypnos Group under LK Group, including Snooze, Future Sleep, and G&G Furniture.

Why this template and sector:

- Reviewed the LKG website and identified Hypnos Group as a portfolio business with directly relevant retail exposure.
- The Australian furniture, bedding, and sleep market is well-suited for a public-data agent workflow: competitor prices, promotional activity, investor announcements, and customer demand signals are visible in public sources without requiring proprietary data access.
- The market researcher template maps naturally onto the LKG use case — weekly digest, competitor watch, GM/Board routing, and Word output are all standard outputs of that template.

Why not Option 2 (strict data pipeline):

- Option 2 is closer to a predefined ETL or ESG data processing pipeline — each step is fixed, validators check the output of the prior step, and the rules are tightly specified.
- That pattern is well-suited to structured, schema-driven data (e.g. carbon emissions reporting, financial statement ingestion) where the input format is known and the validation logic can be hard-coded.
- The furniture market digest is more open-ended: sources vary weekly, signals differ in type and materiality, and judgment is required at each step. The market researcher template handles that variability better.

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
- Before generating Word documents, the orchestrator writes all approved research content verbatim to `output/approved-digest-{DD-MM-YYYY}.md`. This is the staging file and the single source of truth for document generation.
- The note-writer-agent reads from the staging file only. It does not reconstruct or infer content from memory.
- Post-approval demo outputs are local files with the run date appended as `DD-MM-YYYY`:
  - `output/approved-digest-{DD-MM-YYYY}.md`
  - `output/lkg-furniture-gm-weekly-digest-{DD-MM-YYYY}.docx`
  - `output/lkg-furniture-board-weekly-digest-{DD-MM-YYYY}.docx`
  - `output/lkg-furniture-internal-source-log-{DD-MM-YYYY}.docx`
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
