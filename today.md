---
kind: daily
type: daily-note
date:
day:
week:
energy:
---

# Daily Note

> [!important]
> Keep this note concise and operational.
> Manual thinking belongs in `## 📝 Notes`.
> Automations should only write inside named blocks or clearly designated sections.

## Morning Priorities

### Top 3
- [ ]
- [ ]
- [ ]

### Carryover from Yesterday
- 

### Key Meetings or Commitments
- 

### Biggest Risk to Address First
- Risk:
- First move:

---

## 📅 This Week
- 

## 📋 Needs Decision (This Week)
- [ ]

## 💰 Money to Collect
- [ ]

## 🔧 Maintenance (When You Have Time)
- [ ]

## 🗄️ Backlog (Not This Week)
- 

---

## 🧹 Cleaned Up Today
- 

## 💡 Yesterday's Key Insights
- 

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
- 

%% COMPLETED_TODOIST_TASKS_START %%
- None yet today.
%% COMPLETED_TODOIST_TASKS_END %%

%% MISSED_FROM_LOGS_START %%
- No obvious missed items detected from logs.
%% MISSED_FROM_LOGS_END %%

- [ ] Finish vault-manager skill.
- [ ] Review FB ads workflow.
- [ ] Respond to any leads from Saturday.
- [ ] What is the first workflow worth operationalizing: screenshot intake or browser control?
- [ ] Should screenshot intake live in the default screenshot folder, Dropbox, or the developer folder?
- [ ]
**10:56 PM – Outlook Email Creation**

---

### Core Concept
This note records the creation of a **new Outlook email account**. The new address is `jadens-assistant@outlook.com`, set up via Microsoft’s signup portal.

### Key Takeaways / Quotes
- **New Email Created:** `jadens-assistant@outlook.com`  
- **Signup Completed Through:** `signup.live.com`  
- This account is ready for future use and login.

### Suggested Tags
#outlook #email #accountsetup #productivity

---

**10:56 PM**