# Deployment Thinking

## Option 1: Plugin in Claude Code or Claude Cowork

Best when the workflow needs **human interaction**.

Use this mode for analyst-led, on-demand, or exploratory research runs where a person is present throughout the session.

Why:

1. Claude Code and Cowork are user-facing agent products — the analyst is in the loop at every step.
2. The user can inspect plugin files, steer the workflow, pause between steps, and correct the agent mid-run.
3. Good for analyst-led research where judgment calls are needed during the task.
4. Good when the output will be reviewed and edited before it goes anywhere.
5. The analyst chooses when to run the plugin — no scheduler or infrastructure needed.
6. Easier to demo and iterate locally.

Governance characteristics:

- Strong human-in-the-loop by default.
- User reviews sources, classifications, and interpretation at the review gate.
- Lower automation risk — nothing runs unsupervised.
- Harder to centralize audit trails and cost tracking at scale.

Typical flow:

```text
analyst types command in Claude Code / Cowork
-> plugin loads skill and agent instructions
-> agent scans 10 public sources
-> agent drafts digest, classifies items (GM / Board / Both / Ignore)
-> stops at human review gate
-> analyst approves, edits, or suppresses items
-> agent generates approved Word artifacts locally
-> analyst distributes manually
```

## Option 2: Cookbook on Claude Platform

Best when the workflow should run like a **backend service**.

Use this mode when the digest needs to run on a schedule, be triggered by an API call, or be integrated into a broader system without manual intervention at each step.

Think of it like a serverless function in a cloud environment — it is called by a trigger, runs the workflow, and hands results off to the next system. Claude handles all the infrastructure behind the agent (scaling, security, model routing).

Why:

1. Triggered by a scheduler or API call — no analyst needs to start the run manually.
2. Similar pattern to a scheduled backend function (e.g. a weekly Lambda or Cloud Run job).
3. Less manual interaction means fewer interruptions and a consistent cadence.
4. Better for repeatable workflows where the steps and outputs are well-defined.
5. Easier to add monitoring, structured logs, and alerts.
6. Easier to track cost, usage, tool calls, and failures centrally.
7. Better foundation for production governance and compliance.

Governance characteristics:

- Better audit trail — every run, tool call, and model response can be logged.
- Better cost tracking — API usage is metered and attributable.
- Better permission control — connector access is governed at the platform level.
- Better system monitoring — failures can trigger alerts automatically.
- Human approval before final circulation is still required and enforced in the workflow.

Typical flow:

```text
scheduler (e.g. weekly cron job on cloud)
-> triggers managed agent session via API
-> agent scans 10 public sources using governed web_search / web_fetch
-> agent drafts digest, classifies items
-> agent writes approved-digest-{date}.md staging file
-> agent calls note-writer-agent to generate Word artifacts
-> Slack MCP sends draft to responsible manager for review
-> manager approves in Slack
-> on approval: Word documents sent to GM / Board distribution list via email MCP
   or stored in shared file system via file storage connector
```

## Recommendation for This Workflow

The LKG furniture market digest is a **routine, weekly, multi-audience output** that is not a one-off personal task. It is better built as a cookbook and deployed on Claude Platform for production.

Reasons:

- It needs to run every week without an analyst manually starting it.
- A scheduler on any cloud platform is the most consistent trigger — do not rely on humans to remember.
- The output is intended for GM and Board audiences, which requires governed routing and an audit trail.
- Slack MCP integration means the responsible manager can review and approve directly in the messaging app they already use, without logging into Claude Platform.
- Once the manager approves in Slack, the agent continues: generates final documents and, if an email MCP is connected, sends them to the appropriate GM or Board distribution list.

## Connector Plan

Implemented for demo and cookbook:

```text
Claude Platform built-in web_search
Claude Platform built-in web_fetch
python-docx (local fallback for .docx generation when Word MCP is unavailable)
```

Future production connectors:

```text
Data sources:
  asx-announcements        — governed ASX filing feed
  abs-retail-trade         — ABS MHSI data tables (replaces discontinued Retail Trade series)
  company-investor-pages   — monitored operator investor relations feeds
  competitor-web-monitor   — structured competitor website monitoring

Output and distribution:
  microsoft-365-output     — governed Word / SharePoint output
  file-storage             — shared folder or Google Drive for archiving digests
  email                    — automated GM / Board distribution after approval

Workflow and memory:
  slack-mcp                — manager approval via Slack message; triggers document generation
  approval-connector       — integrates with existing approval or ticketing system
  memory-db                — stores GM / Board insight preferences and prior digest history
                             so agents can compare with previous week and flag changes
```

