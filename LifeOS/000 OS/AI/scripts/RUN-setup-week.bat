@echo off
echo.
echo =============================================
echo  Setting Up Weekly Notes
echo =============================================
echo.

cd /d "%~dp0"

echo Running setup-week.ts...
echo.

bun run setup-week.ts

if errorlevel 1 (
    echo.
    echo =============================================
    echo  Setup failed! Check errors above.
    echo =============================================
    echo.
) else (
    echo.
    echo =============================================
    echo  Week setup completed!
    echo =============================================
    echo.
    echo Files created in:
    echo   100 Periodics/Weekly/
    echo   100 Periodics/Daily/
    echo.
    echo Open Obsidian to start using your weekly notes!
    echo.
)

pause
