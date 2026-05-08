# LKG Furniture Digest

Run the LKG furniture market researcher for a daily or weekly digest.

Use the `lkg-furniture-market-researcher` agent and follow this flow:

1. Scope the run:
   - Sector: Australian bedding, mattresses, sleep products, and bedroom furniture.
   - Business context: Hypnos Group under LK Group, including Snooze, Future Sleep, and G&G Furniture.
   - Time window: last 7 days unless the user specifies another period.
   - Output: Microsoft Word digest artifacts.

2. Use the `lkg-furniture-market-digest` skill to scan 10 public sources where relevant:
   - Hypnos / Snooze public sources
   - competitor websites
   - ASX announcements
   - company investor pages
   - ABS retail trade or household-goods data
   - reputable Australian retail/business news

3. Delegate to subagents:
   - `sector-overview-agent`
   - `competitive-analysis-agent`
   - `comps-analysis-agent`
   - `idea-generation-agent`
   - `gm-board-classifier-agent`

4. Stop for human review:
   - show GM / Board / Both / Ignore classifications
   - show sources, confidence, and review flags
   - ask for approval before final output generation

5. After human approval, delegate to `note-writer-agent` to generate (with run date suffix `DD-MM-YYYY`):
   - `output/lkg-furniture-gm-weekly-digest-{DD-MM-YYYY}.docx`
   - `output/lkg-furniture-board-weekly-digest-{DD-MM-YYYY}.docx`
   - `output/lkg-furniture-internal-source-log-{DD-MM-YYYY}.docx`

Rules:

- Public data only.
- Cite every factual claim.
- Include "why this matters" for every material item.
- Do not send or circulate files.
- Human approval is required before final artifacts are generated.

