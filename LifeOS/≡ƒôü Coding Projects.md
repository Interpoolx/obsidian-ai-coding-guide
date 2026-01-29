---
type: coding-hub
---
# 📁 Coding Projects Hub

## Active Projects
```dataview
TABLE status, language, file.mtime as "Last Updated"
FROM "300 Entities/Projects/Coding"
WHERE status = "active"
SORT file.mtime DESC
```

## All Projects
```dataview
TABLE status, language, file.mtime as "Last Updated"
FROM "300 Entities/Projects/Coding"
SORT file.mtime DESC
```

## Quick Actions
- [[Run Project Sync]] - Sync all external project files
- [[Generate Summaries]] - Create coding summaries

## External Project Folders
See: [[000 OS/AI/scripts/project-config.json]] to configure paths
