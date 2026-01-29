# 📁 LifeOS Scripts & Commands - File Index

## 📋 What You Have Here

This package contains all the TypeScript scripts, batch launchers, command templates, and configuration files for your AI-Native Obsidian vault.

---

## 🗂️ File Structure

### 📝 Configuration Files

#### `project-config.json`
**Location:** `000 OS/AI/scripts/`  
**Purpose:** Main configuration file that tells the system where your coding projects are located

**What it contains:**
- Project names
- File system paths to your actual projects
- Which files to sync (README.md, PRD.md, etc.)
- Programming language
- Project status (active, planning, completed)

**How to use:**
1. Open this file in any text editor
2. Replace example paths with YOUR actual project paths
3. Add/remove projects as needed
4. Use double backslashes in Windows paths: `C:\\Users\\...`

**Example entry:**
```json
{
  "name": "MyApp",
  "path": "C:\\Users\\YourName\\projects\\myapp",
  "files_to_sync": ["README.md", "PRD.md", "TODO.md"],
  "language": "JavaScript",
  "status": "active"
}
```

---

### 🔧 TypeScript Scripts

#### `sync-projects.ts`
**Location:** `000 OS/AI/scripts/`  
**Purpose:** Syncs external project files into your vault

**What it does:**
1. Reads `project-config.json`
2. For each project:
   - Creates a project note in `300 Entities/Projects/Coding/`
   - Copies README.md, PRD.md, etc. to `_synced/` folder
   - Links everything together
3. Shows colorful progress output

**Run with:** `bun run sync-projects.ts` or double-click `RUN-sync-projects.bat`

---

#### `generate-coding-summaries.ts`
**Location:** `000 OS/AI/scripts/`  
**Purpose:** Creates a comprehensive overview of all your coding projects

**What it does:**
1. Scans all project notes in `300 Entities/Projects/Coding/`
2. Extracts:
   - Project status, language, path
   - Summary sections
   - Open tasks
   - Last modified dates
3. Generates organized markdown report
4. Groups projects by status and language
5. Shows statistics

**Output:** `200 Notes/Coding Project Summaries.md`

**Run with:** `bun run generate-coding-summaries.ts` or double-click `RUN-generate-summaries.bat`

---

#### `setup-week.ts`
**Location:** `000 OS/AI/scripts/`  
**Purpose:** Creates weekly note + 5 daily notes (Monday-Friday)

**What it does:**
1. Calculates the current week or a specified date
2. Creates a weekly note with:
   - Top 3 goals
   - Weekly reflection sections
   - Links to all daily notes
3. Creates 5 daily notes (Mon-Fri) with:
   - Top 3 priorities
   - Schedule template
   - Inbox, action items, blockers
   - Daily reflection

**Run with:** 
- Current week: `bun run setup-week.ts`
- Specific date: `bun run setup-week.ts 2025-02-10`
- Or double-click `RUN-setup-week.bat`

---

### 🖱️ Batch Launchers (Windows)

#### `RUN-sync-projects.bat`
**Double-click this** to sync all external projects into vault

#### `RUN-generate-summaries.bat`
**Double-click this** to generate project overview report

#### `RUN-setup-week.bat`
**Double-click this** to create weekly and daily notes

**What they do:**
- Change to the correct directory
- Run the corresponding TypeScript script using Bun
- Show success/error messages
- Pause so you can read the output

---

### 📝 Command Templates

These are AI prompt templates you can copy and fill in.

#### `generate-code.md`
**Location:** `000 OS/AI/commands/coding/`  
**Purpose:** Template for generating new code

**Use when:** You want AI to write code for you

**How to use:**
1. Open the file
2. Fill in the placeholders: [description], [language], requirements
3. Copy the entire filled template
4. Paste into Claude, ChatGPT, or any AI tool

---

#### `debug-code.md`
**Location:** `000 OS/AI/commands/coding/`  
**Purpose:** Template for debugging code

**Use when:** You have buggy code that needs fixing

**How to use:**
1. Open the file
2. Paste your code in the code block
3. Describe the issue and expected behavior
4. Copy and paste into AI

---

#### `refactor-code.md`
**Location:** `000 OS/AI/commands/coding/`  
**Purpose:** Template for improving existing code

**Use when:** Code works but needs to be cleaner/faster

