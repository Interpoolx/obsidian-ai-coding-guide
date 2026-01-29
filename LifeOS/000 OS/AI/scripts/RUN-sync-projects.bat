@echo off
echo.
echo =============================================
echo  Syncing External Projects into Vault
echo =============================================
echo.

cd /d "%~dp0"

if not exist "project-config.json" (
    echo ERROR: project-config.json not found!
    echo.
    echo Please create project-config.json in this folder first.
    echo See the example configuration in the setup guide.
    echo.
    pause
    exit /b 1
)

echo Running sync-projects.ts...
echo.

bun run sync-projects.ts

if errorlevel 1 (
    echo.
    echo =============================================
    echo  Sync failed! Check errors above.
    echo =============================================
    echo.
) else (
    echo.
    echo =============================================
    echo  Sync completed successfully!
    echo =============================================
    echo.
    echo Files synced to:
    echo   300 Entities/Projects/Coding/_synced/
    echo.
    echo Project notes at:
    echo   300 Entities/Projects/Coding/
    echo.
)

pause
