# LKG Market Digest

Prepare a weekly LKG bedding and bedroom furniture market digest.

Use the `market-researcher` agent and run this workflow:

1. Scope the run:
   - Sector: Australian bedding, mattresses, sleep products, and bedroom furniture.
   - Time window: last 7 days unless the user specifies otherwise.
   - Audience: LKG analyst, portfolio company GM, and LKG board reviewer.
   - Output: Word-style memo plus source log unless the user requests Excel or PowerPoint.

2. Invoke `research-agent` with the `lkg-research-plan` skill.

3. Invoke `weekly-digest-writer` with the `weekly-digest-template` skill.

4. Invoke `source-validator` with the `source-validation` skill.

5. Invoke `gm-board-classifier` with the `gm-board-classification` skill.

6. Stop for human approval before any notification or circulation.

Final response should include:

- The draft weekly digest.
- Source log.
- GM items.
- Board items.
- Items requiring human review.
- A clear statement that the digest is draft work product and not approved for circulation until a human reviewer signs off.

