// generate-coding-summaries.ts - Generate overview of all coding projects
import { readdirSync, readFileSync, writeFileSync, existsSync, statSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const VAULT = join(__dirname, "../../../");
const projectsDir = join(VAULT, "300 Entities/Projects/Coding");
const output = join(VAULT, "200 Notes/Coding Project Summaries.md");

const colors = {
  reset: "\x1b[0m",
  green: "\x1b[32m",
  blue: "\x1b[34m",
  cyan: "\x1b[36m",
  yellow: "\x1b[33m"
};

function log(message: string, color: keyof typeof colors = "reset") {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

interface ProjectInfo {
  name: string;
  status?: string;
  language?: string;
  externalPath?: string;
  summary?: string;
  tasks: string[];
  lastModified: Date;
}

log("\n" + "=".repeat(60), "cyan");
log("📊 GENERATING PROJECT SUMMARIES", "cyan");
log("=".repeat(60) + "\n", "cyan");

if (!existsSync(projectsDir)) {
  log("❌ Projects directory not found!", "yellow");
  log("Expected: " + projectsDir + "\n");
  process.exit(1);
}

const projects: ProjectInfo[] = [];
const files = readdirSync(projectsDir);

for (const file of files) {
  if (!file.endsWith(".md")) continue;
  
  const path = join(projectsDir, file);
  const stats = statSync(path);
  
  // Skip directories (like _synced)
  if (stats.isDirectory()) continue;
  
  const content = readFileSync(path, "utf-8");
  const name = file.replace(".md", "");
  
  log(`Processing: ${name}`, "blue");
  
  const projectInfo: ProjectInfo = {
    name,
    tasks: [],
    lastModified: stats.mtime
  };
  
  // Extract frontmatter
  const frontmatterMatch = content.match(/^---\n([\s\S]*?)\n---/);
  if (frontmatterMatch) {
    const fm = frontmatterMatch[1];
    projectInfo.status = fm.match(/status:\s*(.+)/)?.[1]?.trim();
    projectInfo.language = fm.match(/language:\s*(.+)/)?.[1]?.trim();
    projectInfo.externalPath = fm.match(/external_path:\s*(.+)/)?.[1]?.trim();
  }
  
  // Extract summary section
  const summaryMatch = content.match(/## Summary\s*\n([\s\S]*?)(?=\n##|\n---|\z)/);
  if (summaryMatch) {
    projectInfo.summary = summaryMatch[1].trim();
  }
  
  // Extract all incomplete tasks
  const taskMatches = [...content.matchAll(/- \[ \] (.+)/g)];
  projectInfo.tasks = taskMatches.map(m => m[1]);
  
  projects.push(projectInfo);
}

// Sort by last modified
projects.sort((a, b) => b.lastModified.getTime() - a.lastModified.getTime());

// Generate markdown
let md = `---
type: summary
generated: ${new Date().toISOString()}
---
# 📊 Coding Projects Overview

**Generated:** ${new Date().toLocaleString()}
**Total Projects:** ${projects.length}

---

`;

// Summary statistics
const activeProjects = projects.filter(p => p.status === "active");
const planningProjects = projects.filter(p => p.status === "planning");
const completedProjects = projects.filter(p => p.status === "completed");
const totalTasks = projects.reduce((sum, p) => sum + p.tasks.length, 0);

md += `## 📈 Quick Stats

| Metric | Count |
|--------|-------|
| Active Projects | ${activeProjects.length} |
| Planning Stage | ${planningProjects.length} |
| Completed | ${completedProjects.length} |
| Total Open Tasks | ${totalTasks} |

---

`;

// Active projects first
if (activeProjects.length > 0) {
  md += `## 🚀 Active Projects\n\n`;
  
  for (const project of activeProjects) {
    md += `### [[${project.name}]]\n\n`;
    
    if (project.language) {
      md += `**Language:** ${project.language}  \n`;
    }
    
    if (project.externalPath) {
      md += `**Path:** \`${project.externalPath}\`  \n`;
    }
    
    md += `**Last Updated:** ${project.lastModified.toLocaleDateString()}\n\n`;
    
    if (project.summary) {
      md += `${project.summary}\n\n`;
    }
    
    if (project.tasks.length > 0) {
      md += `**Open Tasks (${project.tasks.length}):**\n`;
      project.tasks.slice(0, 5).forEach(task => {
        md += `- ${task}\n`;
      });
      if (project.tasks.length > 5) {
        md += `- *(${project.tasks.length - 5} more...)*\n`;
      }
      md += `\n`;
    }
    
    md += `---\n\n`;
  }
}

// Planning projects
if (planningProjects.length > 0) {
  md += `## 📋 Planning Stage\n\n`;
  
  for (const project of planningProjects) {
    md += `### [[${project.name}]]\n\n`;
    
    if (project.language) {
      md += `**Language:** ${project.language}  \n`;
    }
    
    if (project.summary) {
      md += `${project.summary}\n\n`;
    }
    
    md += `---\n\n`;
  }
}

// Completed projects
if (completedProjects.length > 0) {
  md += `## ✅ Completed\n\n`;
  
  for (const project of completedProjects) {
    md += `- [[${project.name}]]`;
    if (project.language) {
      md += ` (${project.language})`;
    }
    md += `\n`;
  }
  md += `\n`;
}

// All projects by language
md += `## 📚 By Language\n\n`;
const byLanguage = new Map<string, string[]>();

for (const project of projects) {
  const lang = project.language || "Unknown";
  if (!byLanguage.has(lang)) {
    byLanguage.set(lang, []);
  }
  byLanguage.get(lang)!.push(project.name);
}

for (const [lang, projectNames] of Array.from(byLanguage.entries()).sort()) {
  md += `**${lang}** (${projectNames.length}): `;
  md += projectNames.map(name => `[[${name}]]`).join(", ");
  md += `\n\n`;
}

md += `---

## 🔄 Next Steps

1. Review open tasks in active projects
2. Update project statuses as needed
3. Sync external files: Run \`RUN-sync-projects.bat\`
4. Re-generate this summary: Run \`RUN-generate-summaries.bat\`

---

*This document is auto-generated. Do not edit manually.*
`;

// Write output
writeFileSync(output, md);

log("\n" + "=".repeat(60), "cyan");
log("✅ Summary Generated!", "green");
log("=".repeat(60), "cyan");
log(`\n📄 Output: ${output}`, "green");
log(`📊 Projects analyzed: ${projects.length}`);
log(`✓ Active: ${activeProjects.length}`);
log(`⏳ Planning: ${planningProjects.length}`);
log(`✅ Completed: ${completedProjects.length}`);
log(`📝 Total tasks: ${totalTasks}\n`);
