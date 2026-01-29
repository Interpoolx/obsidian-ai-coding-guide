@echo off
setlocal
chcp 65001 > nul

set VAULT_NAME=LifeOS
echo Initializing AI-Native Obsidian Vault in .\%VAULT_NAME%...

:: Define Directory Structure
set DIRS="%VAULT_NAME%/000 OS" "%VAULT_NAME%/000 OS/Claude" "%VAULT_NAME%/000 OS/Claude/commands" "%VAULT_NAME%/000 OS/Claude/scripts" "%VAULT_NAME%/000 OS/Claude/skills" "%VAULT_NAME%/000 OS/Templates" "%VAULT_NAME%/100 Periodics" "%VAULT_NAME%/100 Periodics/Daily" "%VAULT_NAME%/100 Periodics/Weekly" "%VAULT_NAME%/100 Periodics/Monthly" "%VAULT_NAME%/100 Periodics/Quarterly" "%VAULT_NAME%/199 Writing" "%VAULT_NAME%/200 Notes" "%VAULT_NAME%/210 AI Log" "%VAULT_NAME%/300 Entities" "%VAULT_NAME%/300 Entities/Areas" "%VAULT_NAME%/300 Entities/Companies" "%VAULT_NAME%/300 Entities/Events" "%VAULT_NAME%/300 Entities/Goals" "%VAULT_NAME%/300 Entities/Meetings" "%VAULT_NAME%/300 Entities/People" "%VAULT_NAME%/300 Entities/Projects" "%VAULT_NAME%/300 Entities/Software" "%VAULT_NAME%/300 Entities/Teams" "%VAULT_NAME%/400 Resources" "%VAULT_NAME%/400 Resources/Blog Posts" "%VAULT_NAME%/400 Resources/Books" "%VAULT_NAME%/400 Resources/Courses" "%VAULT_NAME%/400 Resources/Highlights" "%VAULT_NAME%/400 Resources/Media" "%VAULT_NAME%/400 Resources/Podcasts" "%VAULT_NAME%/400 Resources/Prompt Library" "%VAULT_NAME%/400 Resources/Prompt Library/Commands" "%VAULT_NAME%/400 Resources/Prompt Library/Skills" "%VAULT_NAME%/400 Resources/Roundups" "%VAULT_NAME%/400 Resources/Videos" "%VAULT_NAME%/400 Resources/Web" "%VAULT_NAME%/999 Review"

:: Create Directories
for %%d in (%DIRS%) do (
    if not exist %%d mkdir %%d
)

:: Create Core Files with UTF-8 encoding (approximate via redirection in chcp 65001)
if not exist "%VAULT_NAME%/🌟 North Star.md" (
    echo --- type: north-star --- > "%VAULT_NAME%/🌟 North Star.md"
    echo # Life Vision >> "%VAULT_NAME%/🌟 North Star.md"
    echo # Core Values >> "%VAULT_NAME%/🌟 North Star.md"
)

if not exist "%VAULT_NAME%/📊 Dashboard.md" (
    echo --- type: dashboard --- > "%VAULT_NAME%/📊 Dashboard.md"
    echo # Teams >> "%VAULT_NAME%/📊 Dashboard.md"
    echo # Open Action Items >> "%VAULT_NAME%/📊 Dashboard.md"
)

if not exist "%VAULT_NAME%/🔗 Quick Links.md" (
    echo --- type: quick-links --- > "%VAULT_NAME%/🔗 Quick Links.md"
    echo # Work >> "%VAULT_NAME%/🔗 Quick Links.md"
)

:: Create Sample Template
if not exist "%VAULT_NAME%/000 OS/Templates/Daily.md" (
    echo --- type: daily --- > "%VAULT_NAME%/000 OS/Templates/Daily.md"
    echo # Today's Top 3 >> "%VAULT_NAME%/000 OS/Templates/Daily.md"
)

echo.
echo Setup Complete! 
echo Your AI-native Obsidian vault is ready in the .\%VAULT_NAME% folder.
echo Open the .\%VAULT_NAME% folder in Obsidian to get started.
pause