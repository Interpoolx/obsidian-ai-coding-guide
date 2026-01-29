# 🚀 Quick Reference Card

## 📦 All Files Explained

### ⚙️ CONFIGURATION (Edit First!)
```
project-config.json
```
→ Lists your project paths, which files to sync, languages, etc.
→ **EDIT THIS FIRST** with your actual project paths!

---

### 🔧 SCRIPTS (The Brain)

```
sync-projects.ts
```
→ Copies README.md, PRD.md, etc. from your actual projects into vault
→ Creates project notes automatically
→ Run when: New project added, or external files updated

```
generate-coding-summaries.ts
```
→ Creates overview report of ALL projects
→ Shows status, tasks, last updated
→ Output: `200 Notes/Coding Project Summaries.md`

```
setup-week.ts
```
→ Creates 1 weekly note + 5 daily notes (Mon-Fri)
→ Run every Monday or when starting a new week

---

### 🖱️ LAUNCHERS (Double-Click These!)

```
RUN-sync-projects.bat          ← Sync external files
RUN-generate-summaries.bat     ← Create overview report  
RUN-setup-week.bat             ← Generate weekly notes
```

---

### 📝 COMMAND TEMPLATES (Copy & Fill)

```
generate-code.md    → Ask AI to write code
debug-code.md       → Ask AI to fix bugs
refactor-code.md    → Ask AI to improve code
explain-code.md     → Ask AI to explain code
```

---

## 🎯 Usage Matrix

| Want to... | Do this... |
|-----------|-----------|
| **Set up vault initially** | Run `setup-lifeos-vault.bat` |
| **Add your projects** | Edit `project-config.json` |
| **Pull in external docs** | Double-click `RUN-sync-projects.bat` |
| **See all projects at once** | Double-click `RUN-generate-summaries.bat` |
| **Start a new week** | Double-click `RUN-setup-week.bat` |
| **Generate code with AI** | Copy `generate-code.md` → fill in → paste to Claude/ChatGPT |
| **Fix buggy code** | Copy `debug-code.md` → add your code → send to AI |
| **Update a synced file** | Edit external file → run `RUN-sync-projects.bat` |

---

## 📍 Where Things Live

```
000 OS/AI/
  commands/coding/          ← Prompt templates
  scripts/                  ← All .ts, .bat, .json files

100 Periodics/
  Daily/                    ← Daily notes (auto-generated)
  Weekly/                   ← Weekly notes (auto-generated)

200 Notes/
  Coding Project Summaries.md  ← Overview report (auto-generated)

300 Entities/Projects/Coding/
  MyProject.md              ← Individual project notes
  _synced/                  ← External files copied here
    MyProject/
      README.md
      PRD.md
```

---

## ⚡ Daily Workflow

**Monday Morning:**
1. `RUN-setup-week.bat` → Creates week
2. Open weekly note → Set Top 3 goals
3. Open Monday note → Plan day

**During Week:**
1. Open today's note
2. Track work, decisions, blockers
3. Link to project notes as needed

**When Docs Update:**
1. `RUN-sync-projects.bat` → Pull latest

**Month End:**
1. `RUN-generate-summaries.bat` → Review all projects
2. Update statuses in project notes

---

## 🔗 File Relationships

```
project-config.json
    ↓ (read by)
sync-projects.ts
    ↓ (creates)
Project Notes (300 Entities/Projects/Coding/)
    ↓ (links to)
_synced/ folder (external files)
    ↓ (summarized by)
generate-coding-summaries.ts
    ↓ (creates)
Coding Project Summaries.md
```

---

## 📋 Installation Checklist

- [ ] Download all files
- [ ] Run `setup-lifeos-vault.bat` (creates vault structure)
- [ ] Install Bun from https://bun.sh
- [ ] Copy all scripts to `D:\LifeOS\000 OS\AI\scripts\`
- [ ] Copy all command templates to `D:\LifeOS\000 OS\AI\commands\coding\`
- [ ] Edit `project-config.json` with YOUR paths
- [ ] Test: Double-click `RUN-sync-projects.bat`
- [ ] Verify files appear in `_synced/` folders
- [ ] Open Obsidian → Browse your projects!

---

## 🎓 Key Concepts

**Project Note** = Your vault's tracking file for a project
- Located: `300 Entities/Projects/Coding/MyProject.md`
- Contains: Summary, tasks, links to external files

**Synced Files** = Copies of external files (README, PRD)
- Located: `300 Entities/Projects/Coding/_synced/MyProject/`
- Updated: When you run `RUN-sync-projects.bat`

**Summary Report** = Auto-generated overview of all projects
- Located: `200 Notes/Coding Project Summaries.md`
- Shows: All projects, grouped by status/language

---

## 🆘 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| "Bun not recognized" | Install from https://bun.sh |
| "Config not found" | Make sure `project-config.json` is in scripts folder |
| Nothing syncs | Check paths in config use `\\` not `\` |
| Files not found | Verify README.md etc. exist in your projects |
| Batch file crashes | Right-click → Edit to see error |

---

## 💾 Backup Strategy

**Important files to backup:**
1. `project-config.json` (your project registry)
2. All notes in `300 Entities/Projects/Coding/` (except `_synced/`)
3. Your daily/weekly notes in `100 Periodics/`

**Don't need to backup:**
- `_synced/` folder (copies of external files)
- Summary reports (auto-generated)

---

## 🎨 Customization Ideas

1. **Add more sync files:** Edit `files_to_sync` in config
2. **Track more metadata:** Add fields to config (team, priority, etc.)
3. **Auto-sync:** Create a Windows scheduled task
4. **Custom templates:** Modify the command .md files
5. **Daily automations:** Run `setup-week.ts` via Task Scheduler

---

**Version:** 2.0  
**Last Updated:** January 2025  

See **FILE-INDEX.md** for detailed file-by-file documentation  
See **SETUP-GUIDE.md** for comprehensive setup instructions
