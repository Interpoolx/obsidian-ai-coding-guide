// sync-projects.ts - Sync external project files into Obsidian vault
import { existsSync, mkdirSync, readFileSync, writeFileSync, copyFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const VAULT = join(__dirname, "../../../");
const configPath = join(__dirname, "project-config.json");

interface ProjectConfig {
  name: string;
  path: string;
  files_to_sync: string[];
  language: string;
  status: string;
  description?: string;
}

interface Config {
  projects: ProjectConfig[];
}

// Colors for console output
const colors = {
  reset: "\x1b[0m",
  green: "\x1b[32m",
  red: "\x1b[31m",
  yellow: "\x1b[33m",
  blue: "\x1b[34m",
  cyan: "\x1b[36m"
};

function log(message: string, color: keyof typeof colors = "reset") {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

// Check if config exists
if (!existsSync(configPath)) {
  log("❌ Config file not found at: " + configPath, "red");
  log("\nPlease create project-config.json with your project paths!", "yellow");
  process.exit(1);
}

// Load configuration
const config: Config = JSON.parse(readFileSync(configPath, "utf-8"));

log("\n" + "=".repeat(60), "cyan");
log("🔄 SYNCING PROJECTS INTO VAULT", "cyan");
log("=".repeat(60), "cyan");
log(`\nFound ${config.projects.length} projects in config\n`, "blue");

let successCount = 0;
let errorCount = 0;

for (const project of config.projects) {
  log(`\n📦 Processing: ${project.name}`, "blue");
  log(`   Path: ${project.path}`);
  log(`   Status: ${project.status}`);
  
  // Check if source path exists
  if (!existsSync(project.path)) {
    log(`   ⚠️  Source path does not exist! Skipping...`, "yellow");
    errorCount++;
    continue;
  }
  
  // Create project folder in _synced
  const syncedDir = join(VAULT, "300 Entities/Projects/Coding/_synced", project.name);
  mkdirSync(syncedDir, { recursive: true });
  
  // Create/update project note
  const projectNotePath = join(VAULT, "300 Entities/Projects/Coding", `${project.name}.md`);
  
  if (!existsSync(projectNotePath)) {
    const externalFilesLinks = project.files_to_sync
      .map(f => `- [[300 Entities/Projects/Coding/_synced/${project.name}/${f.replace('.md', '')}|${f}]]`)
      .join('\n');
    
    const projectNote = `---
type: coding-project
name: ${project.name}
status: ${project.status}
language: ${project.language}
repo: 
external_path: ${project.path}
---
# ${project.name}

## Summary
${project.description || '(Auto-synced from external project)'}

**Location:** \`${project.path}\`

## Requirements


## Architecture


## External Files
${externalFilesLinks}

## Tasks
- [ ] 

## AI Logs
- [[210 AI Log/]]

## Notes

`;
    writeFileSync(projectNotePath, projectNote);
    log(`   ✓ Created project note: ${project.name}.md`, "green");
  } else {
    log(`   ℹ️  Project note already exists (not overwriting)`);
  }
  
  // Sync files
  let fileSyncCount = 0;
  for (const file of project.files_to_sync) {
    const sourcePath = join(project.path, file);
    const destPath = join(syncedDir, file);
    
    if (existsSync(sourcePath)) {
      try {
        copyFileSync(sourcePath, destPath);
        log(`   ✓ Synced: ${file}`, "green");
        fileSyncCount++;
      } catch (err) {
        log(`   ✗ Error copying ${file}: ${err}`, "red");
        errorCount++;
      }
    } else {
      log(`   ⚠️  File not found: ${file}`, "yellow");
    }
  }
  
  if (fileSyncCount > 0) {
    successCount++;
  }
}

log("\n" + "=".repeat(60), "cyan");
log(`✅ Sync Complete!`, "green");
log(`   Projects processed: ${config.projects.length}`);
log(`   Successfully synced: ${successCount}`, "green");
if (errorCount > 0) {
  log(`   Errors/warnings: ${errorCount}`, "yellow");
}
log("=".repeat(60) + "\n", "cyan");

log("📁 Files synced to: 300 Entities/Projects/Coding/_synced/", "blue");
log("📝 Project notes at: 300 Entities/Projects/Coding/\n");