**How to use:**
1. Open the file
2. Paste your code
3. Check which goals you want (readability, performance, etc.)
4. Send to AI

---

#### `explain-code.md`
**Location:** `000 OS/AI/commands/coding/`  
**Purpose:** Template for understanding code

**Use when:** You need to understand complex code

**How to use:**
1. Open the file
2. Paste the code you don't understand
3. Ask AI for explanation

---

## 🚀 Quick Start Checklist

- [ ] Install Bun from https://bun.sh
- [ ] Edit `project-config.json` with your actual project paths
- [ ] Double-click `RUN-sync-projects.bat` to test
- [ ] Check `300 Entities/Projects/Coding/` for created notes
- [ ] Check `_synced/` folders for copied files
- [ ] Open Obsidian and navigate to your projects
- [ ] Try `RUN-generate-summaries.bat`
- [ ] Try `RUN-setup-week.bat` for weekly notes

---

## 📂 Where Files Go

### In Your Vault:
```
D:\LifeOS\
├── 000 OS\AI\
│   ├── commands\coding\
│   │   ├── generate-code.md        ← Prompt templates
│   │   ├── debug-code.md
│   │   ├── refactor-code.md
│   │   └── explain-code.md
│   └── scripts\
│       ├── project-config.json     ← EDIT THIS FIRST!
│       ├── sync-projects.ts        ← Script files
│       ├── generate-coding-summaries.ts
│       ├── setup-week.ts
│       ├── RUN-sync-projects.bat   ← Double-click these
│       ├── RUN-generate-summaries.bat
│       └── RUN-setup-week.bat
│
├── 100 Periodics\
│   ├── Daily\                      ← Daily notes go here
│   └── Weekly\                     ← Weekly notes go here
│
├── 200 Notes\
│   └── Coding Project Summaries.md ← Auto-generated overview
│
└── 300 Entities\Projects\Coding\
    ├── MyApp.md                    ← Project notes
    ├── DataPipeline.md
    └── _synced\                    ← External files copied here
        ├── MyApp\
        │   ├── README.md
        │   └── PRD.md
        └── DataPipeline\
            └── README.md
```

---

## 🔄 Typical Workflow

1. **Initial Setup** (one time)
   - Edit `project-config.json`
   - Run `RUN-sync-projects.bat`

2. **Weekly** (every Monday)
   - Run `RUN-setup-week.bat`
   - Fill in weekly goals
   - Work through daily notes

3. **When Starting Work** (daily)
   - Open today's daily note
   - Fill in Top 3 priorities
   - Track work in Inbox section

4. **When You Update External Docs**
   - Run `RUN-sync-projects.bat`
   - Latest versions pulled into vault

5. **Monthly Review**
   - Run `RUN-generate-summaries.bat`
   - Review project overview
   - Update project statuses

---

## 🐛 Common Issues

### "Bun is not recognized"
→ Install Bun from https://bun.sh and restart terminal

### "Config file not found"
→ Make sure `project-config.json` is in the same folder as the scripts

### "Source path does not exist"
→ Check your paths in `project-config.json` use `\\` not `\`

### Files not syncing
→ Make sure the files (README.md, etc.) actually exist in your project folders

### Batch file does nothing when double-clicked
→ Right-click → Edit to see any error messages

---

## 💡 Pro Tips

1. **Keep project-config.json updated** - Add new projects as you start them

2. **Sync regularly** - Run `RUN-sync-projects.bat` weekly or when you update docs

3. **Use the command templates** - Copy them to your daily notes when doing coding work

4. **Customize freely** - All these scripts are yours to modify!

5. **Version control** - Consider backing up your vault to Git

---

## 🎯 What Each File Is For (Summary)

| File | Type | Purpose |
|------|------|---------|
| `project-config.json` | Config | Define where your projects are |
| `sync-projects.ts` | Script | Copy external files into vault |
| `generate-coding-summaries.ts` | Script | Create project overview |
| `setup-week.ts` | Script | Generate weekly/daily notes |
| `RUN-*.bat` | Launcher | Easy way to run scripts |
| `generate-code.md` | Template | AI code generation prompt |
| `debug-code.md` | Template | AI debugging prompt |
| `refactor-code.md` | Template | AI refactoring prompt |
| `explain-code.md` | Template | AI explanation prompt |

---

**Need help?** Check SETUP-GUIDE.md for detailed instructions!
