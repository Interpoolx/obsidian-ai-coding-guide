@echo off
echo.
echo =============================================
echo  Generating Coding Project Summaries
echo =============================================
echo.

cd /d "%~dp0"

echo Running generate-coding-summaries.ts...
echo.

bun run generate-coding-summaries.ts

if errorlevel 1 (
    echo.
    echo =============================================
    echo  Generation failed! Check errors above.
    echo =============================================
    echo.
) else (
    echo.
    echo =============================================
    echo  Summaries generated successfully!
    echo =============================================
    echo.
    echo Output file:
    echo   200 Notes/Coding Project Summaries.md
    echo.
    echo Open this file in Obsidian to view your project overview.
    echo.
)

pause
