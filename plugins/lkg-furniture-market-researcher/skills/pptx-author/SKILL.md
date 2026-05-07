---
name: pptx-author
description: Optional helper for turning the approved LKG weekly digest into a concise PowerPoint board-summary outline or file artifact.
---

# PowerPoint Board Summary

Use this skill only after the draft digest has passed source validation, GM/Board classification, and human approval.

## Output

Create a short board-summary outline or PowerPoint-ready structure:

```text
Slide 1: Weekly Market Digest - Key Takeaways
Slide 2: Competitor Watch
Slide 3: Demand And Consumer Signals
Slide 4: Supply Chain And Margin Signals
Slide 5: Items For Board Attention
Slide 6: Source Log And Review Status
```

## Rules

- One takeaway per slide.
- Keep sources on each slide or in a source appendix.
- Do not include unapproved or low-confidence claims unless clearly marked.
- Do not distribute the deck directly.
- If Microsoft PowerPoint tooling is available, prepare the content for that tool. If not, return a PowerPoint-ready outline.

