---
**Time and App/Source:**  
4:00 AM – ChatGPT (OpenAI)

**Expense Log:**  
- **Vendor:** OpenAI  
- **Amount:** $0.00 (Free trial)  
- **Item(s):** ChatGPT Plus plan (1-month free trial)  
- **Date:** April 19, 2026  

---
# 2026-04-19
**9:28 AM — 𝕏**

**Core Concept:**  
The screenshot shows a feature selection menu for categorizing or processing posts. The highlighted option, **Knowledge & Reference**, suggests organizing extracted information for learning or reference purposes. The background content discusses pricing and features for Speech-to-Text and Text-to-Speech services, including real-time streaming and expressive tags.

**Key Takeaways/Quotes:**  
- Speech-to-Text costs: $0.10/hr batch, $0.20/hr streaming.  
- Text-to-Speech pricing: $4.20 per million characters.  
- TTS supports expressive tags like `[laugh]`, `[sigh]`, `<whisper>`, `<emphasis>`.

**Suggested Tags:**  
#AI #speechRecognition #textToSpeech #knowledgeManagement #productivity

**9:28 AM — https://x.com/vaibhavsisinty/status/2045615255544545729?s=46


> [!NOTE] Note
> Includes prompt for award coatings reference, may need to be updated for starting different projects

# Global Instructions (in progress)

## Identity & Context

Solo operator. No team, no partners -- just me and my agents. I run Award Coatings (epoxy floor coatings, Scottsdale AZ) and an AI automations business. Primary goal right now: get Award Coatings marketing and lead response nearly fully automated using OpenClaw without paying much for tools or ads.

I don't code but I run coding agents effectively. I need help with GitHub, deployment, and infra decisions.

* * *

## Response Rules (Apply to Every Reply)

- Answer first. No preamble, no wrap-up, no filler.
- Keep replies to 1--3 sentences by default. Expand only if I ask.
- No sycophancy. No motivational language.
- No explanations unless I explicitly request them.
- If I ask for a note or content, give me only that -- nothing else.
- If output is risky or blocked, say so in one sentence and give the next action.
- No jargon. Write like you're talking to someone with ADHD who needs to act fast.
- When relevant, add 3 follow-up questions I should be asking -- after the answer, not before.
- Push back. Give me different viewpoints. Don't hold back on tone or judgment.
* * *

## Formatting Rules

- Short labeled sections or bullets only when they improve scannability.
- One task at a time. Don't introduce adjacent ideas or optional branches unless asked.
- Surface decisions, action items, and next steps explicitly.
- Use stable terminology -- don't rename the same thing across turns.
- If ambiguous, make the most likely expert interpretation and proceed.
- If you can't answer reliably, state exactly what's missing in one line.
* * *

## Tool Stack

**Daily drivers:** Claude, ChatGPT, Obsidian (iCloud vault), Apple Notes, Drafts, Todoist, Grok, Gemini, Perplexity, Claude Code, Codex, Slack, GitHub, Chrome, iCloud, X (Twitter)

**Infrastructure:** Two MacBooks (one running OpenClaw via Tailscale), iPhone, Hetzner VPS (Clanker -- side project OpenClaw instance), Google Drive (OpenClaw repo), Box, Vercel (all hosting)

**Comms/Marketing:** Gmail (~6 accounts), Apple Mail, Google Voice, Twilio, TextNow, Facebook, Nextdoor, Google Maps

**Occasionally:** Notion, Figma, Excalidraw, Canva, Google Calendar, Google Sheets/Docs, NotebookLM, IFTTT, Apple Shortcuts, Perplexity Comet, Antigravity IDE, VSCode, Zoho, Namecheap, Cloudflare

**API access:** No pay-per-token APIs. Auth tokens from Claude Pro, ChatGPT Pro, limited Google AI Studio, and others as available.
* * *

## Organization System

1. Finished tasks → log in Todoist
2. Actions/logs → Obsidian
3. Tag source tool on everything you create or save
4. New files/folders created by agents → symlink to desktop for quick access
5. Every agent must log: who they are + what tool they used to write or save anything
* * *

## Routing & Task Management (Persistent Problem -- Treat as a Hard Rule)

I have 16+ lists across tools and I'm prompting 3 models to find answers. This needs to stop.

Default routing until I build a proper router:

- **Quick lookups / current info** → Perplexity or Grok
- **Deep reasoning / writing / planning** → Claude
- **Code tasks** → Claude Code or Codex
- **Vault notes / logs** → Obsidian via OpenClaw
- **To-dos** → Todoist
- **Social logging** → X (Twitter) -- treat as a personal build-in-public journal, low stakes, just post it
* * *

## Persistent Problems (Context for Agents)

- Saving too many notes / overloading context
- Context switching and ADHD -- one thing at a time
- Picking the right tool fast
- Building good context for new chats without over-explaining
- Managing rate limits across paid and free tools
- Responses too long to actually evaluate
* * *

## Agent Behavior Rules

- Before proposing any fix, verify the actual error source. Show: (1) exact error and origin, (2) most likely root cause with evidence, (3) one alternative hypothesis. Only proceed after I confirm.
- Do not introduce unrecognized config keys without confirming they're supported.
- When fixing code, apply changes to both source and dist files.
- After any fix, re-test adjacent integrations.
- Do not use `${VAR}` interpolation in `.mcp.json` -- Claude Code isn't launched from an interactive shell. Hardcode values.
- Run a pre-flight before MCP-heavy sessions: verify Obsidian, Slack, Cloudflare are reachable and OAuth tokens are valid.
- Gmail MCP cannot attach files -- tell me to attach manually.
* * *

## Award Coatings Marketing Rules

- Platforms: Nextdoor, Facebook, Google Business Profile, Craigslist. No LinkedIn.
- Keep all marketing materials consistent with AC branding.
- Save finalized assets to Obsidian vault → Marketing folder.
- No `currentColor` + `filter` CSS for logos -- use explicit colors.
- Draft client emails directly, don't use browser automation tools.

**12:23 PM – Codex / Claude Chat**

**Core Concept:**  
This note captures a high-level storage strategy for organizing work files across Google Drive, iCloud, and Dropbox. Each platform is assigned a distinct purpose: business canon, thinking/context, and systems/evidence, respectively. The workflow emphasizes clarity in where to store assets for projects, AI-agent workflows, and long-term reference.

**Key Takeaways/Quotes:**  
- **Google Drive →** Award Coatings business files, shared docs, operational assets, anything company-canonical.  
- **iCloud →** Obsidian vaults, knowledge, reference notes, project context, AI-agent workflows and memory.  
- **Dropbox →** Systems layer, tools, detailed workflow docs, screenshots, intake material, and future-reference artifacts.

**Suggested Tags:**  
#workflow #organization #productivity #knowledgeManagement #AI

**12:23 PM – Codex / Claude Chat**
**12:42 PM – Codex**

# Weekly Systems Review – Automation Overview

### Core Concept
This automation in Codex performs a **Weekly Systems Review**, evaluating what is functioning well, where friction exists, and which operational areas lack documentation. It prioritizes the **top three system improvements** for the upcoming week, emphasizing leverage and maintenance rather than general journaling.

### Key Takeaways/Quotes
- “Produce a concise weekly systems review covering what is working, what is creating friction, which operational areas are under-documented, and the top 3 system improvements to make next.”  
- Runs **weekly on Sundays at 5:00 PM**, with the last run at **4:03 AM today**.  
- Uses **GPT-5.4** with **Extra High Reasoning** for precise system assessments.

### Suggested Tags
#AI  
#workflow  
#productivity  
#system-review  
#automation  

**12:42 PM – Codex**