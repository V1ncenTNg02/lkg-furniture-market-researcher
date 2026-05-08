---
name: gm-board-classifier
description: Classifies LKG furniture market-research findings by relevance to a portfolio company GM, the LKG board, both audiences, or neither. Use after sector overview, competitive analysis, comps/operating signals, and idea-generation outputs have been drafted.
---

# GM Board Classifier

## Purpose

Route each material market signal to the right review path.

The classifier does not approve or send messages. It creates routing recommendations for human review.

## Inputs

Classify items from:

- sector overview findings
- competitor moves
- public peer / operating signals
- demand or consumer signals
- supply-chain and margin signals
- generated GM / Board follow-up ideas

Each input item should include:

```text
Item:
What happened:
Source:
Why this matters:
Confidence:
Human-review flag:
```

## Classification Labels

Classify each material item as exactly one of:

- `GM`
- `Board`
- `Both`
- `Ignore`

## GM Routing Criteria

Use `GM` when the item is operational, tactical, or locally actionable.

Examples:

- competitor promotion or pricing change
- store-level competitor activity
- product range or merchandising change
- local delivery, installation, finance, warranty, or service offer
- inventory, supplier, fulfilment, or staffing signal
- customer experience issue
- website or online conversion benchmark
- tactical marketing opportunity

GM items should answer:

```text
What could a portfolio company GM do with this information this week or this month?
```

## Board Routing Criteria

Use `Board` when the item is strategic, portfolio-level, high-impact, or risk-oriented.

Examples:

- sector-wide demand slowdown or acceleration
- material margin pressure
- competitor expansion, contraction, or M&A
- regulatory, reputational, cyber, legal, or safety risk
- capital allocation or investment implication
- major shift in consumer behaviour, housing, or discretionary spending
- structural channel shift, such as online vs showroom-led retail

Board items should answer:

```text
What could affect LKG portfolio strategy, risk, capital allocation, or board oversight?
```

## Both Criteria

Use `Both` when an item has immediate operational relevance and strategic significance.

Examples:

- major competitor discounting that may pressure store tactics and margins
- public trading update showing weak demand and inventory pressure
- new national store rollout by a key competitor
- supplier or freight issue that affects current operations and margin outlook

## Ignore Criteria

Use `Ignore` when the item is:

- outside bedding, mattresses, sleep products, bedroom furniture, or directly adjacent home retail
- not sourced
- too generic to act on
- duplicate of another item
- stale or outside the requested time window
- low confidence and low impact
- interesting but not relevant to a GM or the board

## Routing Output Template

For each item, return:

```text
Item:
Classification: GM / Board / Both / Ignore
Reason:
Suggested recipient:
Suggested message:
Recommended follow-up:
Confidence: High / Medium / Low
Human approval required: Yes
Human review question:
```

## GM Message Template

Use this when classification is `GM` or `Both`:

```text
Audience: Portfolio Company GM
Subject: [Company / topic] - [short signal]
Why this matters operationally: [one sentence]
Suggested follow-up: [one practical action]
Source: [source name / URL]
Confidence: [High / Medium / Low]
Human approval required: Yes
```

## Board Message Template

Use this when classification is `Board` or `Both`:

```text
Audience: LKG Board
Subject: [Company / topic] - [short signal]
Strategic relevance: [one sentence]
Recommended board follow-up: [watch item / decision / question]
Source: [source name / URL]
Confidence: [High / Medium / Low]
Human approval required: Yes
```

## Review Rules

- Do not send, email, upload, or publish.
- Do not override low source confidence.
- Do not classify unsupported claims as GM or Board.
- If source quality is weak but the item may be important, classify based on likely relevance and set `Human approval required: Yes` with a specific review question.
- Keep facts separate from interpretation.
- Use `Both` sparingly; prefer a single primary audience unless both really need the item.
- Use `Ignore` confidently for noise.

## Human-In-The-Loop Rule

The classifier is advisory.

The human reviewer controls:

- whether the item is approved
- whether the classification is changed
- whether the message is edited
- whether the item is suppressed
- whether anything is circulated to a GM or the board
