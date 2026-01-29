// setup-week.ts - Create weekly note + 5 daily notes (Mon-Fri)
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const VAULT = join(__dirname, "../../../");

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

function pad(n: number): string {
  return n < 10 ? "0" + n : String(n);
}

function getMonday(d: Date): Date {
  const day = d.getDay();
  const diff = d.getDate() - day + (day === 0 ? -6 : 1);
  return new Date(d.setDate(diff));
}

function formatDate(date: Date): string {
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`;
}

function formatDateLong(date: Date): string {
  const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  const months = ['January', 'February', 'March', 'April', 'May', 'June', 
                  'July', 'August', 'September', 'October', 'November', 'December'];
  
  const dayName = days[date.getDay()];
  const monthName = months[date.getMonth()];
  const day = date.getDate();
  const year = date.getFullYear();
  
  return `${dayName}, ${monthName} ${day}, ${year}`;
}

function getWeekNumber(date: Date): number {
  const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
  const pastDaysOfYear = (date.getTime() - firstDayOfYear.getTime()) / 86400000;
  return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
}

// Parse command line argument for date (optional)
const target = process.argv[2] ? new Date(process.argv[2]) : new Date();
const monday = getMonday(new Date(target));
const weekNum = getWeekNumber(monday);
const week = `${monday.getFullYear()}-W${pad(weekNum)}`;

log("\n" + "=".repeat(60), "cyan");
log("📅 SETTING UP WEEK", "cyan");
log("=".repeat(60), "cyan");
log(`\nWeek: ${week}`, "blue");
log(`Monday: ${formatDate(monday)} (${formatDateLong(monday)})\n`, "blue");

// Create weekly note
const weeklyDir = join(VAULT, "100 Periodics/Weekly");
mkdirSync(weeklyDir, { recursive: true });
const weeklyPath = join(weeklyDir, `${week}.md`);

if (!existsSync(weeklyPath)) {
  const weeklyContent = `---
type: weekly
week: ${week}
---
# Week ${week}

<< [[${monday.getFullYear()}-W${pad(weekNum - 1)}|Previous Week]] | [[${monday.getFullYear()}-W${pad(weekNum + 1)}|Next Week]] >>

## Top 3 This Week
1. 
2. 
3. 

## Goals
- [ ] 
- [ ] 
- [ ] 

## Weekly Reflection
### What went well?


### What to improve?


### Key learnings


## Daily Notes
- [[${formatDate(monday)}|Monday ${monday.getDate()}]]
- [[${formatDate(new Date(monday.getTime() + 86400000))}|Tuesday ${new Date(monday.getTime() + 86400000).getDate()}]]
- [[${formatDate(new Date(monday.getTime() + 86400000 * 2))}|Wednesday ${new Date(monday.getTime() + 86400000 * 2).getDate()}]]
- [[${formatDate(new Date(monday.getTime() + 86400000 * 3))}|Thursday ${new Date(monday.getTime() + 86400000 * 3).getDate()}]]
- [[${formatDate(new Date(monday.getTime() + 86400000 * 4))}|Friday ${new Date(monday.getTime() + 86400000 * 4).getDate()}]]

## Notes

`;
  writeFileSync(weeklyPath, weeklyContent);
  log(`✅ Created weekly note: ${week}.md`, "green");
} else {
  log(`ℹ️  Weekly note already exists: ${week}.md`, "yellow");
}

// Create 5 daily notes (Mon-Fri)
log("\n📝 Creating daily notes...\n");

const dayNames = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

for (let i = 0; i < 5; i++) {
  const day = new Date(monday);
  day.setDate(day.getDate() + i);
  const dateStr = formatDate(day);
  const dateLong = formatDateLong(day);
  
  const dailyDir = join(VAULT, "100 Periodics/Daily");
  mkdirSync(dailyDir, { recursive: true });
  const dailyPath = join(dailyDir, `${dateStr}.md`);
  
  if (!existsSync(dailyPath)) {
    const prevDay = formatDate(new Date(day.getTime() - 86400000));
    const nextDay = formatDate(new Date(day.getTime() + 86400000));
    
    const dailyContent = `---
type: daily
date: ${dateStr}
---
# ${dateLong}

<< [[${prevDay}|Yesterday]] | [[${week}|Week]] | [[${nextDay}|Tomorrow]] >>

## Top 3 Today
1. 
2. 
3. 

## Schedule
- 09:00 - 
- 10:00 - 
- 14:00 - 

## Inbox / Captures


## Action Items
- [ ] 


## Decisions & Outcomes


## People Notes


## Blockers


## Daily Reflection
### What went well today?


### What could be better?


---
**Energy Level:** 
**Mood:** 
`;
    writeFileSync(dailyPath, dailyContent);
    log(`✅ ${dayNames[i]}: ${dateStr}`, "green");
  } else {
    log(`⏭️  ${dayNames[i]}: ${dateStr} (already exists)`, "yellow");
  }
}

log("\n" + "=".repeat(60), "cyan");
log("✅ Week Setup Complete!", "green");
log("=".repeat(60), "cyan");
log(`\n📁 Files created in:`);
log(`   Weekly: 100 Periodics/Weekly/`);
log(`   Daily:  100 Periodics/Daily/`);
log(`\n💡 Open Obsidian and navigate to ${week}.md to get started!\n`);
