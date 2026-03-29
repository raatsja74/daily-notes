---
kind: daily
type: daily-note
date: 2026-03-29
day: Sunday
week: 13
energy:
---

# Daily Note

> [!important]
> Keep this note concise and operational.
> Manual thinking belongs in `## 📝 Notes`.
> Automations should only write inside named blocks or clearly designated sections.

## Morning Priorities

### Top 3
- [ ] Finish vault-manager skill.
- [ ] Review FB ads workflow.
- [ ] Respond to any leads from Saturday.

### Carryover from Yesterday
- Yesterday added real system scaffolding: [[05 Automations/MacOS/README]] now documents screenshot intake to Todoist, and [[60 Workflows/00 Active Workflows/Active Workflows README]] defines how active workflows should live in the vault.
- Award Coatings blockers from [[50 Daily Notes/2026-03-28]] still look open.

### Key Meetings or Commitments
- No calendar events were captured in yesterday's daily note.

### Biggest Risk to Address First
- Risk: system docs and templates are ahead of one verified working loop.
- First move: run one screenshot test and attach it to one actual workflow note.

---

## 📅 This Week
- Verify the macOS screenshot watcher described in [[05 Automations/MacOS/README]].
- Use the new active-workflow structure for one live process instead of loose notes.
- Run the Drafts capture test called out in [[50 Daily Notes/Home Page]].
- Unblock Award Coatings by completing the Facebook groups first step from [[50 Daily Notes/2026-03-28]].

## 📋 Needs Decision (This Week)
- [ ] What is the first workflow worth operationalizing: screenshot intake or browser control?
- [ ] Should screenshot intake live in the default screenshot folder, Dropbox, or the developer folder?

## 💰 Money to Collect
- [ ]

## 🔧 Maintenance (When You Have Time)
- Check whether Drafts filesystem exports are enabled and still writing usable artifacts.
- Keep the daily-note recap pointed at the live iCloud vault path, not just the worktree copy.

## 🗄️ Backlog (Not This Week)
- Broader cleanup of low-signal recap sources if silent days remain common.

---

## 🧹 Cleaned Up Today
- Rebuilt today's recap from the live vault's March 28 activity and Apple Notes.

## 💡 Yesterday's Key Insights
- Yesterday's real work was operational: [[05 Automations/MacOS/README]] documents a screenshot watcher that emails new captures into Todoist and avoids duplicate sends.
- You also set up a clearer workflow system with [[60 Workflows/00 Active Workflows/Active Workflows README]] and [[60 Workflows/00 Active Workflows/_Workflow Template]] so in-flight work has one home.
- [[50 Daily Notes/Home Page]] now points at three concrete system priorities: Award Coatings AI GTM prompt bank, the first browser workflow, and one verified Drafts capture loop.
- Apple Notes still shows an unresolved intake-path question around Dropbox vs developer-folder storage for screenshots.

## 📂 Files Touched Today

```dataview
TABLE WITHOUT ID
	link(file.path, file.name) AS File,
	choice(date(file.ctime) = date(this.file.frontmatter.date), dateformat(file.ctime, "HH:mm"), "—") AS Created,
	choice(date(file.mtime) = date(this.file.frontmatter.date), dateformat(file.mtime, "HH:mm"), "—") AS Updated
FROM ""
WHERE file.path != this.file.path
	AND (
		date(file.ctime) = date(this.file.frontmatter.date)
		OR date(file.mtime) = date(this.file.frontmatter.date)
	)
SORT file.mtime DESC
```

## 📝 Notes
- 

## 🔗 Shared or Referenced Today
%% SHARE_START %%

%% SHARE_END %%

## 🗂️ Session Logs
- Obsidian markdown modified on 2026-03-28: [[50 Daily Notes/2026-03-28]], [[05 Automations/MacOS/README]], [[60 Workflows/00 Active Workflows/Active Workflows README]], [[60 Workflows/00 Active Workflows/_Workflow Template]], [[90 Systems/Templates/Workflow Notes Template]], [[90 Systems/AI Context]], [[50 Daily Notes/Home Page]].
- `99 Logs` entries dated or updated on 2026-03-28: none detected.
- Drafts modified on 2026-03-28: none returned by AppleScript.
- Apple Notes modified on 2026-03-28: `Screenshot Workflow`; `Dropbox for screenshots and developer folder`.

%% COMPLETED_TODOIST_TASKS_START %%
- None yet today.
%% COMPLETED_TODOIST_TASKS_END %%

%% MISSED_FROM_LOGS_START %%
- No obvious missed items detected from logs.
%% MISSED_FROM_LOGS_END %%
---
7:38 AM – Perplexity

🎯 High Risk/Highest Reward Workflows

1. Fully Automated Lead Scraping & Cold Outreach  
- **What it does:** Uses OpenClaw to scrape local business data (Google Maps, Facebook Groups, Nextdoor) for homeowners/contractors, qualifies leads via AI, and pushes them into automated cold email/SMS sequences (e.g., via Instantly).  
- **High reward:** Generates 200+ qualified leads/day without database subscriptions; reduces manual prospecting time by 80%+; fuels predictable sales pipeline for epoxy jobs.  
- **High risk:** Violates platform ToS (scraping may trigger IP bans); risks spam complaints/CAN-SPAM violations if opt-out handling isn’t flawless; poor lead quality can damage sender reputation.

2. AI Meta Ads Manager (24/7 Campaign Optimization)

------
7:43

**Note to Fix Drafts Actions**

- Review the script in the Drafts action triggering the error.  
- Error: `TypeError: undefined is not an object (evaluating 'lines[curIndex].length')`  
- Occurs at **Line 645, Column 22**.  
- Likely cause: `curIndex` is out of bounds or `lines[curIndex]` is undefined.  
- Action Steps:  
  1. Add a check to ensure `curIndex` is within the array length before accessing.  
  2. Log `lines` and `curIndex` values during execution for debugging.  
  3. Test the action with various input lengths.  
---