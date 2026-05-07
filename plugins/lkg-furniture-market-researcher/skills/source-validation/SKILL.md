# Source Validation

description: Validates citation coverage, source reliability, confidence, and human-review flags for LKG market digest drafts.

## Validation Checklist

For each item, check:

- Is every factual claim supported by a public source link?
- Is the source primary or reputable enough for the claim?
- Is the publication/access date clear?
- Is the item inside the requested time window?
- Is the "why this matters" interpretation reasonable and not overstated?
- Is any number, quote, or specific claim traceable?
- Does the item need human review because it is low-confidence, indirect, sensitive, or high-impact?

## Source Reliability

Use this scale:

- High: official company announcement, ASX filing, ABS data, annual report, investor presentation.
- Medium: reputable business/trade media, public company website, well-sourced retail news.
- Low: unattributed summaries, social posts, search snippets, secondary commentary without evidence.

## Required Output

Return a validation table:

```text
Item:
Citation status: Complete / Partial / Missing
Source reliability: High / Medium / Low
Confidence: High / Medium / Low
Issue:
Required fix:
Human review needed: Yes / No
```

## Rules

- Do not repair missing evidence by guessing.
- If a claim is unsupported, mark it for removal or human review.
- If the source is paywalled but the claim can be supported by a public primary source, recommend replacing it.
- The final digest must clearly say it is draft work product for review.

