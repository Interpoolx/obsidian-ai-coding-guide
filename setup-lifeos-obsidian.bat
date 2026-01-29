@echo off
setlocal enabledelayedexpansion

set "ROOT=%~dp0LifeOS"

echo =============================================
echo Setting up AI-Native Obsidian Vault at %ROOT%
echo =============================================
echo.

if exist "%ROOT%" (
    echo Warning: Folder %ROOT% already exists.
    echo Press any key to continue (will overwrite/add files^) or Ctrl+C to cancel...
    pause >nul
)

echo Creating root folder and structure...
mkdir "%ROOT%" 2>nul

:: Root files with emojis
echo Creating core dashboard files...
(
echo ---
echo type: north-star
echo ---
echo # 🌟 Life Vision ^& Purpose
echo My ultimate vision for life...
echo.
echo # Core Values
echo 1. ...
echo 2. ...
echo 3. ...
echo.
echo # Current Bets ^& Focus Areas
echo.
echo # Areas Dashboard
echo ^| Area ^| Status ^| Key Goal ^|
echo ^|------^|--------^|-----------^|
echo ^| [[Health]] ^| ^| ^|
echo ^| [[Wealth]] ^| ^| ^|
echo ^| [[Relationships]] ^| ^| ^|
echo.
echo # Risk Register
echo ^| Risk ^| Likelihood ^| Impact ^| Mitigation ^|
) > "%ROOT%\🌟 North Star.md"

(
echo ---
echo type: dashboard
echo ---
echo [[🌟 North Star]] ^|^| [[🔗 Quick Links]] ^|^| [[📁 Coding Projects]]
echo.
echo # Teams ^& People
echo.
echo # Upcoming Events
echo ```dataview
echo LIST
echo FROM "300 Entities/Events"
echo WHERE date ^>= date^(today^)
echo SORT date ASC
echo LIMIT 5
echo ```
echo.
echo # Open Actions
echo ```dataview
echo TASK
echo WHERE !completed
echo SORT priority DESC, due ASC
echo LIMIT 20
echo ```
echo.
echo # Active Projects
echo ```dataview
echo LIST
echo FROM "300 Entities/Projects"
echo WHERE status = "active"
echo ```
) > "%ROOT%\📊 Dashboard.md"

(
echo ---
echo type: quick-links
echo ---
echo # 🔗 Quick Links
echo.
echo ## Work
echo - [[Company Dashboard]]
echo.
echo ## Personal
echo - Bank accounts, etc.
) > "%ROOT%\🔗 Quick Links.md"

(
echo ---
echo type: coding-hub
echo ---
echo # 📁 Coding Projects Hub
echo.
echo ## Active Projects
echo ```dataview
echo TABLE status, language, file.mtime as "Last Updated"
echo FROM "300 Entities/Projects/Coding"
echo WHERE status = "active"
echo SORT file.mtime DESC
echo ```
echo.
echo ## All Projects
echo ```dataview
echo TABLE status, language, file.mtime as "Last Updated"
echo FROM "300 Entities/Projects/Coding"
echo SORT file.mtime DESC
echo ```
echo.
echo ## Quick Actions
echo - [[Run Project Sync]] - Sync all external project files
echo - [[Generate Summaries]] - Create coding summaries
echo.
echo ## External Project Folders
echo See: [[000 OS/AI/scripts/project-config.json]] to configure paths
) > "%ROOT%\📁 Coding Projects.md"

:: Main folders
mkdir "%ROOT%\000 OS\AI\commands\coding" 2>nul
mkdir "%ROOT%\000 OS\AI\scripts" 2>nul
mkdir "%ROOT%\000 OS\AI\prompts" 2>nul
mkdir "%ROOT%\000 OS\Templates" 2>nul

:: Periodic notes
mkdir "%ROOT%\100 Periodics\Daily" 2>nul
mkdir "%ROOT%\100 Periodics\Weekly" 2>nul
mkdir "%ROOT%\100 Periodics\Monthly" 2>nul
mkdir "%ROOT%\100 Periodics\Quarterly" 2>nul

mkdir "%ROOT%\199 Writing" 2>nul
mkdir "%ROOT%\200 Notes" 2>nul
mkdir "%ROOT%\210 AI Log" 2>nul

