# Deployment Thinking

## Demo / Prototype Mode

Use the plugin in Claude Code or Claude Cowork for analyst-led workflows.

Best fit:

- human starts the run
- human reviews source quality and classifications
- human approves Word output generation
- files are created locally or through Microsoft Word tooling

Why this mode:

- lower setup complexity
- easy to inspect plugin files
- good for live interview demo
- keeps human judgment close to the workflow

## Managed Agent Production Mode

Use Claude Managed Agents on the Claude Platform when the workflow needs to be scheduled, API-triggered, monitored, and governed.

Production flow:

```text
scheduled job / backend trigger
-> managed agent session
-> governed connectors
-> source log and digest draft
-> human approval
-> Word / SharePoint / board-pack workflow
```

## Connector Plan

Implemented for demo:

```text
web-search
```

Future production connectors:

```text
asx-announcements
abs-retail-trade
company-investor-pages
competitor-web-monitor
microsoft-365-output
approval-workflow
```

## Governance In Production

Production should include:

- source logs
- run logs
- model/tool cost logs
- connector permission controls
- human approval workflow
- output versioning
- failure alerts
- no automatic GM/Board distribution without approval

## Cost Controls

- Limit source scan to 10 relevant sources by default.
- Cache source logs where possible.
- Prefer primary sources over repeated broad search.
- Record API/search costs for reimbursement and operational planning.

## Human Review

Human review remains mandatory before circulation.

The reviewer controls:

- item approval
- GM/Board routing
- edits to interpretation
- suppression of weak or sensitive items
- final circulation decision