## Possible Problems and Answers

**Why not just use the plugin for everything?**
The plugin requires a human to start and supervise every run. For a weekly digest that goes to senior stakeholders, you want a consistent cadence and a governed audit trail — neither of which the plugin provides reliably at scale.

**Why not just use the cookbook for everything?**
The cookbook is harder to inspect and iterate on locally. During development and demo, the plugin lets you see the files, steer the agent mid-run, and adjust quickly. The plugin is the right environment for building and testing; the cookbook is the right environment for running in production.

**What exactly runs locally vs on Claude Platform?**
Local / plugin: the analyst's machine runs Claude Code or Cowork, the plugin files are read from disk, and any generated files (Word, staging file) are written to the local output folder. On Claude Platform: Claude handles all the agent infrastructure — model routing, tool call execution, scaling, security. The agent runs in Anthropic's managed environment; files belong to the session environment unless a storage or Microsoft 365 connector is configured.

**How does the plugin version connect to the cookbook version?**
Both read from the same plugin source files (`plugins/lkg-furniture-market-researcher/`). Changes to skills and agent instructions are picked up by the cookbook when it is redeployed via `deploy-managed-agent.sh`. There is no live sync — a redeploy is required to push changes.

**How would you schedule the weekly workflow?**
Use a scheduler service on any cloud platform (AWS EventBridge, Azure Scheduler, GCP Cloud Scheduler, or a simple cron job). Do not rely on a person to remember. The scheduler calls the Managed Agents API with the weekly digest prompt. The managed agent handles the rest.

**What system would trigger the managed agent?**
For the scheduled weekly workflow: a standalone scheduler calls the Anthropic Managed Agents API endpoint. For ad-hoc runs: an analyst or a connected system calls the same API endpoint directly.

**Where would the final documents be stored?**
This depends on the file system LKG already uses. If a Microsoft 365 MCP is connected, the agent writes directly to SharePoint or OneDrive. If a file-storage MCP is connected, it writes to a shared folder or Google Drive. If neither is available, documents are produced locally (as in the current demo) and the analyst uploads them manually.

**How would Slack approval work?**
Slack supports MCP integration. Instead of logging into the Claude Platform console, the responsible manager receives the digest summary in a designated Slack channel. The manager replies with an approval command. The agent listens for the approval signal via the Slack MCP and, on confirmation, continues to final document generation and distribution.

**What happens after the manager approves?**
The agent proceeds to step 10 of the workflow: the note-writer-agent reads the approved staging file and generates the three Word documents. If an email MCP is connected, the agent sends the GM digest to the GM distribution list and the Board digest to the Board distribution list. If only file storage is connected, the documents are saved to the designated folder and the manager is notified.

**How would this fit into LKG's existing systems?**
This is an example of how the market-researcher template can be adapted to automate research for the Hypnos Group. The same workflow can be applied to other LKG portfolio companies — only the skill file (the context layer) needs to be updated with the relevant industry, competitors, and audience. The agent code, subagent structure, and workflow steps stay the same.

## Governance In Production

Production should include:

- source logs per run (what was fetched, from where, with what confidence)
- run logs (agent steps, tool calls, model versions, timestamps)
- model and tool cost logs (per run, per connector, per audience)
- connector permission controls (who can access which data source and output channel)
- human approval workflow (enforced before GM/Board distribution)
- output versioning (staging file + dated Word artifacts form the audit record)
- failure alerts (notify on search failure, connector error, or empty source set)
- no automatic GM/Board distribution without explicit human approval

## Cost Controls

- Limit source scan to 10 relevant sources by default.
- Prefer primary sources over repeated broad search to avoid redundant API calls.
- Record API and search costs per run for operational planning and reimbursement.
- Cache staging files so reruns (e.g. after an edit to an approved item) do not repeat the research phase.

## Human Review

Human review remains mandatory before circulation regardless of deployment mode.

The reviewer controls:

- item approval or suppression
- GM/Board routing confirmation
- edits to interpretation or wording
- confidence threshold for board-level circulation
- final distribution decision