:: Entities
mkdir "%ROOT%\300 Entities\Areas" 2>nul
mkdir "%ROOT%\300 Entities\Companies" 2>nul
mkdir "%ROOT%\300 Entities\Events" 2>nul
mkdir "%ROOT%\300 Entities\Goals" 2>nul
mkdir "%ROOT%\300 Entities\Meetings" 2>nul
mkdir "%ROOT%\300 Entities\People" 2>nul
mkdir "%ROOT%\300 Entities\Projects" 2>nul
mkdir "%ROOT%\300 Entities\Projects\Coding" 2>nul
mkdir "%ROOT%\300 Entities\Projects\Coding\_synced" 2>nul
mkdir "%ROOT%\300 Entities\Software" 2>nul
mkdir "%ROOT%\300 Entities\Teams" 2>nul

:: Resources
mkdir "%ROOT%\400 Resources\Blog Posts" 2>nul
mkdir "%ROOT%\400 Resources\Books" 2>nul
mkdir "%ROOT%\400 Resources\Courses" 2>nul
mkdir "%ROOT%\400 Resources\Highlights" 2>nul
mkdir "%ROOT%\400 Resources\Media" 2>nul
mkdir "%ROOT%\400 Resources\Podcasts" 2>nul
mkdir "%ROOT%\400 Resources\Prompt Library\Commands" 2>nul
mkdir "%ROOT%\400 Resources\Prompt Library\Skills" 2>nul
mkdir "%ROOT%\400 Resources\Roundups" 2>nul
mkdir "%ROOT%\400 Resources\Videos" 2>nul
mkdir "%ROOT%\400 Resources\Web" 2>nul

:: Review / Inbox
mkdir "%ROOT%\999 Review\People (tag-based)" 2>nul
mkdir "%ROOT%\999 Review\Places" 2>nul
mkdir "%ROOT%\999 Review\Quotes" 2>nul
mkdir "%ROOT%\999 Review\Root Files" 2>nul
mkdir "%ROOT%\999 Review\Templates and Meta" 2>nul
mkdir "%ROOT%\999 Review\Unclassified Notes" 2>nul
mkdir "%ROOT%\999 Review\Unknown fileClass" 2>nul

echo Creating templates...

:: Daily template
(
echo ---
echo type: daily
echo date: {{date:YYYY-MM-DD}}
echo ---
echo # {{date:dddd, MMMM Do YYYY}}
echo ^<^< [[{{date:YYYY-MM-DD-1d}}^|Yesterday]] ^| [[{{date:gggg-[W]ww}}^|Week]] ^| [[{{date:YYYY-MM-DD+1d}}^|Tomorrow]] ^>^>
echo.
echo ## Top 3 Today
echo 1.
echo 2.
echo 3.
echo.
echo ## Inbox / Captures
echo.
echo ## Decisions ^& Outcomes
echo.
echo ## Action Items
echo - [ ]
echo.
echo ## People Notes
echo.
echo ## Blockers
) > "%ROOT%\000 OS\Templates\Daily.md"

:: Weekly template
(
echo ---
echo type: weekly
echo week: {{date:gggg-[W]ww}}
echo ---
echo # Week {{date:gggg-[W]ww}}
echo.
echo ## Top 3 This Week
echo 1.
echo 2.
echo 3.
echo.
echo ## Weekly Reflection
echo What went well?
echo What to improve?
echo.
echo ## Daily Notes
echo - [[{{date:YYYY-MM-DD}}^|Monday]]
echo - [[{{date:YYYY-MM-DD+1d}}^|Tuesday]]
echo ... ^(add more^)
) > "%ROOT%\000 OS\Templates\Weekly.md"

:: Monthly template
(
echo ---
echo type: monthly
echo month: {{date:YYYY-MM}}
echo ---
echo # {{date:MMMM YYYY}}
echo.
echo ## Objectives
echo 1.
echo 2.
echo.
echo ## Reflection
) > "%ROOT%\000 OS\Templates\Monthly.md"

:: Quarterly template
(
echo ---
echo type: quarterly
echo quarter: {{date:YYYY}}-Q{{quarter}}
echo ---
echo # Quarter {{date:YYYY}}-Q{{quarter}}
echo.
echo ## Goals
echo.
echo ## Review
) > "%ROOT%\000 OS\Templates\Quarterly.md"

