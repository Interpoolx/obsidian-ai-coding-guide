# LifeOS Obsidian Setup Guide

This guide outlines the steps to set up your AI-native Obsidian vault.

## 1. Prerequisites
- **Obsidian**: Installed on your machine.
- **Bun** (Optional but recommended): For automation scripts. [Install Bun](https://bun.sh).
- **Plugins**: Enable the following core/community plugins:
  - Templates (Core)
  - Daily Notes (Core)
  - [Dataview](https://github.com/blacksmithgu/obsidian-dataview) (Community)

## 2. Automated Initialization
Run the included batch script to create the folder structure and initial files:
```bash
.\setup-lifeos-obsidian.bat
```

## 3. Folder Structure
The script will create the following structure:
- `000 OS/`: System files, Claude config, templates.
- `100 Periodics/`: Time-based notes (Daily, Weekly, Monthly, Quarterly).
- `199 Writing/`: Drafts and creative work.
- `200 Notes/`: Reference and permanent notes.
- `210 AI Log/`: Logs of AI sessions.
- `300 Entities/`: Areas, People, Projects, Goals, Teams, Events.
- `400 Resources/`: Books, web clips, podcasts, prompt library.
- `999 Review/`: Triage folder for unclassified notes.

## 4. Core Files
At the root of your vault, you should have:
- `🌟 North Star.md`: Your vision, values, and strategic bets.
- `📊 Dashboard.md`: Your daily tactical hub.
- `🔗 Quick Links.md`: Key documents and resources.

## 5. AI Integration
To use this with AI (like Claude Code):
- Keep your AI logs in `210 AI Log/`.
- Use the prompts stored in `400 Resources/Prompt Library/`.
- Use the automation scripts in `000 OS/Claude/scripts/`.

---
*Based on the guide by [Chase Adams](https://curiouslychase.com/posts/ai-native-obsidian-vault-setup-guide/).*
