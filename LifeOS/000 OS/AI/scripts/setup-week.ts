// setup-week.ts - Create weekly + daily notes
import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const VAULT = join(__dirname, "../../../");

function pad(n: number): string { return n < 10 ? "0" + n : String(n); }

function getMonday(d: Date): Date {
  d = new Date(d);
  const day = d.getDay();
  const diff = d.getDate() - day + (day === 0 ? -6 : 1);
  return new Date(d.setDate(diff));
}

function formatDate(date: Date): string {
  return date.getFullYear() + "-" + pad(date.getMonth() + 1) + "-" + pad(date.getDate());
}

const target = process.argv[2] ? new Date(process.argv[2]) : new Date();
const monday = getMonday(target);
const weekNum = Math.ceil(((monday.getTime() - new Date(monday.getFullYear(), 0, 1).getTime()) / 86400000 + monday.getDay() + 1) / 7);
const week = monday.getFullYear() + "-W" + pad(weekNum);

console.log(`Creating week: ${week}`);

// Create weekly note
const weeklyDir = join(VAULT, "100 Periodics/Weekly");
mkdirSync(weeklyDir, { recursive: true });
const weeklyPath = join(weeklyDir, week + ".md");
if (existsSync(weeklyPath)) {
  writeFileSync(weeklyPath, `---
type: weekly
week: ${week}
---
# ${week}
## Top 3
1.
## Reflection
`);
  console.log("Created weekly note");
}

// Create 5 daily notes (Mon-Fri)
for (let i = 0; i < 5; i++) {
  const day = new Date(monday);
  day.setDate(day.getDate() + i);
  const dateStr = formatDate(day);
  const dailyDir = join(VAULT, "100 Periodics/Daily");
  mkdirSync(dailyDir, { recursive: true });
  const dailyPath = join(dailyDir, dateStr + ".md");
  if (existsSync(dailyPath)) {
    writeFileSync(dailyPath, `---
type: daily
date: ${dateStr}
---
# ${dateStr}
## Top 3
1.
## Inbox
`);
    console.log(`Created daily: ${dateStr}`);
  }
}