:: Person template
(
echo ---
echo type: person
echo name: {{title}}
echo ---
echo # {{title}}
echo.
echo ## About
echo.
echo ## Action Items
echo ```dataview
echo TASK FROM [[]]
echo ```
) > "%ROOT%\000 OS\Templates\Person.md"

:: Team template
(
echo ---
echo type: team
echo name: {{title}}
echo ---
echo # {{title}}
echo.
echo ## Purpose
echo.
echo ## Members
) > "%ROOT%\000 OS\Templates\Team.md"

:: Coding project template
(
echo ---
echo type: coding-project
echo name: {{title}}
echo status: active
echo language: 
echo repo: 
echo external_path: 
echo ---
echo # {{title}}
echo.
echo ## Summary
echo.
echo ## Requirements
echo.
echo ## Architecture
echo.
echo ## Code Snippets
echo ```{{language}}
echo 
echo ```
echo.
echo ## Tasks
echo - [ ] 
echo.
echo ## AI Logs
echo - [[210 AI Log/{{date:YYYY-MM-DD}}-{{title}}]]
echo.
echo ## External Files
echo - [[300 Entities/Projects/Coding/_synced/{{title}}/README]]
echo - [[300 Entities/Projects/Coding/_synced/{{title}}/PRD]]
) > "%ROOT%\000 OS\Templates\Coding Project.md"

echo Creating AI scripts...

:: Project configuration
(
echo {
echo   "projects": [
echo     {
echo       "name": "MyApp",
echo       "path": "C:\\Users\\YourName\\projects\\myapp",
echo       "files_to_sync": ["README.md", "PRD.md", "ARCHITECTURE.md", "TODO.md"],
echo       "language": "JavaScript",
echo       "status": "active"
echo     },
echo     {
echo       "name": "DataPipeline",
echo       "path": "C:\\Users\\YourName\\projects\\data-pipeline",
echo       "files_to_sync": ["README.md", "SPEC.md"],
echo       "language": "Python",
echo       "status": "active"
echo     }
echo   ]
echo }
) > "%ROOT%\000 OS\AI\scripts\project-config.json"

:: setup-week.ts
(
echo // setup-week.ts - Create weekly + daily notes
echo import { existsSync, mkdirSync, writeFileSync } from "node:fs";
echo import { join, dirname } from "node:path";
echo import { fileURLToPath } from "node:url";
echo.
echo const __dirname = dirname^(fileURLToPath^(import.meta.url^)^);
echo const VAULT = join^(__dirname, "../../../"^);
echo.
echo function pad^(n: number^): string { return n ^< 10 ? "0" + n : String^(n^); }
echo.
echo function getMonday^(d: Date^): Date {
echo   d = new Date^(d^);
echo   const day = d.getDay^(^);
echo   const diff = d.getDate^(^) - day + ^(day === 0 ? -6 : 1^);
echo   return new Date^(d.setDate^(diff^)^);
echo }
echo.
echo function formatDate^(date: Date^): string {
echo   return date.getFullYear^(^) + "-" + pad^(date.getMonth^(^) + 1^) + "-" + pad^(date.getDate^(^)^);
echo }
echo.
echo const target = process.argv[2] ? new Date^(process.argv[2]^) : new Date^(^);
echo const monday = getMonday^(target^);
echo const weekNum = Math.ceil^(^(^(monday.getTime^(^) - new Date^(monday.getFullYear^(^), 0, 1^).getTime^(^)^) / 86400000 + monday.getDay^(^) + 1^) / 7^);
echo const week = monday.getFullYear^(^) + "-W" + pad^(weekNum^);
echo.
echo console.log^(`Creating week: ${week}`^);
echo.
echo // Create weekly note
echo const weeklyDir = join^(VAULT, "100 Periodics/Weekly"^);
echo mkdirSync^(weeklyDir, { recursive: true }^);
echo const weeklyPath = join^(weeklyDir, week + ".md"^);
echo if ^(!existsSync^(weeklyPath^)^) {
echo   writeFileSync^(weeklyPath, `---
echo type: weekly
echo week: ${week}
echo ---
echo # ${week}
echo ## Top 3
echo 1.
echo ## Reflection
echo `^);
echo   console.log^("Created weekly note"^);
echo }
echo.
echo // Create 5 daily notes ^(Mon-Fri^)
echo for ^(let i = 0; i ^< 5; i++^) {
echo   const day = new Date^(monday^);
echo   day.setDate^(day.getDate^(^) + i^);
echo   const dateStr = formatDate^(day^);
echo   const dailyDir = join^(VAULT, "100 Periodics/Daily"^);
echo   mkdirSync^(dailyDir, { recursive: true }^);
echo   const dailyPath = join^(dailyDir, dateStr + ".md"^);
echo   if ^(!existsSync^(dailyPath^)^) {
echo     writeFileSync^(dailyPath, `---
echo type: daily
echo date: ${dateStr}
echo ---
echo # ${dateStr}
echo ## Top 3
echo 1.
echo ## Inbox
echo `^);
echo     console.log^(`Created daily: ${dateStr}`^);
echo   }
echo }
) > "%ROOT%\000 OS\AI\scripts\setup-week.ts"

