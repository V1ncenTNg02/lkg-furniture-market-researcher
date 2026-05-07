# GM Board Classification

description: Classifies market digest items by relevance to portfolio company GMs, the LKG board, both audiences, or neither.

## Classification Labels

Use exactly one:

- GM: operationally relevant to a portfolio company general manager.
- Board: strategically relevant to the LKG board.
- Both: relevant to both operational and strategic audiences.
- Ignore: not material enough for circulation.

## GM Criteria

Classify as GM when the item affects:

- Store operations.
- Local competitor promotions.
- Pricing or discounting.
- Product range decisions.
- Inventory or stock planning.
- Staff, supplier, delivery, or fulfilment operations.
- Tactical marketing or customer acquisition.

## Board Criteria

Classify as Board when the item affects:

- Sector-wide demand or margin outlook.
- Strategic competitor expansion or contraction.
- M&A, consolidation, or ownership changes.
- Major regulatory, reputational, financial, or cyber risk.
- Capital allocation, investment, or portfolio strategy.
- Material changes in consumer spending, housing, or macro conditions.

## Both Criteria

Classify as Both when the item has immediate operational implications and strategic significance.

## Message Templates

GM note:

```text
Audience: GM
Subject: [Company/Topic] - [short signal]
Why it matters operationally: [one sentence]
Suggested follow-up: [one action]
Human review status: [Approved / Needs edit / Suppress]
```

Board note:

```text
Audience: LKG Board
Subject: [Company/Topic] - [short signal]
Strategic relevance: [one sentence]
Recommended board follow-up: [one action or watch item]
Human review status: [Approved / Needs edit / Suppress]
```

## Output Format

For each item:

```text
Item:
Classification: GM / Board / Both / Ignore
Reason:
Draft GM note:
Draft Board note:
Human routing decision required: Yes
```

## Rules

- Classification is a recommendation only.
- The human reviewer decides final routing.
- Do not send messages directly to any audience.

