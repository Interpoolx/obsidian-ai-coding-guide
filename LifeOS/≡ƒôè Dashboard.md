---
type: dashboard
---
[[🌟 North Star]] || [[🔗 Quick Links]] || [[📁 Coding Projects]]

# Teams & People

# Upcoming Events
```dataview
LIST
FROM "300 Entities/Events"
WHERE date >= date(today)
SORT date ASC
LIMIT 5
```

# Open Actions
```dataview
TASK
WHERE completed
SORT priority DESC, due ASC
LIMIT 20
```

# Active Projects
```dataview
LIST
FROM "300 Entities/Projects"
WHERE status = "active"
```
