@echo off
setlocal EnableDelayedExpansion

:: Create log file
set "LOGFILE=%~dp0LifeOS_DEBUG_LOG.txt"
echo === LifeOS Debug Log Started: %date% %time% === > "!LOGFILE!"
echo Current Directory: %CD% >> "!LOGFILE!"

echo =============================================
echo LifeOS DEBUG MODE (Step-by-Step)
echo =============================================
echo Every step will be printed and logged.
echo Check !LOGFILE! for the full history.
echo:

:: Detect current directory and allow user to override
set "DETECTED_PATH=%CD%"
echo [STEP 1] Detected path: "!DETECTED_PATH!"
echo [STEP 1] Detected path: "!DETECTED_PATH!" >> "!LOGFILE!"
timeout /t 1 /nobreak > nul

echo:
echo WHERE do you want to create the "LifeOS" folder?
echo (Press ENTER for "!DETECTED_PATH!", or type a path like D:\)
set /p "USER_PATH=Path: "
echo [STEP 2] User entered: "!USER_PATH!" >> "!LOGFILE!"

if "!USER_PATH!"=="" (
    set "ROOT_BASE=!DETECTED_PATH!"
    echo [STEP 3] Using detected path >> "!LOGFILE!"
) else (
    set "ROOT_BASE=!USER_PATH!"
    echo [STEP 3] Using user path >> "!LOGFILE!"
)

:: Remove trailing backslash
if "!ROOT_BASE:~-1!"=="\" (
    set "ROOT_BASE=!ROOT_BASE:~0,-1!"
    echo [STEP 4] Removed trailing backslash >> "!LOGFILE!"
)
set "ROOT=!ROOT_BASE!\LifeOS"
echo [STEP 5] Final ROOT path: "!ROOT!" >> "!LOGFILE!"

echo:
echo =============================================
echo Targeting Vault: !ROOT!
echo =============================================
echo Press any key to start creating folders...
pause > nul

:: 1. CREATE DIRECTORIES
echo:
echo [6/10] Building Folder Structure...
echo [STEP 6] Creating main folder: "!ROOT!" >> "!LOGFILE!"
if not exist "!ROOT!" (
    mkdir "!ROOT!"
    if errorlevel 1 (
        echo ERROR: Failed to create !ROOT!
        echo ERROR: Failed to create !ROOT! >> "!LOGFILE!"
        pause
        exit /b 1
    )
    echo SUCCESS: Created !ROOT!
) else (
    echo Folder already exists: !ROOT!
)
timeout /t 1 /nobreak > nul

echo [STEP 7] Creating subdirectories...
echo [STEP 7] Creating subdirectories... >> "!LOGFILE!"

set "FOLDERS=000 OS\AI\skills\coding 000 OS\AI\skills\writing 000 OS\AI\skills\productivity 000 OS\AI\scripts 000 OS\AI\prompts 000 OS\Templates 100 Periodics\Daily 100 Periodics\Weekly 100 Periodics\Monthly 100 Periodics\Quarterly 199 Writing 200 Notes 210 AI Log 300 Entities\Areas 300 Entities\Companies 300 Entities\Events 300 Entities\Goals 300 Entities\Meetings 300 Entities\People 300 Entities\Projects\Coding\_synced 300 Entities\Software 300 Entities\Teams 400 Resources\Blog Posts 400 Resources\Books 400 Resources\Prompt Library\Skills 999 Review\Root Files"

for %%F in (!FOLDERS!) do (
    set "FULLPATH=!ROOT!\%%F"
    echo   Creating: !FULLPATH!
    echo   Creating: !FULLPATH! >> "!LOGFILE!"
    if not exist "!FULLPATH!" mkdir "!FULLPATH!" 2>> "!LOGFILE!"
    if errorlevel 1 (
        echo ERROR: Failed to create !FULLPATH!
        echo ERROR: Failed to create !FULLPATH! >> "!LOGFILE!"
        pause
    )
)
echo [STEP 7] Folders complete >> "!LOGFILE!"
echo [DEBUG] Folder structure created successfully!
timeout /t 1 /nobreak > nul
pause