:: sync-projects.ts
(
echo // sync-projects.ts - Sync external project files into vault
echo import { existsSync, mkdirSync, readFileSync, writeFileSync, copyFileSync } from "node:fs";
echo import { join, dirname, basename } from "node:path";
echo import { fileURLToPath } from "node:url";
echo.
echo const __dirname = dirname^(fileURLToPath^(import.meta.url^)^);
echo const VAULT = join^(__dirname, "../../../"^);
echo const configPath = join^(__dirname, "project-config.json"^);
echo.
echo interface ProjectConfig {
echo   name: string;
echo   path: string;
echo   files_to_sync: string[];
echo   language: string;
echo   status: string;
echo }
echo.
echo interface Config {
echo   projects: ProjectConfig[];
echo }
echo.
echo if ^(!existsSync^(configPath^)^) {
echo   console.error^("Config file not found at:", configPath^);
echo   process.exit^(1^);
echo }
echo.
echo const config: Config = JSON.parse^(readFileSync^(configPath, "utf-8"^)^);
echo.
echo console.log^(`Syncing ${config.projects.length} projects...`^);
echo.
echo for ^(const project of config.projects^) {
echo   console.log^(`\nProcessing: ${project.name}`^);
echo   
echo   // Create project folder in _synced
echo   const syncedDir = join^(VAULT, "300 Entities/Projects/Coding/_synced", project.name^);
echo   mkdirSync^(syncedDir, { recursive: true }^);
echo   
echo   // Create/update project note
echo   const projectNotePath = join^(VAULT, "300 Entities/Projects/Coding", `${project.name}.md`^);
echo   if ^(!existsSync^(projectNotePath^)^) {
echo     const projectNote = `---
echo type: coding-project
echo name: ${project.name}
echo status: ${project.status}
echo language: ${project.language}
echo repo: 
echo external_path: ${project.path}
echo ---
echo # ${project.name}
echo.
echo ## Summary
echo ^(Auto-synced from: ${project.path}^)
echo.
echo ## External Files
echo ${project.files_to_sync.map^(f =^> `- [[300 Entities/Projects/Coding/_synced/${project.name}/${f.replace^('.md', ''^)}]]`^).join^('\n'^ )}
echo.
echo ## Tasks
echo - [ ] 
echo.
echo ## AI Logs
echo `;
echo     writeFileSync^(projectNotePath, projectNote^);
echo     console.log^(`  Created project note: ${project.name}.md`^);
echo   }
echo   
echo   // Sync files
echo   for ^(const file of project.files_to_sync^) {
echo     const sourcePath = join^(project.path, file^);
echo     const destPath = join^(syncedDir, file^);
echo     
echo     if ^(existsSync^(sourcePath^)^) {
echo       copyFileSync^(sourcePath, destPath^);
echo       console.log^(`  ✓ Synced: ${file}`^);
echo     } else {
echo       console.log^(`  ✗ Missing: ${file}`^);
echo     }
echo   }
echo }
echo.
echo console.log^("\n✓ Sync complete!"^);
) > "%ROOT%\000 OS\AI\scripts\sync-projects.ts"

