---
type: daily-note
date: 2026-03-30
day: Monday
week: 13
---

# Monday, March 30, 2026

## 📝 Notes



---
7:30  

Boris Cherny · 11h  
2/ Move sessions back and forth between mobile/web/desktop and terminal  

Run "claude --teleport" or /teleport to continue a cloud session on your machine.  

Or run /remote-control to control a locally running session from your phone/web. Personally, I have "Enable Remote Control for all sessions" set in my /config.  

code.claude.com/docs/en/remote...  
------
7:32

Boris Cherny @bcherny · 11h  
6/ Use the Chrome extension for frontend work

The most important tip for using Claude Code is: give Claude a way to verify its output. Once you do that, Claude will iterate until the result is great.

Think of it like any other engineer: if you ask someone to build a website but they aren't allowed to use a browser, will the result look good? Probably not. But if you give them a browser, they will write code and iterate until it looks good.

Personally, I use the Chrome extension every time I work on web code. It tends to work more reliably than other similar MCPs.

Download the extension for Chrome/Edge here: code.claude.com/docs/en/chrome
------
Twitter - 7:34 AM

Boris Cherny @bcherny · 11h  
10/ Use git worktrees  

Claude Code ships with deep support for git worktrees. Worktrees are essential for doing lots of parallel work in the same repository. I have dozens of Claudes running at all times, and this is how I do it.  

Use claude -w to start a new session in a worktree, or hit the "worktree" checkbox in the Claude Desktop app.  

For non-git VCS users, use the WorktreeCreate hook to add your own logic for worktree creation.  

Learn more: x.com/bcherny/status…  

Boris Cherny @bcherny · 11h  
11/ Use /batch to fan out massive changesets
---