:: 2. GENERATE CORE FILES - ONE AT A TIME WITH CHECKS
echo:
echo [8/10] Creating Core Files...
echo [8/10] Creating Core Files... >> "!LOGFILE!"

echo   Creating Dashboard.md...
echo   Creating Dashboard.md... >> "!LOGFILE!"
(
echo ---
echo type: dashboard
echo ---
echo # LifeOS Dashboard
echo:
echo ## Quick Access
echo [[North Star]] ^| [[Quick Links]] ^| [[Coding Projects]] ^| [[Writing Hub]]
) > "!ROOT!\Dashboard.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create Dashboard.md
    pause
    exit /b 1
) else (
    echo   SUCCESS: Dashboard.md created
)
timeout /t 1 /nobreak > nul

echo   Creating North Star.md...
echo   Creating North Star.md... >> "!LOGFILE!"
(
echo ---
echo type: north-star
echo ---
echo # North Star
echo:
echo ## Vision
echo *What does your ideal life look like in 5 years?*
) > "!ROOT!\North Star.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create North Star.md
    pause
    exit /b 1
) else (
    echo   SUCCESS: North Star.md created
)
timeout /t 1 /nobreak > nul

echo   Creating Quick Links.md...
echo   Creating Quick Links.md... >> "!LOGFILE!"
(
echo ---
echo type: quick-links
echo ---
echo # Quick Links
) > "!ROOT!\Quick Links.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create Quick Links.md
    pause
    exit /b 1
)
echo   SUCCESS: Quick Links.md created

echo   Creating Coding Projects.md...
echo   Creating Coding Projects.md... >> "!LOGFILE!"
(
echo ---
echo type: coding-hub
echo ---
echo # Coding Projects Hub
) > "!ROOT!\Coding Projects.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create Coding Projects.md
    pause
    exit /b 1
)
echo   SUCCESS: Coding Projects.md created

echo   Creating package.json...
echo   Creating package.json... >> "!LOGFILE!"
(
echo {
echo   "name": "lifeos-vault"
echo }
) > "!ROOT!\package.json" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create package.json
    pause
    exit /b 1
)
echo   SUCCESS: package.json created

echo   Creating tsconfig.json...
echo   Creating tsconfig.json... >> "!LOGFILE!"
(
echo {
echo   "compilerOptions": {}
echo }
) > "!ROOT!\tsconfig.json" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create tsconfig.json
    pause
    exit /b 1
)
echo   SUCCESS: tsconfig.json created

echo   Creating README.md...
echo   Creating README.md... >> "!LOGFILE!"
(
echo # LifeOS Vault
echo:
echo A comprehensive personal operating system
) > "!ROOT!\README.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create README.md
    pause
    exit /b 1
)
echo   SUCCESS: README.md created

echo:
echo [DEBUG] Core Files created successfully!
echo [STEP 8] Core files complete >> "!LOGFILE!"
pause

:: Continue with remaining steps abbreviated for debugging
echo:
echo [9/10] Creating skills folders...
echo [9/10] Skills folders would be created here >> "!LOGFILE!"

echo:
echo [10/10] Creating scripts...
set "SCRIPTS_DIR=!ROOT!\000 OS\AI\scripts"
echo   SCRIPTS_DIR = !SCRIPTS_DIR!
echo   Checking if folder exists...
if not exist "!SCRIPTS_DIR!" (
    echo ERROR: Scripts folder doesn't exist: !SCRIPTS_DIR!
    echo ERROR: Scripts folder missing >> "!LOGFILE!"
    pause
    exit /b 1
)

echo   Creating project-config.json...
(
echo {
echo   "projects": []
echo }
) > "!SCRIPTS_DIR!\project-config.json" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo ERROR: Failed to create project-config.json
    echo ERROR: Failed to create project-config.json >> "!LOGFILE!"
    pause
    exit /b 1
)
echo   SUCCESS: project-config.json created

echo:
echo =========================================
echo DEBUG COMPLETE - ALL FILES CREATED
echo =========================================
echo Check the log file: !LOGFILE!
echo:
pause
endlocal