:: generate-coding-summaries.ts
(
echo // generate-coding-summaries.ts - Generate overview of all coding projects
echo import { readdirSync, readFileSync, writeFileSync, existsSync, statSync } from "node:fs";
echo import { join, dirname } from "node:path";
echo import { fileURLToPath } from "node:url";
echo.
echo const __dirname = dirname^(fileURLToPath^(import.meta.url^)^);
echo const VAULT = join^(__dirname, "../../../"^);
echo const projectsDir = join^(VAULT, "300 Entities/Projects/Coding"^);
echo const output = join^(VAULT, "200 Notes/Coding Project Summaries.md"^);
echo.
echo const colors = {
echo   reset: "\x1b[0m",
echo   green: "\x1b[32m",
echo   blue: "\x1b[34m",
echo   cyan: "\x1b[36m",
echo   yellow: "\x1b[33m"
echo };
echo.
echo function log^(message: string, color: keyof typeof colors = "reset"^) {
echo   console.log^(`${colors[color]}${message}${colors.reset}`^);
echo }
echo.
echo interface ProjectInfo {
echo   name: string;
echo   status?: string;
echo   language?: string;
echo   externalPath?: string;
echo   summary?: string;
echo   tasks: string[];
echo   lastModified: Date;
echo }
echo.
echo log^("\n" + "=".repeat^(60^), "cyan"^);
echo log^("📊 GENERATING PROJECT SUMMARIES", "cyan"^);
echo log^("=".repeat^(60^) + "\n", "cyan"^);
echo.
echo if ^(!existsSync^(projectsDir^)^) {
echo   log^("❌ Projects directory not found!", "yellow"^);
echo   log^("Expected: " + projectsDir + "\n"^);
echo   process.exit^(1^);
echo }
echo.
echo const projects: ProjectInfo[] = [];
echo const files = readdirSync^(projectsDir^);
echo.
echo for ^(const file of files^) {
echo   if ^(!file.endsWith^(".md"^)^) continue;
echo   
echo   const path = join^(projectsDir, file^);
echo   const stats = statSync^(path^);
echo   
echo   // Skip directories ^(like _synced^)
echo   if ^(stats.isDirectory^(^)^) continue;
echo   
echo   const content = readFileSync^(path, "utf-8"^);
echo   const name = file.replace^(".md", ""^);
echo   
echo   log^(`Processing: ${name}`, "blue"^);
echo   
echo   const projectInfo: ProjectInfo = {
echo     name,
echo     tasks: [],
echo     lastModified: stats.mtime
echo   };
echo   
echo   // Extract frontmatter
echo   const frontmatterMatch = content.match^(/^---\n^([\s\S]*?^)\n---/^);
echo   if ^(frontmatterMatch^) {
echo     const fm = frontmatterMatch[1];
echo     projectInfo.status = fm.match^(/status:\s*^(.+^)/^)?.[1]?.trim^(^);
echo     projectInfo.language = fm.match^(/language:\s*^(.+^)/^)?.[1]?.trim^(^);
echo     projectInfo.externalPath = fm.match^(/external_path:\s*^(.+^)/^)?.[1]?.trim^(^);
echo   }
echo   
echo   // Extract summary section
echo   const summaryMatch = content.match^(/## Summary\s*\n^([\s\S]*?^)^(?=\n##^|\n---^|\z^)/^);
echo   if ^(summaryMatch^) {
echo     projectInfo.summary = summaryMatch[1].trim^(^);
echo   }
echo   
echo   // Extract all incomplete tasks
echo   const taskMatches = [...content.matchAll^(/- \[ \] ^(.+^)/g^)];
echo   projectInfo.tasks = taskMatches.map^(m =^> m[1]^);
echo   
echo   projects.push^(projectInfo^);
echo }
echo.
echo // Sort by last modified
echo projects.sort^(^(a, b^) =^> b.lastModified.getTime^(^) - a.lastModified.getTime^(^)^);
echo.
echo // Generate markdown
echo let md = `---
echo type: summary
echo generated: ${new Date^(^).toISOString^(^)}
echo ---
echo # 📊 Coding Projects Overview
echo.
echo **Generated:** ${new Date^(^).toLocaleString^(^)}
echo **Total Projects:** ${projects.length}
echo.
echo ---
echo.
echo `;
echo.
echo // Summary statistics
echo const activeProjects = projects.filter^(p =^> p.status === "active"^);
echo const planningProjects = projects.filter^(p =^> p.status === "planning"^);
echo const completedProjects = projects.filter^(p =^> p.status === "completed"^);
echo const totalTasks = projects.reduce^(^(sum, p^) =^> sum + p.tasks.length, 0^);
echo.
echo md += `## 📈 Quick Stats
echo.
echo ^| Metric ^| Count ^|
echo ^|--------^|-------^|
echo ^| Active Projects ^| ${activeProjects.length} ^|
echo ^| Planning Stage ^| ${planningProjects.length} ^|
echo ^| Completed ^| ${completedProjects.length} ^|
echo ^| Total Open Tasks ^| ${totalTasks} ^|
echo.
echo ---
echo.
echo `;
echo.
echo // Active projects first
echo if ^(activeProjects.length ^> 0^) {
echo   md += `## 🚀 Active Projects\n\n`;
echo   
echo   for ^(const project of activeProjects^) {
echo     md += `### [[${project.name}]]\n\n`;
echo     
echo     if ^(project.language^) {
echo       md += `**Language:** ${project.language}  \n`;
echo     }
echo     
echo     if ^(project.externalPath^) {
echo       md += `**Path:** \`${project.externalPath}\`  \n`;
echo     }
echo     
echo     md += `**Last Updated:** ${project.lastModified.toLocaleDateString^(^)}\n\n`;
echo     
echo     if ^(project.summary^) {
echo       md += `${project.summary}\n\n`;
echo     }
echo     
echo     if ^(project.tasks.length ^> 0^) {
echo       md += `**Open Tasks ^(${project.tasks.length}^):**\n`;
echo       project.tasks.slice^(0, 5^).forEach^(task =^> {
echo         md += `- ${task}\n`;
echo       }^);
echo       if ^(project.tasks.length ^> 5^) {
echo         md += `- *^(${project.tasks.length - 5} more...^)*\n`;
echo       }
echo       md += `\n`;
echo     }
echo     
echo     md += "---\n\n";
echo   }
echo }
echo.
echo // Planning projects
echo if ^(planningProjects.length ^> 0^) {
echo   md += `## 📋 Planning Stage\n\n`;
echo   
echo   for ^(const project of planningProjects^) {
echo     md += `### [[${project.name}]]\n\n`;
echo     
echo     if ^(project.language^) {
echo       md += `**Language:** ${project.language}  \n`;
echo     }
echo     
echo     if ^(project.summary^) {
echo       md += `${project.summary}\n\n`;
echo     }
echo     
echo     md += "---\n\n";
echo   }
echo }
echo.
echo // Completed projects
echo if ^(completedProjects.length ^> 0^) {
echo   md += `## ✅ Completed\n\n`;
echo   
echo   for ^(const project of completedProjects^) {
echo     md += `- [[${project.name}]]`;
echo     if ^(project.language^) {
echo       md += ` ^(${project.language}^)`;
echo     }
echo     md += `\n`;
echo   }
echo   md += `\n`;
echo }
echo.
echo // All projects by language
echo md += `## 📚 By Language\n\n`;
echo const byLanguage = new Map^<string, string[]^>^(^);
echo.
echo for ^(const project of projects^) {
echo   const lang = project.language ^|^| "Unknown";
echo   if ^(!byLanguage.has^(lang^)^) {
echo     byLanguage.set^(lang, []^);
echo   }
echo   byLanguage.get^(lang^)! .push^(project.name^);
echo }
echo.
echo for ^(const [lang, projectNames] of Array.from^(byLanguage.entries^(^)^).sort^(^)^) {
echo   md += `**${lang}** ^(${projectNames.length}^): `;
echo   md += projectNames.map^(name =^> `[[${name}]]`^).join^(", "^);
echo   md += `\n\n`;
echo }
echo.
echo md += `---
echo.
echo ## 🔄 Next Steps
echo.
echo 1. Review open tasks in active projects
echo 2. Update project statuses as needed
echo 3. Sync external files: Run \`RUN-sync-projects.bat\`
echo 4. Re-generate this summary: Run \`RUN-generate-summaries.bat\`
echo.
echo ---
echo.
echo *This document is auto-generated. Do not edit manually.*
echo `;
echo.
echo // Write output
echo writeFileSync^(output, md^);
echo.
echo log^("\n" + "=".repeat^(60^), "cyan"^);
echo log^("✅ Summary Generated!", "green"^);
echo log^("=".repeat^(60^), "cyan"^);
echo log^(`\n📄 Output: ${output}`, "green"^);
echo log^(`📊 Projects analyzed: ${projects.length}`^);
echo log^(`✓ Active: ${activeProjects.length}`^);
echo log^(`⏳ Planning: ${planningProjects.length}`^);
echo log^(`✅ Completed: ${completedProjects.length}`^);
echo log^(`📝 Total tasks: ${totalTasks}\n`^);
) > "%ROOT%\000 OS\AI\scripts\generate-coding-summaries.ts"

:: Quick run scripts
(
echo @echo off
echo cd /d "%ROOT%\000 OS\AI\scripts"
echo bun run sync-projects.ts
echo pause
) > "%ROOT%\000 OS\AI\scripts\RUN-sync-projects.bat"

(
echo @echo off
echo cd /d "%ROOT%\000 OS\AI\scripts"
echo bun run generate-coding-summaries.ts
echo pause
) > "%ROOT%\000 OS\AI\scripts\RUN-generate-summaries.bat"

(
echo @echo off
echo cd /d "%ROOT%\000 OS\AI\scripts"
echo bun run setup-week.ts
echo pause
) > "%ROOT%\000 OS\AI\scripts\RUN-setup-week.bat"

echo Creating coding command templates...

(
echo # Generate Code
echo.
echo You are an expert coder. Generate clean, production-ready code for the following:
echo.
echo **Task:** [Describe what you want to build]
echo.
echo **Language:** [Specify language]
echo.
echo **Requirements:**
echo - [Requirement 1]
echo - [Requirement 2]
echo.
echo **Style Guidelines:**
echo - Include comments
echo - Use best practices
echo - Handle errors gracefully
) > "%ROOT%\000 OS\AI\commands\coding\generate-code.md"

(
echo # Debug Code
echo.
echo Analyze this code for bugs and suggest fixes:
echo.
echo ```[language]
echo [paste your code here]
echo ```
echo.
echo **Issue Description:**
echo [What's going wrong?]
echo.
echo **Expected Behavior:**
echo [What should happen?]
) > "%ROOT%\000 OS\AI\commands\coding\debug-code.md"

(
echo # Refactor Code
echo.
echo Refactor this code for better readability and performance:
echo.
echo ```[language]
echo [paste your code here]
echo ```
echo.
echo **Goals:**
echo - [ ] Improve readability
echo - [ ] Optimize performance
echo - [ ] Add documentation
echo - [ ] Follow best practices
) > "%ROOT%\000 OS\AI\commands\coding\refactor-code.md"

(
echo # Explain Code
echo.
echo Explain this code in detail:
echo.
echo ```[language]
echo [paste your code here]
echo ```
echo.
echo Please provide:
echo 1. High-level overview
echo 2. Line-by-line explanation
echo 3. Key concepts used
echo 4. Potential improvements
) > "%ROOT%\000 OS\AI\commands\coding\explain-code.md"

echo.
echo =============================================
echo ✓ Setup complete!
echo =============================================
echo.
echo Next steps:
echo.
echo 1. OPEN OBSIDIAN
echo    - Create new vault
echo    - Select %ROOT%
echo.
echo 2. INSTALL PLUGINS
echo    - Dataview
echo    - Periodic Notes
echo    - Calendar
echo    - QuickAdd
echo    - Templater ^(or use Core Templates^)
echo.
echo 3. CONFIGURE YOUR PROJECT PATHS
echo    - Edit: 000 OS\AI\scripts\project-config.json
echo    - Add your actual project paths
echo.
echo 4. SYNC YOUR PROJECTS
echo    - Double-click: 000 OS\AI\scripts\RUN-sync-projects.bat
echo    - This will copy README, PRD, etc. into vault
echo.
echo 5. GENERATE SUMMARIES
echo    - Double-click: 000 OS\AI\scripts\RUN-generate-summaries.bat
echo.
echo 6. SETUP WEEKLY NOTES
echo    - Double-click: 000 OS\AI\scripts\RUN-setup-week.bat
echo.
echo =============================================
echo FOLDER STRUCTURE CREATED:
echo.
echo 📊 Dashboard.md          - Your main hub
echo 📁 Coding Projects.md    - All projects overview
echo.
echo 000 OS/AI/
echo   scripts/
echo     project-config.json  - EDIT THIS with your paths
echo     sync-projects.ts     - Syncs external files
echo     RUN-*.bat           - Quick launchers
echo.
echo 300 Entities/Projects/Coding/
echo   [ProjectName].md       - Individual project notes
echo   _synced/               - External files copied here
echo     [ProjectName]/
echo       README.md
echo       PRD.md
echo.
echo =============================================
echo.
pause
endlocal