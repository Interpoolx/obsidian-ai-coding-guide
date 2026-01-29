# 📁 File Placement Guide

## Where to Put Each Downloaded File

After downloading all the files, here's EXACTLY where each one goes:

---

## 🎯 Step-by-Step Placement

### 1️⃣ First: Run the Vault Setup
```
setup-lifeos-vault.bat
```
**Action:** Double-click this first to create the vault structure  
**Result:** Creates D:\LifeOS with all folders

---

### 2️⃣ Then: Place Scripts & Config

Move these to: `D:\LifeOS\000 OS\AI\scripts\`

```
✓ project-config.json              ← CONFIG FILE (edit this!)
✓ sync-projects.ts                 ← SCRIPT
✓ generate-coding-summaries.ts     ← SCRIPT
✓ setup-week.ts                    ← SCRIPT
✓ RUN-sync-projects.bat            ← LAUNCHER
✓ RUN-generate-summaries.bat       ← LAUNCHER
✓ RUN-setup-week.bat               ← LAUNCHER
```

**Visual:**
```
D:\LifeOS\
└── 000 OS\
    └── AI\
        └── scripts\          ← PUT THESE 7 FILES HERE
            ├── project-config.json
            ├── sync-projects.ts
            ├── generate-coding-summaries.ts
            ├── setup-week.ts
            ├── RUN-sync-projects.bat
            ├── RUN-generate-summaries.bat
            └── RUN-setup-week.bat
```

---

### 3️⃣ Place Command Templates

Move these to: `D:\LifeOS\000 OS\AI\commands\coding\`

```
✓ generate-code.md      ← PROMPT TEMPLATE
✓ debug-code.md         ← PROMPT TEMPLATE
✓ refactor-code.md      ← PROMPT TEMPLATE
✓ explain-code.md       ← PROMPT TEMPLATE
```

**Visual:**
```
D:\LifeOS\
└── 000 OS\
    └── AI\
        └── commands\
            └── coding\          ← PUT THESE 4 FILES HERE
                ├── generate-code.md
                ├── debug-code.md
                ├── refactor-code.md
                └── explain-code.md
```

---

### 4️⃣ Documentation (Optional - Keep for Reference)

These are just for reading - keep them anywhere you like:

```
✓ SETUP-GUIDE.md          ← Comprehensive setup instructions
✓ QUICK-REFERENCE.md      ← Quick lookup guide
✓ FILE-INDEX.md           ← Detailed file descriptions
✓ workflow-diagram.mermaid ← Visual workflow (view in Obsidian)
```

**Suggestion:** Put them in `D:\LifeOS\000 OS\AI\` for easy reference

---

## 📦 Complete Final Structure

After placing everything:

```
D:\LifeOS\
├── 📊 Dashboard.md
├── 📁 Coding Projects.md
├── 🌟 North Star.md
├── 🔗 Quick Links.md
│
├── 000 OS\
│   └── AI\
│       ├── commands\
│       │   └── coding\
│       │       ├── generate-code.md       ✓
│       │       ├── debug-code.md          ✓
│       │       ├── refactor-code.md       ✓
│       │       └── explain-code.md        ✓
│       ├── scripts\
│       │   ├── project-config.json        ✓ EDIT THIS!
│       │   ├── sync-projects.ts           ✓
│       │   ├── generate-coding-summaries.ts ✓
│       │   ├── setup-week.ts              ✓
│       │   ├── RUN-sync-projects.bat      ✓
│       │   ├── RUN-generate-summaries.bat ✓
│       │   └── RUN-setup-week.bat         ✓
│       └── (optional docs here)
│
├── 100 Periodics\
│   ├── Daily\
│   ├── Weekly\
│   ├── Monthly\
│   └── Quarterly\
│
├── 200 Notes\
│
├── 210 AI Log\
│
├── 300 Entities\
│   └── Projects\
│       └── Coding\
│           └── _synced\
│
└── 400 Resources\
    └── Prompt Library\
```

---

## ✅ Verification Checklist

After placing files, verify:

- [ ] Can you see `project-config.json` in `000 OS/AI/scripts/`?
- [ ] Can you double-click `RUN-sync-projects.bat` (should show "config file" message)?
- [ ] Can you see the 4 command templates in `commands/coding/`?
- [ ] Have you edited `project-config.json` with your paths?

---

## 🚀 Quick Test

1. **Open File Explorer** → Navigate to `D:\LifeOS\000 OS\AI\scripts\`

2. **Double-click:** `RUN-sync-projects.bat`

3. **You should see:**
   ```
   =============================================
    Syncing External Projects into Vault
   =============================================
   
   Running sync-projects.ts...
   ```

4. **If you get an error about Bun:**
   - Install from https://bun.sh
   - Restart Command Prompt
   - Try again

5. **If you get "Config file not found":**
   - Files are in wrong location
   - Re-check paths above

---

## 🎨 Visual Directory Tree

```
Your Downloads Folder:
├── setup-lifeos-vault.bat              → Run first (creates vault)
├── project-config.json                 → Goes to scripts/
├── sync-projects.ts                    → Goes to scripts/
├── generate-coding-summaries.ts        → Goes to scripts/
├── setup-week.ts                       → Goes to scripts/
├── RUN-sync-projects.bat               → Goes to scripts/
├── RUN-generate-summaries.bat          → Goes to scripts/
├── RUN-setup-week.bat                  → Goes to scripts/
├── generate-code.md                    → Goes to commands/coding/
├── debug-code.md                       → Goes to commands/coding/
├── refactor-code.md                    → Goes to commands/coding/
├── explain-code.md                     → Goes to commands/coding/
└── (documentation files)               → Keep for reference

        ↓ ↓ ↓ MOVE TO ↓ ↓ ↓

D:\LifeOS\000 OS\AI\
├── scripts\
│   ├── project-config.json
│   ├── *.ts files
│   └── RUN-*.bat files
└── commands\
    └── coding\
        └── *.md prompt templates
```

---

## 💡 Pro Tips

1. **Create a shortcut** to `000 OS/AI/scripts/` on your desktop for quick access

2. **Pin the scripts folder** to Quick Access in File Explorer

3. **Make a bookmark** in your browser to this guide for easy reference

4. **Test each .bat file** one by one to verify they work

5. **Keep backups** of your edited `project-config.json`

---

## 🔧 What If I Put Files in Wrong Place?

**No problem!** Just:
1. Move them to the correct location shown above
2. Try running the .bat files again
3. They'll work once in the right place

---

**Need Help?** See SETUP-GUIDE.md for troubleshooting
