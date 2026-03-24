---
type: daily-note
date: 2026-03-24
day: Tuesday
week: 12
---

# Tuesday, March 24, 2026

## 📝 Notes



[[55 OpenClaw/Recommended Productivity and Project Management Tool Stack for AI Agents like OpenClaw]]---
7:37 AM

## my community plugins
Advanced Tables  
Advanced URI  
Dataview  
Enhanced Canvas  
Excalidraw  
Folder Canvas  
Folder notes  
Google Tasks  
Homepage  
iCal  
Kanban  
Link Exploder  
Linter  
Mind Map
Omnisearch
Recent Files  
Rollover Daily Todos  
Smart Title  
Style Settings  
Syncthing Integration  
Tasks  
Todoist completed tasks  
Todoist Sync  
ZettelFlow
---
The definitive guide to an AI-native Obsidian stack in 2026

drafts://open?uuid=6985A430-9640-4509-ACFF-4FBBEB42F6CF
2026-03-24-10-12-36
[Claude Chat](https://claude.ai/public/artifacts/5d5ea628-9ed8-4b5b-9c0f-6be5b98d6a66)

**Obsidian has quietly become the most powerful platform for AI agent integration among all productivity tools**, surpassing cloud-first alternatives like Notion, Asana, and Todoist for solo users who want AI agents to deeply engage with their knowledge base. The reason is structural: plain markdown files on a local filesystem give AI agents unrestricted, low-latency access that no SaaS API can match.   With **68+ MCP servers** now targeting Obsidian vaults,  the ecosystem has reached a tipping point — but it’s also dangerously fragmented. This guide maps the entire landscape, identifies what to keep, what to cut, and what to add to build a production-grade AI-native productivity system.

-----

## The MCP ecosystem is powerful but fragmented

The Model Context Protocol has become the dominant standard for connecting AI agents to Obsidian vaults. Three distinct architectural approaches have emerged,…

# The definitive guide to an AI-native Obsidian stack in 2026
[Claude Chat](https://claude.ai/public/artifacts/5d5ea628-9ed8-4b5b-9c0f-6be5b98d6a66)

**Obsidian has quietly become the most powerful platform for AI agent integration among all productivity tools**, surpassing cloud-first alternatives like Notion, Asana, and Todoist for solo users who want AI agents to deeply engage with their knowledge base. The reason is structural: plain markdown files on a local filesystem give AI agents unrestricted, low-latency access that no SaaS API can match.   With **68+ MCP servers** now targeting Obsidian vaults,  the ecosystem has reached a tipping point — but it’s also dangerously fragmented. This guide maps the entire landscape, identifies what to keep, what to cut, and what to add to build a production-grade AI-native productivity system.

-----

## The MCP ecosystem is powerful but fragmented

The Model Context Protocol has become the dominant standard for connecting AI agents to Obsidian vaults. Three distinct architectural approaches have emerged, each with different tradeoffs:

**Plugin-based servers** run inside Obsidian itself. The **MCP Tools plugin** (jacksteamdev, **577 stars**) is the most established — it bundles a signed MCP server binary that auto-configures Claude Desktop’s `claude_desktop_config.json`.  It exposes **18 tools** including vault CRUD, semantic search (via Smart Connections), and Templater template execution.  Setup is one-click: install the plugin, click “Install Server,” restart Claude Desktop.  However, **MCP Tools is actively seeking new maintainers** (applications open until September 2025),  creating uncertainty.  A strong alternative is **aaronsb/obsidian-mcp-plugin** (250 stars, very active), which treats the vault as a connected knowledge graph with backlink analysis and concept discovery  — a fundamentally richer model for AI reasoning. 

**REST API bridge servers** wrap the Local REST API plugin. The most-starred project in the entire ecosystem is **MarkusPfundstein/mcp-obsidian** (**2,800 stars**),  a Python server exposable via `uvx mcp-obsidian`. The TypeScript alternative, **cyanheads/obsidian-mcp-server**, adds enterprise features like in-memory vault caching, case-insensitive path fallbacks, and dedicated frontmatter/tag management tools.  Both require Obsidian to be running.

**Filesystem-based servers** need no Obsidian plugins at all. **MCPVault** (@bitbonsai/mcpvault, **686 stars**,  v0.11.0 as of March 2026)  operates directly on vault files with BM25 search, safe YAML handling, and **token-optimized responses 40–60% smaller** than alternatives.  It works with Claude Desktop, Claude Code, ChatGPT Desktop (Enterprise+), Gemini CLI, Cursor, and more.  Configuration is a single line: `npx @bitbonsai/mcpvault@latest /path/to/vault`.

**The recommended approach for a power user**: Run **MCPVault** as your always-available baseline (works even when Obsidian is closed), plus the **aaronsb plugin** when Obsidian is open for graph-aware operations. This gives you both filesystem reliability and knowledge-graph intelligence. If you need semantic search through MCP, add Smart Connections and use MCP Tools for its `search_vault_smart` capability.

|Capability               |MCP Tools                |MCPVault         |mcp-obsidian (Python)|aaronsb plugin   |
|-------------------------|-------------------------|-----------------|---------------------|-----------------|
|Requires Obsidian running|Yes                      |**No**           |Yes                  |Yes              |
|Semantic search          |✅ (via Smart Connections)|❌                |❌                    |✅ (graph-based)  |
|Template execution       |✅ (Templater)            |❌                |❌                    |❌                |
|Graph/backlink analysis  |❌                        |❌                |❌                    |**✅**            |
|Frontmatter management   |Via patch                |✅ (safe YAML)    |✅                    |✅                |
|Move/rename files        |❌                        |**✅**            |❌                    |❌                |
|Stars / maintenance      |577 / seeking maintainers|686 / very active|2,800 / moderate     |250 / very active|

-----

## The Local REST API remains the foundational bridge

The **Obsidian Local REST API** plugin (coddingtonbear, **1,800 stars**, v3.2.0) is the infrastructure layer underneath much of the MCP ecosystem. It runs an HTTPS server on port **27124** (HTTP on 27123) and exposes a comprehensive API covering vault CRUD, surgical content patching (append/prepend/replace within specific headings or block references), Dataview DQL queries, command execution, periodic notes, and tag listing.  Version 3.2.0 added a runtime-accessible **OpenAPI spec** at `/openapi.yaml`. 

**For AI agent integration**, the REST API’s killer feature is its surgical patching capability. An AI agent can modify a specific section under a heading, update a single frontmatter field, or append to a block reference — without touching the rest of the note.  This is critical for reliable agent operations on structured notes like daily logs, project trackers, or CRM entries.

The security model uses **Bearer token authentication** and listens on localhost only. One notable limitation: **on macOS, the plugin becomes unresponsive when Obsidian is not in the foreground** — a documented issue that matters for background agent operations.  The workaround is to keep Obsidian visible or run it in a Docker container with KasmVNC for headless 24/7 availability. 

Other plugins can register custom routes via the API extension interface,  making it possible to expose any plugin’s functionality to external agents. This extensibility means the REST API is not just a bridge — it’s a platform.

-----

## Smart Connections delivers local-first RAG without API costs

**Smart Connections** (brianpetro, **4,300 stars**, v4.1.8) is the semantic intelligence layer of the stack. It generates vector embeddings for every note and block in your vault, then uses cosine similarity to surface semantically related content.  The default model, **TaylorAI/bge-micro-v2** (384 dimensions), runs entirely in-browser via Transformers.js — **zero setup, zero API calls, fully offline**. 

For larger vaults or higher-quality retrieval, Smart Connections supports **Ollama** (mxbai-embed-large, nomic-embed-text), **LM Studio**, and OpenAI’s text-embedding-3 models. The plugin indexes at both note-level and block-level granularity, stores embeddings locally in `.smart-env/` as `.ajson` files, and incrementally re-embeds only modified content.

The v4 restructuring split the ecosystem: **Smart Connections** (free) handles embeddings and the connections sidebar, while **Smart Chat** (separate plugin, free tier + paid Pro) provides RAG-powered conversations with your vault.  Smart Chat retrieves relevant context from embeddings and sends it alongside queries to your chosen LLM. Chat threads save as markdown notes in the vault. 

**Performance considerations for large vaults**: Initial indexing is CPU-intensive.  Set the max import file size (default 300KB, configurable in `smart_env.json`) and exclude archive folders to reduce processing.  After indexing, day-to-day retrieval is lightweight.  If using Syncthing, add `.smart-env/` to your ignore patterns to prevent sync conflicts. 

**The strategic value**: Smart Connections provides the semantic retrieval that MCP Tools exposes as `search_vault_smart`.  This means Claude can ask “find notes related to quarterly planning” and get semantically relevant results, not just keyword matches. For a power user with thousands of notes, this transforms the vault from a filing cabinet into a searchable knowledge graph.

-----

## OpenClaw turns your vault into an AI agent’s persistent memory

**OpenClaw** (formerly Clawd, then Moltbot) is the fastest-growing open-source project in recent memory — **250,000+ GitHub stars** as of March 2026.  Created by Peter Steinberger (PSPDFKit founder, now at OpenAI), it’s a self-hosted Node.js gateway connecting AI models to messaging platforms (WhatsApp, Telegram, Discord, Signal, Slack, iMessage)  with **13,000+ community skills**. 

The Obsidian integration operates on two levels. The **ObsidianClaw plugin** (installable via BRAT, pending official store approval) embeds a chat sidebar directly in Obsidian with streaming WebSocket responses, “ask about this note” commands, active file detection, and the ability for the agent to read/write vault files.  Authentication uses **Ed25519 keypairs** with Tailscale WireGuard encryption. 

The more popular pattern is **vault-as-memory**: mount your Obsidian vault into OpenClaw’s workspace directory and let the agent use files as persistent memory.   The community convention structures this as `Journal/` (dated session logs), `Memory/` (curated long-term context), `Notes/` (captures from channels), and `AGENT.md` (the AI’s entry point). The agent wakes up stateless each session and reconstructs context from files — a durable, human-readable memory system.

**Security warning**: Cisco’s security team found third-party OpenClaw skills performing **data exfiltration and prompt injection**.  If using cloud LLM providers, vault contents are transmitted as context.  For maximum safety, run local models and vet skills carefully. A known bug in OpenClaw versions 2026.3.1–2026.3.13 silently rejects `app://` origins, breaking the Obsidian plugin — downgrade to 2026.2.26 as a workaround. 

-----

## Seven critical plugins your stack is missing

Your current plugin list has significant gaps in task management, templates, automation, and backup. Here are the highest-priority additions ranked by impact:

- **Tasks** — The #1 recommended Obsidian productivity plugin across every 2025–2026 guide. Adds due dates, recurrence, priorities, scheduled/start dates, and powerful filter queries to standard markdown checkboxes.  Your stack has no structured task management at all — this is the single most impactful addition.
- **Templater** — Dynamic template engine with JavaScript execution, date formatting, file operations, and conditional logic.  The foundation for serious automation.  Pairs with QuickAdd for capture workflows and with MCP Tools for AI-triggered template execution.
- **QuickAdd** — Combines templates, captures, and macros into single-keystroke workflows.   One hotkey can create a templated meeting note, populate metadata, add it to a Kanban board, and insert a reference in your daily note. 
- **Calendar + Periodic Notes** — Calendar provides the visual daily-note navigator sidebar; Periodic Notes extends to weekly/monthly/quarterly/yearly reviews.   Together they create structured time-based knowledge architecture essential for GTD and periodic reviews.
- **Obsidian Git** — Your stack has **no backup or version control solution**. This is a critical risk. Obsidian Git auto-commits at configurable intervals  with full diff history and rollback.   Non-negotiable for a vault you’re giving AI agents write access to.
- **Commander** — Custom toolbar buttons and startup macros.  Build a “Start My Day” sequence: create daily note → apply template → open sidebar → navigate to dashboard.

Additionally, **enable the Obsidian Bases core plugin** immediately. Bases is Obsidian’s native, GUI-driven database — dramatically faster than Dataview (especially on mobile) and positioned as the first-party answer to Notion’s databases.  Use Bases for simple table/list views and keep Dataview for complex DQL queries and DataviewJS scripting.

-----

## What to cut, replace, and reconsider

**Cut or replace these plugins:**

The **Google Tasks** plugin hasn’t been updated in approximately three years  and is effectively unmaintained. Replace it with **Tasks + Morgen** (a standalone calendar app with first-party Obsidian Tasks integration that syncs tasks to your calendar with drag-and-drop time-blocking).  The original **Mind Map** plugin targets Obsidian API v0.9.20  and is outdated — replace with **Mind Map NextGen** (actively maintained fork) or simply rely on Excalidraw, which is far more capable for visual brainstorming. **Telegram Inbox** is functional but basic; **Telegram Sync** is a more feature-rich alternative supporting voice transcription, file attachments, custom templates, and auto-deletion of processed messages.

**Evaluate these for actual usage:**

**Folder Canvas** and **Link Exploder** both generate Canvas views from vault content but serve different purposes (folder structure vs. link relationships). Keep both only if you actively use Canvas for exploration — otherwise the overlap is unnecessary. **Advanced Tables** partially overlaps with Obsidian’s improved native table editing in v1.5.3+, but remains uniquely valuable for spreadsheet formulas and Excel-like navigation.  **Obsidian Shared to Notion** (actively maintained via Share to NotionNext) is worth keeping if you collaborate with Notion users, but evaluate whether you still need this bridge.

**Gaps to fill by category:**

For **personal CRM**, your stack has nothing. The lightest solution is **Obsidian CRM** (TalkingQuickly/obsidian-crm) for quick people-note capture, or build a DIY system: a `People/` folder with person templates (name, company, email, last_contact, tags)  queried through Bases. For **mobile quick capture**, add **Quick Capture for Obsidian** (dedicated iOS/Android app with text, voice transcription, photos, and widget support)  alongside your Telegram workflow. For **AI orchestration within Obsidian**, add **Copilot for Obsidian** (100K+ users, supports OpenAI/Anthropic/Google/Ollama)  or **Obsidian Skills** (by @kepano, Obsidian’s founder) for persistent, task-oriented AI agents within your vault. 

-----

## Obsidian versus the SaaS stack for AI-native solo productivity

The comparison comes down to a structural advantage: **local plain-text files give AI agents fundamentally better access than any cloud API**.  Blake Crosley’s technical reference demonstrates this concretely — **16,894 files, 49,746 chunks, 23ms queries, zero API calls, one 83 MB SQLite file**.  No SaaS tool can match that retrieval speed or privacy guarantee.

Notion launched its own MCP server (mcp.notion.com) and shipped   AI Agents in Notion 3.0  (September 2025), but these are cloud-dependent — your data travels through Notion’s servers and their LLM providers. Obsidian lets you run the entire RAG pipeline locally  with Smart Connections + Ollama, or connect to any cloud provider on your terms. 

**Where SaaS still wins**: real-time collaboration (Obsidian has no Google Docs-style co-editing),  polished mobile apps,  cross-app automation via Zapier/Make (Obsidian requires middleware like n8n), built-in structured databases (Notion’s relational databases remain more mature than Bases), and zero-setup onboarding. For a solo user, most of these advantages are less relevant — you don’t need collaboration, you can invest in setup, and n8n (self-hosted) replaces Zapier for free.

**The cost differential is stark.** Obsidian with Sync runs **$60/year**.  A comparable SaaS stack (Notion Business for AI + Todoist Pro + Slack) costs **$400–500+/year** before adding Zapier ($240–900/year for automation). Obsidian’s AI capabilities come free through community plugins  — you only pay for cloud API usage if you choose to.

The optimal strategy for a solo AI power user is **Obsidian-primary with surgical SaaS supplements**: use Todoist only if you need push-notification reminders Obsidian can’t provide, keep the Notion bridge only for external collaboration, and run n8n self-hosted for any cross-app automation. Everything else stays local.

-----

## The recommended production stack

Here is the complete optimized configuration, organized by function:

**Core system**: Obsidian + Obsidian Sync (or Syncthing + Obsidian Git for free) + Bases (core plugin) + Homepage + Linter + Folder Notes

**Task and project management**: Tasks + Kanban + Dataview (complex queries) + Bases (simple views) + Day Planner + Calendar + Periodic Notes + Commander 

**AI agent layer**: MCPVault (filesystem MCP, always-on) + aaronsb MCP plugin (graph-aware, when Obsidian is open) + Smart Connections (semantic search/RAG) + Copilot for Obsidian or Smart Chat (in-vault AI chat) + OpenClaw (autonomous agent with vault-as-memory)

**Knowledge and creativity**: Excalidraw + Enhanced Canvas + Link Exploder + Omnisearch  + Advanced URI + Advanced Tables + Tag Wrangler

**Capture and integration**: Telegram Sync (upgrade from Telegram Inbox) + Quick Capture app (mobile) + iCal + Obsidian Web Clipper + Share to NotionNext (if needed)

**Automation**: Templater + QuickAdd + Commander + n8n (self-hosted, for external triggers)

**Backup**: Obsidian Git (auto-commit every 10 minutes, push to private GitHub repo) — this is especially critical now that AI agents have write access to your vault. 

The key insight is that **Obsidian’s value compounds nonlinearly with AI integration**. Every note you write becomes retrievable context for AI agents. Every link you create enriches the knowledge graph  that graph-aware MCP servers can traverse.  Every template you build becomes executable by AI via MCP Tools. The system gets smarter as you use it — and unlike SaaS platforms, you own every byte of that intelligence. 