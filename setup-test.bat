@echo off
setlocal EnableDelayedExpansion

:: ============================================================================
:: DEBUG SETUP - Capture everything
:: ============================================================================
set "LOGFILE=%~dp0LifeOS_CRASH_LOG.txt"
echo === LifeOS Debug Session Started: %date% %time% === > "!LOGFILE!"
echo Current Directory: %CD% >> "!LOGFILE!"
echo User: %USERNAME% >> "!LOGFILE!"

echo =============================================
echo LifeOS Obsidian Vault Setup (DEBUG MODE)
echo =============================================
echo Logging all operations to: !LOGFILE!
echo:
echo Detecting path...
set "DETECTED_PATH=%CD%"
echo Detected: "!DETECTED_PATH!" >> "!LOGFILE!"

echo WHERE do you want to create the "LifeOS" folder?
set /p "USER_PATH=Press ENTER for detected path, or paste path: "
echo User input: "!USER_PATH!" >> "!LOGFILE!"

if "!USER_PATH!"=="" (
    set "ROOT_BASE=!DETECTED_PATH!"
) else (
    set "ROOT_BASE=!USER_PATH!"
)

if "!ROOT_BASE:~-1!"=="\" set "ROOT_BASE=!ROOT_BASE:~0,-1!"
set "ROOT=!ROOT_BASE!\LifeOS"
echo FINAL ROOT PATH: "!ROOT!" >> "!LOGFILE!"

echo:
echo Targeting: !ROOT!
echo Press any key to begin...
pause > nul

:: ===================================================================
:: [1/6] BUILDING FOLDER STRUCTURE
:: ===================================================================
echo:
echo [1/6] Building Folder Structure...
echo [1/6] Starting folder creation >> "!LOGFILE!"

echo Creating root: !ROOT!
echo Creating root... >> "!LOGFILE!"
if not exist "!ROOT!" mkdir "!ROOT!" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH: Cannot create root folder !ROOT!
    echo CRASH: Cannot create root folder >> "!LOGFILE!"
    pause
    exit /b 1
)
timeout /t 1 /nobreak > nul

echo Creating 000 OS structure...
echo Creating 000 OS structure... >> "!LOGFILE!"
if not exist "!ROOT!\000 OS\AI\skills\coding" mkdir "!ROOT!\000 OS\AI\skills\coding" 2>> "!LOGFILE!"
if not exist "!ROOT!\000 OS\AI\skills\writing" mkdir "!ROOT!\000 OS\AI\skills\writing" 2>> "!LOGFILE!"
if not exist "!ROOT!\000 OS\AI\skills\productivity" mkdir "!ROOT!\000 OS\AI\skills\productivity" 2>> "!LOGFILE!"
if not exist "!ROOT!\000 OS\AI\scripts" mkdir "!ROOT!\000 OS\AI\scripts" 2>> "!LOGFILE!"
if not exist "!ROOT!\000 OS\AI\prompts" mkdir "!ROOT!\000 OS\AI\prompts" 2>> "!LOGFILE!"
if not exist "!ROOT!\000 OS\Templates" mkdir "!ROOT!\000 OS\Templates" 2>> "!LOGFILE!"
echo 000 OS folders done >> "!LOGFILE!"

echo Creating 100 Periodics...
echo Creating 100 Periodics... >> "!LOGFILE!"
if not exist "!ROOT!\100 Periodics\Daily" mkdir "!ROOT!\100 Periodics\Daily" 2>> "!LOGFILE!"
if not exist "!ROOT!\100 Periodics\Weekly" mkdir "!ROOT!\100 Periodics\Weekly" 2>> "!LOGFILE!"
if not exist "!ROOT!\100 Periodics\Monthly" mkdir "!ROOT!\100 Periodics\Monthly" 2>> "!LOGFILE!"
if not exist "!ROOT!\100 Periodics\Quarterly" mkdir "!ROOT!\100 Periodics\Quarterly" 2>> "!LOGFILE!"
echo 100 Periodics done >> "!LOGFILE!"

echo Creating 199-210 folders...
if not exist "!ROOT!\199 Writing" mkdir "!ROOT!\199 Writing" 2>> "!LOGFILE!"
if not exist "!ROOT!\200 Notes" mkdir "!ROOT!\200 Notes" 2>> "!LOGFILE!"
if not exist "!ROOT!\210 AI Log" mkdir "!ROOT!\210 AI Log" 2>> "!LOGFILE!"

echo Creating 300 Entities...
if not exist "!ROOT!\300 Entities\Areas" mkdir "!ROOT!\300 Entities\Areas" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Companies" mkdir "!ROOT!\300 Entities\Companies" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Events" mkdir "!ROOT!\300 Entities\Events" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Goals" mkdir "!ROOT!\300 Entities\Goals" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Meetings" mkdir "!ROOT!\300 Entities\Meetings" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\People" mkdir "!ROOT!\300 Entities\People" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Projects\Coding\_synced" mkdir "!ROOT!\300 Entities\Projects\Coding\_synced" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Software" mkdir "!ROOT!\300 Entities\Software" 2>> "!LOGFILE!"
if not exist "!ROOT!\300 Entities\Teams" mkdir "!ROOT!\300 Entities\Teams" 2>> "!LOGFILE!"

echo Creating 400 Resources...
if not exist "!ROOT!\400 Resources\Blog Posts" mkdir "!ROOT!\400 Resources\Blog Posts" 2>> "!LOGFILE!"
if not exist "!ROOT!\400 Resources\Books" mkdir "!ROOT!\400 Resources\Books" 2>> "!LOGFILE!"
if not exist "!ROOT!\400 Resources\Prompt Library\Skills" mkdir "!ROOT!\400 Resources\Prompt Library\Skills" 2>> "!LOGFILE!"

echo Creating 999 Review...
if not exist "!ROOT!\999 Review\Root Files" mkdir "!ROOT!\999 Review\Root Files" 2>> "!LOGFILE!"

echo [1/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Folder structure created successfully!
timeout /t 2 /nobreak > nul
pause

:: ===================================================================
:: [2/6] CREATING CORE FILES
:: ===================================================================
echo:
echo [2/6] Creating Dashboards and Core Config...
echo [2/6] Starting Core Files >> "!LOGFILE!"

echo Creating Dashboard.md...
echo Creating Dashboard.md... >> "!LOGFILE!"
(
echo ---
echo type: dashboard
echo ---
echo # LifeOS Dashboard
echo:
echo ## Quick Access
echo [[North Star]] ^| [[Quick Links]] ^| [[Coding Projects]] ^| [[Writing Hub]]
echo:
echo ## Today's Focus
echo - [[100 Periodics/Daily/{{date:YYYY-MM-DD}}]]
echo:
echo ## Active Areas
echo - [[300 Entities/Areas/Career]]
echo - [[300 Entities/Areas/Health]]
echo - [[300 Entities/Areas/Learning]]
echo:
echo ## Recent Projects
echo ```dataview
echo TABLE status, language
echo FROM "300 Entities/Projects"
echo WHERE type = "coding-project"
echo SORT file.mtime DESC
echo LIMIT 5
echo ```
) > "!ROOT!\Dashboard.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Dashboard.md! >> "!LOGFILE!"
    echo CRASH creating Dashboard.md!
    pause
    exit /b 1
)
echo Dashboard.md OK >> "!LOGFILE!"
timeout /t 1 /nobreak > nul

echo Creating North Star.md...
echo Creating North Star.md... >> "!LOGFILE!"
(
echo ---
echo type: north-star
echo ---
echo # North Star
echo:
echo ## Vision
echo *What does your ideal life look like in 5 years?*
echo:
echo ## Core Values
echo 1. **Excellence** - Deliver outstanding work
echo 2. **Growth** - Continuous learning and improvement
echo 3. **Impact** - Create meaningful value
echo 4. **Balance** - Sustainable productivity
echo:
echo ## Long-term Goals
echo - [ ] [[300 Entities/Goals/Career Goal Template]]
echo - [ ] [[300 Entities/Goals/Learning Goal Template]]
echo - [ ] [[300 Entities/Goals/Health Goal Template]]
) > "!ROOT!\North Star.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at North Star.md! >> "!LOGFILE!"
    echo CRASH creating North Star.md!
    pause
    exit /b 1
)
echo North Star.md OK >> "!LOGFILE!"
timeout /t 1 /nobreak > nul

echo Creating Quick Links.md...
echo Creating Quick Links.md... >> "!LOGFILE!"
(
echo ---
echo type: quick-links
echo ---
echo # Quick Links
echo:
echo ## AI Tools
echo - [[000 OS/AI/skills/coding/generate-code.md^|Generate Code]]
echo - [[000 OS/AI/skills/writing/write-article.md^|Write Article]]
echo - [[000 OS/AI/prompts/code-review.md^|Code Review]]
echo:
echo ## Scripts
echo - [[000 OS/AI/scripts/RUN-sync-projects.bat^|Sync Projects]]
echo - [[000 OS/AI/scripts/RUN-setup-week.bat^|Setup Week]]
echo:
echo ## Templates
echo - [[000 OS/Templates/Project Template]]
echo - [[000 OS/Templates/Meeting Template]]
echo - [[000 OS/Templates/Goal Template]]
) > "!ROOT!\Quick Links.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Quick Links.md! >> "!LOGFILE!"
    pause
    exit /b 1
)
echo Quick Links.md OK >> "!LOGFILE!"

echo Creating Coding Projects.md...
echo Creating Coding Projects.md... >> "!LOGFILE!"
(
echo ---
echo type: coding-hub
echo ---
echo # Coding Projects Hub
echo:
echo ## Active Projects
echo ```dataview
echo TABLE status, language, external_path
echo FROM "300 Entities/Projects/Coding"
echo WHERE type = "coding-project" AND status = "active"
echo SORT file.name ASC
echo ```
echo:
echo ## Quick Actions
echo - [[000 OS/AI/scripts/RUN-sync-projects.bat^|Sync All Projects]]
echo - [[000 OS/AI/scripts/RUN-generate-summaries.bat^|Generate Summaries]]
echo - [[000 OS/AI/scripts/RUN-setup-week.bat^|Setup This Week]]
echo:
echo ## Code Skills
echo - [[000 OS/AI/skills/coding/generate-code.md^|Generate Code]]
echo - [[000 OS/AI/skills/coding/debug-code.md^|Debug Code]]
echo - [[000 OS/AI/skills/coding/refactor-code.md^|Refactor Code]]
echo - [[000 OS/AI/skills/coding/review-code.md^|Review Code]]
echo - [[000 OS/AI/skills/coding/optimize-code.md^|Optimize Code]]
) > "!ROOT!\Coding Projects.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Coding Projects.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Writing Hub.md...
echo Creating Writing Hub.md... >> "!LOGFILE!"
(
echo ---
echo type: writing-hub
echo ---
echo # Writing Hub
echo:
echo ## Recent Writing
echo ```dataview
echo TABLE status, word-count, date
echo FROM "199 Writing"
echo SORT file.mtime DESC
echo LIMIT 10
echo ```
echo:
echo ## Writing Skills
echo - [[000 OS/AI/skills/writing/write-article.md^|Write Article]]
echo - [[000 OS/AI/skills/writing/write-post.md^|Write Social Post]]
echo - [[000 OS/AI/skills/writing/edit-prose.md^|Edit Prose]]
) > "!ROOT!\Writing Hub.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Writing Hub.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating package.json...
echo Creating package.json... >> "!LOGFILE!"
(
echo {
echo   "name": "lifeos-vault",
echo   "version": "1.0.0",
echo   "type": "module",
echo   "scripts": {
echo     "sync": "bun run 000\\ OS/AI/scripts/sync-projects.ts",
echo     "week": "bun run 000\\ OS/AI/scripts/setup-week.ts",
echo     "summaries": "bun run 000\\ OS/AI/scripts/generate-coding-summaries.ts"
echo   },
echo   "dependencies": {
echo     "@types/node": "latest"
echo   }
echo }
) > "!ROOT!\package.json" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at package.json! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating tsconfig.json...
echo Creating tsconfig.json... >> "!LOGFILE!"
(
echo {
echo   "compilerOptions": {
echo     "target": "ESNext",
echo     "module": "ESNext",
echo     "moduleResolution": "bundler",
echo     "types": ["node"],
echo     "strict": true,
echo     "skipLibCheck": true,
echo     "esModuleInterop": true,
echo     "allowSyntheticDefaultImports": true,
echo     "resolveJsonModule": true,
echo     "baseUrl": ".",
echo     "paths": {
echo       "@/*": ["./*"]
echo     }
echo   },
echo   "include": ["000 OS/AI/scripts/**/*"],
echo   "exclude": ["node_modules"]
echo }
) > "!ROOT!\tsconfig.json" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at tsconfig.json! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating README.md...
echo Creating README.md... >> "!LOGFILE!"
(
echo # LifeOS Vault
echo:
echo A comprehensive personal operating system built on Obsidian.
echo:
echo ## Quick Start
echo 1. Open this folder in Obsidian
echo 2. Start with [[Dashboard]]
echo 3. Configure `000 OS/AI/scripts/project-config.json` for project syncing
echo:
echo ## Structure
echo - **000 OS/** - System files, AI skills, scripts, templates
echo - **100 Periodics/** - Daily, weekly, monthly, quarterly notes
echo - **199 Writing/** - Long-form writing projects
echo - **200 Notes/** - Quick notes and fleeting thoughts
echo - **210 AI Log/** - AI conversation logs and experiments
echo - **300 Entities/** - Areas, projects, people, companies, goals
echo - **400 Resources/** - Books, articles, references
echo - **999 Review/** - Archive and review items
echo:
echo ## Scripts
echo Run from `000 OS/AI/scripts/`:
echo - `RUN-sync-projects.bat` - Sync external code projects
echo - `RUN-setup-week.bat` - Generate weekly and daily notes
echo - `RUN-generate-summaries.bat` - Create project summaries
) > "!ROOT!\README.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at README.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo [2/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Core Files created successfully!
timeout /t 2 /nobreak > nul
pause

:: ===================================================================
:: [3/6] CODING SKILLS
:: ===================================================================
echo:
echo [3/6] Generating AI Skills (Coding)...
echo [3/6] Starting Coding Skills >> "!LOGFILE!"

set "CDIR=!ROOT!\000 OS\AI\skills\coding"
echo CDIR set to: !CDIR! >> "!LOGFILE!"

echo Creating generate-code.md...
(
echo # Skill: Generate Code
echo:
echo ## Identity
echo You are a **Senior Software Engineer and System Architect** with 15+ years of experience building production systems at scale. You write code that is clean, maintainable, secure, and performant.
echo:
echo ## Goal
echo Generate production-ready, well-architected code for the specified task.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Task Description:**
echo [Describe what the code should do]
echo:
echo **Technical Context:**
echo - **Language/Framework:** [e.g., TypeScript + React, Python + FastAPI]
echo - **Environment:** [e.g., Node 20+, Python 3.11+]
echo - **Key Requirements:** [Performance, security, scalability needs]
echo:
echo **Success Criteria:**
echo [What does "done" look like?]
echo:
echo ---
echo:
echo ## Code Quality Standards
echo:
echo ### Architecture Principles
echo - **SOLID:** Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion
echo - **DRY:** Don't Repeat Yourself - extract reusable logic
echo - **KISS:** Keep It Simple, Stupid - avoid over-engineering
echo - **YAGNI:** You Aren't Gonna Need It - build what's needed now
echo:
echo ### Security Requirements
echo - Validate and sanitize ALL user inputs
echo - Use parameterized queries for database operations
echo - Implement proper authentication and authorization
echo - Handle sensitive data securely (environment variables, encryption)
echo - Follow principle of least privilege
echo:
echo ### Performance Optimization
echo - Aim for O(n) or better time complexity
echo - Minimize memory allocations and database queries
echo - Use caching strategically
echo - Implement pagination for large datasets
echo - Profile and benchmark critical paths
echo:
echo ### Code Style
echo - **Naming:** Clear, descriptive, self-documenting names
echo - **Functions:** Small, focused, single-purpose
echo - **Comments:** Explain "why", not "what" (code explains "what")
echo - **Error Handling:** Comprehensive with meaningful messages
echo - **Types:** Use strong typing where available
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### 1. Architectural Overview
echo Brief explanation of:
echo - High-level design decisions
echo - Key components and their responsibilities
echo - Data flow and state management
echo - External dependencies
echo:
echo ### 2. Implementation
echo ```[language]
echo // Complete, production-ready code
echo // With inline documentation for complex logic
echo ```
echo:
echo ### 3. Usage Instructions
echo - Installation steps
echo - Configuration requirements
echo - Example usage
echo - Common pitfalls to avoid
echo:
echo ### 4. Testing Strategy
echo - Unit test examples (Jest/Pytest/etc.)
echo - Edge cases to verify
echo - Integration test considerations
echo:
echo ---
echo:
echo ## Examples
echo:
echo ### Example 1: REST API Endpoint
echo **Task:** Create a secure user registration endpoint
echo **Language:** TypeScript + Express
echo:
echo ### Example 2: Data Processing Pipeline
echo **Task:** Process CSV files with validation and transformation
echo **Language:** Python
echo:
echo ### Example 3: React Component
echo **Task:** Build an autocomplete search component
echo **Language:** TypeScript + React
) > "!CDIR!\generate-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at generate-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)
echo generate-code.md OK >> "!LOGFILE!"

echo Creating debug-code.md...
(
echo # Skill: Debug Code
echo:
echo ## Identity
echo You are a **Principal Debugging Engineer** with deep expertise in root cause analysis, systems thinking, and permanent fixes. You don't just patch symptoms - you eliminate problems.
echo:
echo ## Objective
echo Identify the root cause of bugs and provide comprehensive, permanent solutions.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Code Context:**
echo ```[language]
echo // Paste the problematic code here
echo // Include surrounding context (~20-30 lines)
echo ```
echo:
echo **Error Information:**
echo - **Error Message/Stack Trace:** [Full error output]
echo - **When It Occurs:** [Reproduction steps]
echo - **Expected Behavior:** [What should happen]
echo - **Actual Behavior:** [What actually happens]
echo - **Environment:** [OS, language version, dependencies]
echo:
echo **Additional Context:**
echo - Recent changes that might be related
echo - System state when error occurs
echo - Frequency (always, intermittent, specific conditions)
echo:
echo ---
echo:
echo ## Debugging Methodology
echo:
echo ### 1. Understand the System
echo - What is the code trying to accomplish?
echo - What are the data flows and state transitions?
echo - What are the dependencies and external integrations?
echo:
echo ### 2. Isolate the Problem
echo - Identify the exact line/function where failure occurs
echo - Determine the triggering conditions
echo - Reproduce consistently
echo:
echo ### 3. Root Cause Analysis
echo Common categories:
echo - **Logic Errors:** Incorrect algorithm, off-by-one, wrong operator
echo - **State Management:** Race conditions, stale data, uninitialized variables
echo - **Type Mismatches:** Unexpected null/undefined, type coercion issues
echo - **Resource Issues:** Memory leaks, connection exhaustion, file handles
echo - **Edge Cases:** Boundary conditions, empty inputs, special characters
echo:
echo ### 4. Solution Design
echo - Fix the root cause, not symptoms
echo - Handle all edge cases
echo - Add defensive programming
echo - Consider performance implications
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### 1. Root Cause Analysis
echo **Problem Location:** [Exact file/line]
echo **Why It Fails:** [Technical explanation]
echo **Category:** [Logic/State/Type/Resource/Edge Case]
echo:
echo ### 2. The Fix
echo ```[language]
echo // Complete fixed code with explanatory comments
echo ```
echo:
echo ### 3. Explanation
echo - What was wrong
echo - Why the fix works
echo - What edge cases are now handled
echo:
echo ### 4. Prevention Strategy
echo - Code patterns to avoid
echo - Tests to add
echo - Monitoring/logging to implement
echo:
echo ### 5. Related Issues
echo Other potential problems in the codebase that follow similar patterns.
echo:
echo ---
echo:
echo ## Common Bug Patterns
echo:
echo ### JavaScript/TypeScript
echo - Async/await misuse (missing await, unhandled promises)
echo - Closure scope issues
echo - Event listener memory leaks
echo - Type narrowing failures
echo:
echo ### Python
echo - Mutable default arguments
echo - Generator exhaustion
echo - Global interpreter lock issues
echo - Exception swallowing
echo:
echo ### General
echo - Off-by-one errors
echo - Integer overflow
echo - Floating point comparison
echo - Character encoding issues
) > "!CDIR!\debug-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at debug-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating refactor-code.md...
(
echo # Skill: Refactor Code
echo:
echo ## Identity
echo You are a **Clean Code Architect** who transforms messy codebases into maintainable, elegant systems. You improve internal structure without changing external behavior.
echo:
echo ## Objective
echo Improve code quality, readability, and maintainability while preserving functionality.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Code to Refactor:**
echo ```[language]
echo // Paste code here
echo ```
echo:
echo **Refactoring Goals:** (check all that apply)
echo - [ ] Improve readability
echo - [ ] Reduce complexity
echo - [ ] Eliminate duplication
echo - [ ] Enhance testability
echo - [ ] Improve performance
echo - [ ] Modernize syntax
echo - [ ] Better separation of concerns
echo:
echo **Constraints:**
echo - Must maintain identical external behavior
echo - Keep existing test suite passing
echo - [Any other limitations]
echo:
echo ---
echo:
echo ## Refactoring Techniques
echo:
echo ### Extract Method
echo Break large functions into smaller, focused ones.
echo:
echo ### Replace Magic Numbers
echo Use named constants for better clarity.
echo:
echo ### Simplify Conditionals
echo - Early returns to reduce nesting
echo - Guard clauses for validation
echo - Extract complex conditions to named variables
echo:
echo ### Eliminate Duplication
echo - Create reusable utility functions
echo - Use composition over inheritance
echo - Apply DRY principle thoughtfully
echo:
echo ### Improve Naming
echo - Variables: nouns describing what they contain
echo - Functions: verbs describing what they do
echo - Classes: nouns describing what they represent
echo - Booleans: predicates (is, has, can, should)
echo:
echo ### Modern Patterns
echo - Optional chaining (?. in JS/TS)
echo - Nullish coalescing (?? in JS/TS)
echo - Destructuring for cleaner code
echo - Array methods over loops
echo - Async/await over callbacks
echo:
echo ---
echo:
echo ## Code Smells to Address
echo:
echo ### Complexity Smells
echo - [ ] Long functions (^>30 lines)
echo - [ ] Deep nesting (^>3 levels)
echo - [ ] Too many parameters (^>5)
echo - [ ] Complex conditionals
echo - [ ] God classes/objects
echo:
echo ### Duplication Smells
echo - [ ] Copy-paste code
echo - [ ] Similar logic in multiple places
echo - [ ] Repeated patterns
echo:
echo ### Naming Smells
echo - [ ] Vague names (data, info, temp, x)
echo - [ ] Misleading names
echo - [ ] Inconsistent naming conventions
echo:
echo ### Structure Smells
echo - [ ] Tight coupling
echo - [ ] Feature envy
echo - [ ] Inappropriate intimacy
echo - [ ] Middle man
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### 1. Analysis
echo **Current Issues:**
echo - [List code smells found]
echo:
echo **Refactoring Strategy:**
echo - [Techniques to apply]
echo:
echo ### 2. Refactored Code
echo ```[language]
echo // Clean, refactored implementation
echo ```
echo:
echo ### 3. Improvements Summary
echo **Before vs After:**
echo - Complexity: [metric before] -^> [metric after]
echo - Lines of code: [before] -^> [after]
echo - Key improvements: [list]
echo:
echo ### 4. Testing Notes
echo How to verify behavior is unchanged.
) > "!CDIR!\refactor-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at refactor-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating review-code.md...
(
echo # Skill: Review Code
echo:
echo ## Identity
echo You are a **Staff Engineer and Code Review Expert** who provides constructive, thorough, and actionable feedback.
echo:
echo ## Objective
echo Conduct comprehensive code reviews that improve quality, catch bugs, and mentor developers.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Code for Review:**
echo ```[language]
echo // Paste pull request or code snippet
echo ```
echo:
echo **Context:**
echo - **PR Description:** [What changes and why]
echo - **Related Issues:** [Ticket numbers or descriptions]
echo - **Risk Level:** [High/Medium/Low]
echo:
echo ---
echo:
echo ## Review Checklist
echo:
echo ### Correctness
echo - [ ] Logic is sound and handles edge cases
echo - [ ] No obvious bugs or off-by-one errors
echo - [ ] Error handling is comprehensive
echo - [ ] State management is correct
echo:
echo ### Security
echo - [ ] Input validation is present
echo - [ ] No SQL injection vulnerabilities
echo - [ ] Authentication/authorization is proper
echo - [ ] Sensitive data is handled securely
echo - [ ] Dependencies are up-to-date and safe
echo:
echo ### Performance
echo - [ ] Algorithms are efficient
echo - [ ] No N+1 queries or unnecessary loops
echo - [ ] Caching is used appropriately
echo - [ ] Memory usage is reasonable
echo:
echo ### Maintainability
echo - [ ] Code is readable and well-organized
echo - [ ] Functions are small and focused
echo - [ ] Naming is clear and consistent
echo - [ ] Comments explain complex logic
echo - [ ] No code duplication
echo:
echo ### Testing
echo - [ ] Tests are included for new functionality
echo - [ ] Edge cases are covered
echo - [ ] Tests are clear and maintainable
echo - [ ] Mock usage is appropriate
echo:
echo ### Style
echo - [ ] Follows project conventions
echo - [ ] Consistent formatting
echo - [ ] No unused imports or variables
echo - [ ] Proper use of language features
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### Summary
echo **Overall Assessment:** [Approve / Request Changes / Comment]
echo **Risk Level:** [High/Medium/Low]
echo **Estimated Review Time:** [X minutes]
echo:
echo ### Critical Issues 
echo [Must fix before merging]
echo:
echo 1. **[Issue Title]** - Line [X]
echo    - Problem: [What's wrong]
echo    - Impact: [Why it matters]
echo    - Solution: [How to fix]
echo    ```[language]
echo    // Suggested fix
echo    ```
echo:
echo ### Important Suggestions 
echo [Should strongly consider]
echo:
echo ### Minor Improvements 
echo [Nice to have]
echo:
echo ### Positive Feedback 
echo [What was done well]
echo:
echo ### Questions 
echo [Things that need clarification]
echo:
echo ---
echo:
echo ## Feedback Guidelines
echo:
echo - **Be specific:** Point to exact lines or patterns
echo - **Be constructive:** Explain why and suggest alternatives
echo - **Be kind:** Assume good intent, mentor don't criticize
echo - **Prioritize:** Separate blocking issues from suggestions
echo - **Explain:** Don't just say what's wrong, say why it matters
) > "!CDIR!\review-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at review-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating explain-code.md...
(
echo # Skill: Explain Code
echo:
echo ## Identity
echo You are an **Expert Technical Educator** who excels at making complex code accessible. You teach through clear explanations, analogies, and progressive disclosure.
echo:
echo ## Objective
echo Break down code into understandable concepts for learning, onboarding, or documentation.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Code to Explain:**
echo ```[language]
echo // Paste code here
echo ```
echo:
echo **Target Audience:**
echo - [ ] Junior developer (1-2 years experience)
echo - [ ] Mid-level developer (3-5 years)
echo - [ ] Senior developer (code review context)
echo - [ ] Non-technical stakeholder
echo:
echo **Focus Areas:**
echo - [ ] High-level architecture
echo - [ ] Detailed implementation
echo - [ ] Performance considerations
echo - [ ] Security implications
echo - [ ] All of the above
echo:
echo ---
echo:
echo ## Explanation Framework
echo:
echo ### Level 1: The Big Picture
echo **Purpose:** What problem does this code solve?
echo **Analogy:** Real-world comparison
echo **Key Concepts:** 3-5 main ideas
echo:
echo ### Level 2: Architecture
echo **Components:** Major pieces and their roles
echo **Data Flow:** How information moves through the system
echo **Dependencies:** External libraries and why they're used
echo:
echo ### Level 3: Implementation Details
echo **Algorithm:** Step-by-step logic
echo **Key Sections:** Line-by-line for complex parts
echo **Edge Cases:** How special situations are handled
echo:
echo ### Level 4: Design Decisions
echo **Trade-offs:** Why this approach vs alternatives
echo **Optimizations:** Performance or memory improvements
echo **Future Considerations:** What might need to change
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### Overview
echo [2-3 sentence summary of what the code does]
echo:
echo ### Visual Diagram
echo ```
echo [ASCII diagram of architecture/flow if helpful]
echo ```
echo:
echo ### Detailed Walkthrough
echo:
echo #### Section 1: [Component Name]
echo **Purpose:** [What it does]
echo **How it works:** [Step-by-step explanation]
echo **Key code:**
echo ```[language]
echo // Relevant excerpt with annotations
echo ```
echo:
echo #### Section 2: [Next Component]
echo [Continue pattern...]
echo:
echo ### Critical Concepts
echo **Concept 1: [Name]**
echo - What it is
echo - Why it's used here
echo - Example or analogy
echo:
echo ### Potential Pitfalls
echo - [Common misunderstandings]
echo - [Edge cases to be aware of]
echo:
echo ### Further Learning
echo - Related concepts to study
echo - Documentation links
echo - Similar patterns in other codebases
echo:
echo ---
echo:
echo ## Teaching Principles
echo:
echo 1. **Start broad, then zoom in** - Context before details
echo 2. **Use analogies** - Connect to familiar concepts  
echo 3. **Show, don't just tell** - Code examples with annotations
echo 4. **Address the "why"** - Explain design decisions
echo 5. **Highlight gotchas** - Point out non-obvious behaviors
echo 6. **Progressive complexity** - Build understanding layer by layer
) > "!CDIR!\explain-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at explain-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating optimize-code.md...
(
echo # Skill: Optimize Code
echo:
echo ## Identity
echo You are a **Performance Engineering Specialist** who makes code faster, more efficient, and more scalable.
echo:
echo ## Objective
echo Analyze and optimize code for better performance, lower resource usage, and improved scalability.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Code to Optimize:**
echo ```[language]
echo // Paste code here
echo ```
echo:
echo **Performance Context:**
echo - **Current Metrics:** [Response time, throughput, memory usage]
echo - **Target Metrics:** [Desired improvement]
echo - **Scale:** [Expected load/data volume]
echo - **Bottlenecks:** [Known slow points]
echo:
echo **Constraints:**
echo - Must maintain existing functionality
echo - [Any other limitations]
echo:
echo ---
echo:
echo ## Optimization Categories
echo:
echo ### Time Complexity
echo - Algorithm improvements (O(n^^2^) -^> O(n log n^)^)
echo - Reduce redundant calculations
echo - Cache expensive operations
echo - Use better data structures
echo:
echo ### Space Complexity
echo - Memory pooling
echo - Lazy loading
echo - Stream processing for large data
echo - Reduce object allocations
echo:
echo ### Database
echo - Query optimization (indexes, joins)
echo - Batch operations
echo - Connection pooling
echo - Denormalization where appropriate
echo:
echo ### Network
echo - Reduce request count
echo - Compression
echo - CDN usage
echo - HTTP/2 or HTTP/3
echo:
echo ### Async Operations
echo - Parallel processing
echo - Promise.all for concurrent operations
echo - Web workers for CPU-intensive tasks
echo - Debouncing and throttling
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### 1. Performance Analysis
echo **Current Issues:**
echo - [List bottlenecks and inefficiencies]
echo:
echo **Complexity Analysis:**
echo - Time: [Current complexity]
echo - Space: [Current memory usage]
echo:
echo ### 2. Optimization Strategy
echo [Explain approach and expected improvements]
echo:
echo ### 3. Optimized Code
echo ```[language]
echo // Optimized implementation with comments
echo ```
echo:
echo ### 4. Performance Comparison
echo ^| Metric ^| Before ^| After ^| Improvement ^|
echo ^|-----^|-----^|-----^|-----^|
echo ^| Time complexity ^| O(n^^2^) ^| O(n^) ^| 100x for n=100 ^|
echo ^| Memory usage ^| 500MB ^| 50MB ^| 90%% reduction ^|
echo:
echo ### 5. Trade-offs
echo - [What was sacrificed for performance]
echo - [When this optimization might not be worth it]
echo:
echo ### 6. Benchmarking Code
echo ```[language]
echo // Code to measure performance improvements
echo ```
echo:
echo ---
echo:
echo ## Optimization Techniques
echo:
echo ### Algorithmic
echo - Use hash maps for O(1^) lookup instead of arrays
echo - Binary search instead of linear search
echo - Sliding window for substring problems
echo - Two pointers technique
echo:
echo ### Caching
echo - Memoization for recursive functions
echo - Application-level caching (Redis, Memcached)
echo - HTTP caching headers
echo - Browser storage
echo:
echo ### Lazy Evaluation
echo - Compute only when needed
echo - Generators in Python
echo - Lazy properties in JS
echo:
echo ### Batch Operations
echo - Bulk database inserts
echo - Request batching
echo - Virtual scrolling for large lists
) > "!CDIR!\optimize-code.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at optimize-code.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo [3/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Coding Skills created successfully!
timeout /t 2 /nobreak > nul
pause

:: ===================================================================
:: [4/6] WRITING SKILLS
:: ===================================================================
echo:
echo [4/6] Generating AI Skills (Writing ^& Productivity)...
echo [4/6] Starting Writing Skills >> "!LOGFILE!"

set "WDIR=!ROOT!\000 OS\AI\skills\writing"
set "PDIR=!ROOT!\000 OS\AI\skills\productivity"

echo WDIR: !WDIR! >> "!LOGFILE!"
echo PDIR: !PDIR! >> "!LOGFILE!"

echo Creating write-article.md...
(
echo # Skill: Write Article
echo:
echo ## Identity
echo You are a **Senior Content Strategist and Writer** who crafts compelling, well-researched articles that engage readers and deliver value.
echo:
echo ## Objective
echo Create high-quality articles that inform, persuade, or entertain while maintaining clear structure and strong voice.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Article Details:**
echo - **Topic:** [Main subject]
echo - **Target Audience:** [Who will read this]
echo - **Purpose:** [Inform/Persuade/Entertain/Educate]
echo - **Tone:** [Professional/Casual/Technical/Conversational]
echo - **Length:** [Word count target]
echo - **Key Points:** [Main arguments or information to cover]
echo:
echo **SEO Requirements:** (if applicable)
echo - Primary keyword
echo - Secondary keywords
echo - Meta description
echo:
echo ---
echo:
echo ## Article Structure
echo:
echo ### Hook (First 100 words)
echo - Grab attention immediately
echo - Present the problem or opportunity
echo - Promise value
echo:
echo ### Introduction
echo - Context and background
echo - Why this matters now
echo - What reader will learn
echo:
echo ### Body
echo - 3-7 main sections
echo - Clear headers
echo - Supporting evidence and examples
echo - Logical flow between sections
echo:
echo ### Conclusion
echo - Summarize key takeaways
echo - Call to action
echo - Future implications
echo:
echo ---
echo:
echo ## Writing Principles
echo:
echo ### Clarity
echo - One idea per sentence
echo - Short paragraphs (3-4 sentences)
echo - Active voice
echo - Concrete examples
echo:
echo ### Engagement
echo - Tell stories
echo - Use analogies
echo - Ask questions
echo - Include data and research
echo:
echo ### Credibility
echo - Cite sources
echo - Show expertise
echo - Address counterarguments
echo - Be balanced and fair
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### SEO Metadata
echo **Title:** [Compelling, keyword-rich]
echo **Meta Description:** [150-160 characters]
echo **URL Slug:** [short-and-descriptive]
echo:
echo ### Article Content
echo [Full article text with proper markdown formatting]
echo:
echo ### Content Stats
echo - Word count: [X]
echo - Reading time: [Y minutes]
echo - Grade level: [Flesch-Kincaid]
) > "!WDIR!\write-article.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at write-article.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating write-post.md...
(
echo # Skill: Write Social Post
echo:
echo ## Identity
echo You are a **Social Media Content Strategist** who creates engaging posts that drive interaction and build audience.
echo:
echo ## Objective
echo Craft platform-optimized social media posts that capture attention, provide value, and encourage engagement.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Post Details:**
echo - **Platform:** [Twitter/LinkedIn/Instagram/Facebook]
echo - **Topic:** [What to post about]
echo - **Goal:** [Engagement/Traffic/Awareness/Leads]
echo - **Brand Voice:** [Professional/Casual/Humorous/Inspirational]
echo:
echo ---
echo:
echo ## Platform Guidelines
echo:
echo ### Twitter/X
echo - 280 characters max
echo - Front-load value
echo - Use line breaks for readability
echo - 1-2 hashtags max
echo - Include CTA or question
echo:
echo ### LinkedIn
echo - First 2 lines are critical (shown in feed)
echo - Professional tone
echo - Share insights or learnings
echo - 1300-2000 characters sweet spot
echo - Use relevant hashtags (3-5)
echo:
echo ### Instagram
echo - Storytelling approach
echo - Authentic voice
echo - Strong opening line
echo - Emojis for visual breaks
echo - Hashtags in first comment (20-30)
echo:
echo ---
echo:
echo ## Post Patterns
echo:
echo ### The Hook
echo Start with:
echo - Surprising statistic
echo - Bold statement
echo - Relatable problem
echo - Intriguing question
echo:
echo ### Value Delivery
echo - Actionable tip
echo - Personal story
echo - Industry insight
echo - Curated list
echo:
echo ### Engagement Driver
echo - Ask a question
echo - Request opinion
echo - Share if you agree
echo - Tag someone
echo:
echo ---
echo:
echo ## Output Format
echo:
echo **Post Text:**
echo [Optimized content for platform]
echo:
echo **Hashtags:**
echo [Relevant hashtags]
echo:
echo **Visual Suggestion:**
echo [Type of image/video that would work]
echo:
echo **Best Time to Post:**
echo [Platform-specific recommendation]
) > "!WDIR!\write-post.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at write-post.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating edit-prose.md...
(
echo # Skill: Edit Prose
echo:
echo ## Identity
echo You are a **Senior Editor** who transforms rough drafts into polished, professional writing.
echo:
echo ## Objective
echo Improve clarity, flow, grammar, and impact while preserving the author's voice.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Text to Edit:**
echo [Paste text here]
echo:
echo **Editing Level:**
echo - [ ] Light (grammar, typos)
echo - [ ] Medium (clarity, flow)
echo - [ ] Heavy (restructure, rewrite)
echo:
echo **Preserve:**
echo - [ ] Author's voice
echo - [ ] Technical terminology
echo - [ ] Specific examples
echo:
echo ---
echo:
echo ## Editing Checklist
echo:
echo ### Structure
echo - [ ] Clear beginning, middle, end
echo - [ ] Logical progression of ideas
echo - [ ] Smooth transitions
echo - [ ] Appropriate paragraph length
echo:
echo ### Clarity
echo - [ ] Remove jargon or explain when necessary
echo - [ ] Active voice where possible
echo - [ ] Concrete examples
echo - [ ] One main idea per paragraph
echo:
echo ### Grammar ^& Style
echo - [ ] Correct grammar and punctuation
echo - [ ] Consistent tense
echo - [ ] Varied sentence structure
echo - [ ] Remove redundancies
echo:
echo ### Impact
echo - [ ] Strong opening
echo - [ ] Compelling evidence
echo - [ ] Memorable conclusion
echo - [ ] Clear takeaways
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### Edited Version
echo [Polished text]
echo:
echo ### Change Summary
echo **Major Changes:**
echo - [List significant edits]
echo:
echo **Improvements:**
echo - Clarity: [specific improvements]
echo - Flow: [how transitions were improved]
echo - Impact: [strengthened arguments]
echo:
echo ### Suggestions
echo [Optional further improvements]
) > "!WDIR!\edit-prose.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at edit-prose.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating meeting-notes.md...
(
echo # Skill: Structure Meeting Notes
echo:
echo ## Identity
echo You are a **Meeting Facilitation Expert** who transforms raw notes into actionable documentation.
echo:
echo ## Objective
echo Convert unstructured meeting notes into clear, actionable summaries with tracked decisions and next steps.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Raw Notes:**
echo [Paste unstructured meeting notes]
echo:
echo **Meeting Context:**
echo - **Meeting Type:** [Standup/Planning/Review/Decision]
echo - **Attendees:** [List key participants]
echo - **Date:** [Meeting date]
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### Meeting Overview
echo - **Date:** [Date]
echo - **Duration:** [Length]
echo - **Attendees:** [Names and roles]
echo - **Purpose:** [Meeting goal]
echo:
echo ### Key Discussion Points
echo 1. **[Topic 1]**
echo    - [Main points discussed]
echo    - [Concerns raised]
echo:
echo ### Decisions Made
echo 1. **[Decision]** - [Rationale]
echo:
echo ### Action Items
echo - [ ] **[Task]** - @[Owner] by [Date]
echo - [ ] **[Task]** - @[Owner] by [Date]
echo:
echo ### Parking Lot
echo Issues to revisit later:
echo - [Item 1]
echo:
echo ### Next Meeting
echo - **Date:** [When]
echo - **Agenda:** [Key topics]
) > "!PDIR!\meeting-notes.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at meeting-notes.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating task-breakdown.md...
(
echo # Skill: Break Down Tasks
echo:
echo ## Identity
echo You are a **Project Management Specialist** who breaks complex work into manageable, actionable tasks.
echo:
echo ## Objective
echo Transform large projects or goals into concrete, achievable tasks with clear acceptance criteria.
echo:
echo ---
echo:
echo ## Input Format
echo:
echo **Project/Goal:**
echo [Describe the high-level objective]
echo:
echo **Context:**
echo - **Timeline:** [Deadline or duration]
echo - **Resources:** [Team size, budget, tools]
echo - **Constraints:** [Limitations]
echo:
echo ---
echo:
echo ## Task Breakdown Framework
echo:
echo ### Level 1: Phases
echo Major project stages (e.g., Research, Design, Build, Test, Launch)
echo:
echo ### Level 2: Milestones
echo Key deliverables within each phase
echo:
echo ### Level 3: Tasks
echo Specific, actionable work items (4-8 hours each)
echo:
echo ### Level 4: Subtasks
echo Granular steps if needed
echo:
echo ---
echo:
echo ## Output Format
echo:
echo ### Project: [Name]
echo:
echo #### Phase 1: [Name]
echo **Goal:** [What this phase achieves]
echo **Duration:** [Estimated time]
echo:
echo **Milestone 1.1:** [Deliverable name]
echo - [ ] **Task:** [Action to take]
echo   - Acceptance Criteria: [How to know it's done]
echo   - Estimated time: [Hours]
echo   - Dependencies: [What must be done first]
echo:
echo #### Phase 2: [Name]
echo [Continue pattern...]
echo:
echo ### Risk Assessment
echo ^| Risk ^| Impact ^| Mitigation ^|
echo ^|---^|---^|---^|
echo ^| [Risk] ^| High/Med/Low ^| [Strategy] ^|
echo:
echo ### Success Metrics
echo - [Metric 1]: [Target]
echo - [Metric 2]: [Target]
) > "!PDIR!\task-breakdown.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at task-breakdown.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo [4/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Writing/Productivity Skills created!
timeout /t 2 /nobreak > nul
pause

:: ===================================================================
:: [5/6] PROMPTS
:: ===================================================================
echo:
echo [5/6] Creating Prompt Library...
echo [5/6] Starting Prompts >> "!LOGFILE!"

set "PROMPTS=!ROOT!\000 OS\AI\prompts"
echo PROMPTS dir: !PROMPTS! >> "!LOGFILE!"

echo Creating code-review.md...
(
echo # Code Review Prompt
echo:
echo Use this as a starting point for comprehensive code reviews.
echo:
echo ---
echo:
echo Please review this code as a senior engineer would:
echo:
echo ```[language]
echo [paste code]
echo ```
echo:
echo Focus on:
echo - Security vulnerabilities
echo - Performance issues
echo - Code maintainability
echo - Best practices
echo - Potential bugs
echo:
echo Provide:
echo 1. Critical issues (must fix)
echo 2. Important suggestions
echo 3. Minor improvements
echo 4. What was done well
) > "!PROMPTS!\code-review.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at code-review.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating brainstorm.md...
(
echo # Brainstorming Prompt
echo:
echo For generating creative ideas and solutions.
echo:
echo ---
echo:
echo Help me brainstorm ideas for: [TOPIC]
echo:
echo Context:
echo - Goal: [What you want to achieve]
echo - Constraints: [Limitations]
echo - Target: [Who it's for]
echo:
echo Please provide:
echo - 10 unique ideas ranging from safe to wild
echo - Pros and cons for each
echo - Implementation difficulty rating
echo - Your top 3 recommendations with rationale
) > "!PROMPTS!\brainstorm.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at brainstorm.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating research.md...
(
echo # Research Prompt
echo:
echo For gathering and synthesizing information on a topic.
echo:
echo ---
echo:
echo Research topic: [TOPIC]
echo:
echo Please provide:
echo:
echo 1. **Overview** (200 words)
echo    - What is it?
echo    - Why does it matter?
echo    - Current state
echo:
echo 2. **Key Concepts**
echo    - Core principles
echo    - Important terminology
echo    - Common misconceptions
echo:
echo 3. **Practical Applications**
echo    - Real-world use cases
echo    - Industry adoption
echo    - Success stories
echo:
echo 4. **Challenges ^& Considerations**
echo    - Common pitfalls
echo    - Trade-offs
echo    - Best practices
echo:
echo 5. **Resources**
echo    - Essential reading
echo    - Tools and frameworks
echo    - Communities
) > "!PROMPTS!\research.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at research.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating learning-plan.md...
(
echo # Learning Plan Prompt
echo:
echo For creating structured learning paths.
echo:
echo ---
echo:
echo I want to learn: [SKILL/TOPIC]
echo:
echo My context:
echo - Current level: [Beginner/Intermediate/Advanced]
echo - Time available: [Hours per week]
echo - Goal: [What you want to achieve]
echo - Learning style: [Visual/Hands-on/Reading/etc]
echo:
echo Please create a 30-60-90 day learning plan including:
echo:
echo 1. **Prerequisites** - What I should know first
echo 2. **Learning Path** - Ordered topics to study
echo 3. **Resources** - Books, courses, tutorials
echo 4. **Projects** - Hands-on practice exercises
echo 5. **Milestones** - How to measure progress
echo 6. **Time Estimates** - Expected hours per topic
) > "!PROMPTS!\learning-plan.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at learning-plan.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating decision-framework.md...
(
echo # Decision-Making Prompt
echo:
echo For analyzing complex decisions systematically.
echo:
echo ---
echo:
echo Decision to make: [DECISION]
echo:
echo Please help me analyze this using:
echo:
echo 1. **Context**
echo    - Current situation
echo    - Why this decision matters
echo    - Constraints and requirements
echo:
echo 2. **Options**
echo    - List all viable alternatives
echo    - Include "do nothing" option
echo:
echo 3. **Analysis Framework**
echo    For each option evaluate:
echo    - Pros and cons
echo    - Short-term vs long-term impact
echo    - Resources required
echo    - Risks and mitigation
echo    - Reversibility (can we undo it?)
echo:
echo 4. **Recommendation**
echo    - Recommended choice with rationale
echo    - Second-best alternative
echo    - Key factors driving the decision
echo    - Success metrics to track
) > "!PROMPTS!\decision-framework.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at decision-framework.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo [5/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Prompts created!
timeout /t 2 /nobreak > nul
pause


:: ===================================================================
:: [6/6] TEMPLATES & SAMPLES
:: ===================================================================
echo:
echo [6/6] Creating Templates ^& Sample Content...
echo [6/6] Starting Templates >> "!LOGFILE!"

set "TEMPLATES=!ROOT!\000 OS\Templates"
echo TEMPLATES dir: !TEMPLATES! >> "!LOGFILE!"

echo Creating Project Template.md...
(
echo ---
echo type: project
echo status: planning
echo start-date: 
echo end-date: 
echo owner: 
echo tags: []
echo ---
echo # {{title}}
echo:
echo ## Overview
echo Brief description of the project and its goals.
echo:
echo ## Objectives
echo - [ ] Objective 1
echo - [ ] Objective 2
echo - [ ] Objective 3
echo:
echo ## Scope
echo:
echo ### In Scope
echo - What's included
echo:
echo ### Out of Scope
echo - What's explicitly not included
echo:
echo ## Key Stakeholders
echo - **Project Owner:** 
echo - **Team Members:** 
echo - **Stakeholders:** 
echo:
echo ## Timeline
echo ^| Phase ^| Start ^| End ^| Status ^|
echo ^|----^|----^|----^|----^|
echo ^| Planning ^| ^| ^| In Progress ^|
echo ^| Execution ^| ^| ^| Not Started ^|
echo ^| Review ^| ^| ^| Not Started ^|
echo:
echo ## Success Criteria
echo 1. 
echo 2. 
echo 3. 
echo:
echo ## Resources
echo - **Documentation:** 
echo - **Tools:** 
echo - **Budget:** 
echo:
echo ## Risks
echo ^| Risk ^| Impact ^| Probability ^| Mitigation ^|
echo ^|---^|---^|---^|---^|
echo ^| ^| ^| ^| ^|
echo:
echo ## Notes
echo:
echo ## Related
echo - [[300 Entities/Areas/]]
echo - [[300 Entities/Goals/]]
) > "!TEMPLATES!\Project Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Project Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Meeting Template.md...
(
echo ---
echo type: meeting
echo date: {{date:YYYY-MM-DD}}
echo attendees: []
echo tags: [meeting]
echo ---
echo # {{title}}
echo:
echo **Date:** {{date:YYYY-MM-DD}}
echo **Time:** 
echo **Duration:** 
echo **Location/Link:** 
echo:
echo ## Attendees
echo - 
echo:
echo ## Agenda
echo 1. 
echo 2. 
echo 3. 
echo:
echo ## Discussion Notes
echo:
echo ### Topic 1
echo - 
echo:
echo ### Topic 2
echo - 
echo:
echo ## Decisions Made
echo 1. **Decision:** 
echo    - **Rationale:** 
echo    - **Owner:** 
echo:
echo ## Action Items
echo - [ ] **Task** - @owner - Due: {{date}}
echo - [ ] **Task** - @owner - Due: {{date}}
echo:
echo ## Parking Lot
echo Items to discuss later:
echo - 
echo:
echo ## Next Steps
echo - Next meeting: 
echo - Follow-up required: 
) > "!TEMPLATES!\Meeting Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Meeting Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Goal Template.md...
(
echo ---
echo type: goal
echo status: active
echo category: 
echo start-date: 
echo target-date: 
echo progress: 0
echo tags: [goal]
echo ---
echo # {{title}}
echo:
echo ## Vision
echo What does success look like?
echo:
echo ## Why This Matters
echo Personal or professional significance.
echo:
echo ## Success Metrics
echo - **Primary:** 
echo - **Secondary:** 
echo:
echo ## Action Plan
echo:
echo ### Phase 1: Foundation
echo - [ ] Step 1
echo - [ ] Step 2
echo:
echo ### Phase 2: Growth
echo - [ ] Step 3
echo - [ ] Step 4
echo:
echo ### Phase 3: Mastery
echo - [ ] Step 5
echo - [ ] Step 6
echo:
echo ## Resources Needed
echo - 
echo:
echo ## Obstacles ^& Solutions
echo ^| Obstacle ^| Solution ^|
echo ^|---^|---^|
echo ^| ^| ^|
echo:
echo ## Progress Log
echo:
echo ### {{date:YYYY-MM-DD}}
echo - 
echo:
echo ## Reflection
echo What am I learning?
echo:
echo ## Related
echo - [[300 Entities/Areas/]]
echo - [[300 Entities/Projects/]]
) > "!TEMPLATES!\Goal Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Goal Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Daily Template.md...
(
echo ---
echo type: daily
echo date: {{date:YYYY-MM-DD}}
echo tags: [daily]
echo ---
echo # {{date:YYYY-MM-DD}} - {{date:dddd}}
echo:
echo ## Top 3 Priorities
echo 1. 
echo 2. 
echo 3. 
echo:
echo ## Schedule
echo - 09:00 - 
echo - 10:00 - 
echo - 11:00 - 
echo:
echo ## Tasks
echo - [ ] 
echo - [ ] 
echo:
echo ## Notes
echo:
echo ## Ideas
echo:
echo ## Gratitude
echo - 
echo:
echo ## Daily Metrics
echo - Sleep: hrs
echo - Exercise: 
echo - Deep work: hrs
echo - Mood: /10
echo:
echo ## Links
echo - [[100 Periodics/Weekly/{{date:YYYY}}-W{{date:WW}}]]
) > "!TEMPLATES!\Daily Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Daily Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Person Template.md...
(
echo ---
echo type: person
echo category: 
echo company: 
echo role: 
echo tags: [person]
echo ---
echo # {{title}}
echo:
echo ## Overview
echo - **Role:** 
echo - **Company:** [[300 Entities/Companies/]]
echo - **Email:** 
echo - **LinkedIn:** 
echo:
echo ## Context
echo How we met and relationship context.
echo:
echo ## Interactions
echo:
echo ### {{date:YYYY-MM-DD}}
echo - 
echo:
echo ## Interests ^& Background
echo - 
echo:
echo ## Projects Together
echo - [[300 Entities/Projects/]]
echo:
echo ## Notes
echo Key information to remember.
) > "!TEMPLATES!\Person Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Person Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating Area Template.md...
(
echo ---
echo type: area
echo status: active
echo tags: [area]
echo ---
echo # {{title}}
echo:
echo ## Definition
echo What this area of life encompasses.
echo:
echo ## Current State
echo Where things stand today.
echo:
echo ## Vision
echo Where I want this area to be.
echo:
echo ## Active Projects
echo - [[300 Entities/Projects/]]
echo:
echo ## Active Goals
echo - [[300 Entities/Goals/]]
echo:
echo ## Standards ^& Routines
echo What "good" looks like in this area:
echo - 
echo:
echo ## Resources
echo - 
echo:
echo ## Review Notes
echo:
echo ### {{date:YYYY-MM-DD}}
echo - 
) > "!TEMPLATES!\Area Template.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Area Template.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating sample entity Career.md...
(
echo ---
echo type: area
echo status: active
echo tags: [area, career]
echo ---
echo # Career
echo:
echo ## Definition
echo My professional development and work life.
echo:
echo ## Current State
echo Building skills in software engineering and AI.
echo:
echo ## Vision
echo Become a recognized expert in my field, contribute to meaningful projects, and mentor others.
echo:
echo ## Active Projects
echo - [[300 Entities/Projects/Coding/ExampleProject]]
echo:
echo ## Active Goals
echo - [[300 Entities/Goals/Improve Coding Skills]]
echo:
echo ## Standards
echo - Ship quality code daily
echo - Learn one new thing per week
echo - Share knowledge with team
echo:
echo ## Resources
echo - [[400 Resources/Books/The Pragmatic Programmer]]
) > "!ROOT!\300 Entities\Areas\Career.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Career.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating sample entity Health.md...
(
echo ---
echo type: area
echo status: active
echo tags: [area, health]
echo ---
echo # Health
echo:
echo ## Definition
echo Physical and mental wellbeing.
echo:
echo ## Current State
echo Maintaining regular exercise routine.
echo:
echo ## Vision
echo Sustainable energy, strength, and mental clarity.
echo:
echo ## Standards
echo - Exercise 4x per week
echo - 7-8 hours sleep
echo - Healthy meal prep
) > "!ROOT!\300 Entities\Areas\Health.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Health.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo Creating sample entity Learning.md...
(
echo ---
echo type: area
echo status: active
echo tags: [area, learning]
echo ---
echo # Learning
echo:
echo ## Definition
echo Continuous skill development and knowledge acquisition.
echo:
echo ## Current State
echo Focused on TypeScript and system design.
echo:
echo ## Vision
echo Master full-stack development and contribute to open source.
echo:
echo ## Active Goals
echo - [[300 Entities/Goals/Learn System Design]]
echo:
echo ## Resources
echo - [[400 Resources/Books/System Design]]
) > "!ROOT!\300 Entities\Areas\Learning.md" 2>> "!LOGFILE!"
if errorlevel 1 (
    echo CRASH at Learning.md! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo [6/6] Complete! >> "!LOGFILE!"
echo [DEBUG] Templates and Sample Content created!

:: ADD THIS TO DEBUG - change timeout to pause so you can see the error
echo.
echo PAUSING BEFORE SCRIPTS SECTION - Press any key to continue to Scripts...
pause > nul

:: ===================================================================
:: SCRIPTS SECTION
:: ===================================================================
echo:
echo Creating automation scripts...
echo Starting Scripts Section >> "!LOGFILE!"

:: Check if we even get here
echo DEBUG: About to set SCRIPTS_DIR...
echo SCRIPTS_DIR debug >> "!LOGFILE!"

set "SCRIPTS_DIR=!ROOT!\000 OS\AI\scripts"
echo DEBUG: SCRIPTS_DIR = !SCRIPTS_DIR!
echo SCRIPTS_DIR: !SCRIPTS_DIR! >> "!LOGFILE!"

:: CRITICAL: Create folder first!
if not exist "!SCRIPTS_DIR!" (
    echo DEBUG: Creating scripts folder...
    mkdir "!SCRIPTS_DIR!" 2>> "!LOGFILE!"
    if errorlevel 1 (
        echo CRASH: Cannot create folder !SCRIPTS_DIR!
        pause
        exit /b 1
    )
)

echo DEBUG: About to create project-config.json...
pause

:: ENSURE FOLDER EXISTS (Do this right before writing!)
if not exist "!SCRIPTS_DIR!" (
    echo Creating missing scripts folder...
    mkdir "!SCRIPTS_DIR!" 2>> "!LOGFILE!"
)

echo Creating project-config.json...

:: Use single line writes instead of () blocks to avoid syntax errors
echo { > "!SCRIPTS_DIR!\project-config.json"
echo   "projects": [ >> "!SCRIPTS_DIR!\project-config.json"
echo     { >> "!SCRIPTS_DIR!\project-config.json"
echo       "name": "ExampleProject", >> "!SCRIPTS_DIR!\project-config.json"
echo       "path": "C:\\Path\\To\\Your\\Project", >> "!SCRIPTS_DIR!\project-config.json"
echo       "files_to_sync": ["README.md", "PRD.md", "CHANGELOG.md"], >> "!SCRIPTS_DIR!\project-config.json"
echo       "language": "TypeScript", >> "!SCRIPTS_DIR!\project-config.json"
echo       "framework": "Next.js", >> "!SCRIPTS_DIR!\project-config.json"
echo       "status": "active", >> "!SCRIPTS_DIR!\project-config.json"
echo       "description": "Example project to demonstrate sync" >> "!SCRIPTS_DIR!\project-config.json"
echo     } >> "!SCRIPTS_DIR!\project-config.json"
echo   ], >> "!SCRIPTS_DIR!\project-config.json"
echo   "sync_settings": { >> "!SCRIPTS_DIR!\project-config.json"
echo     "auto_create_notes": true, >> "!SCRIPTS_DIR!\project-config.json"
echo     "preserve_local_changes": true, >> "!SCRIPTS_DIR!\project-config.json"
echo     "conflict_resolution": "keep_newer" >> "!SCRIPTS_DIR!\project-config.json"
echo   } >> "!SCRIPTS_DIR!\project-config.json"
echo } >> "!SCRIPTS_DIR!\project-config.json"

if errorlevel 1 (
    echo CRASH at project-config.json! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo project-config.json created successfully!
pause

echo Creating sync-projects.ts...
echo // sync-projects.ts - Enhanced project sync > "!SCRIPTS_DIR!\sync-projects.ts"
echo import { existsSync, mkdirSync, readFileSync, writeFileSync, copyFileSync, statSync } from 'node:fs'; >> "!SCRIPTS_DIR!\sync-projects.ts"
echo import { join, dirname } from 'node:path'; >> "!SCRIPTS_DIR!\sync-projects.ts"
echo import { fileURLToPath } from 'node:url'; >> "!SCRIPTS_DIR!\sync-projects.ts"
echo: >> "!SCRIPTS_DIR!\sync-projects.ts"
echo const __dirname = dirname(fileURLToPath(import.meta.url)); >> "!SCRIPTS_DIR!\sync-projects.ts"
echo const VAULT = join(__dirname, '../../../'); >> "!SCRIPTS_DIR!\sync-projects.ts"
echo const configPath = join(__dirname, 'project-config.json'); >> "!SCRIPTS_DIR!\sync-projects.ts"
echo: >> "!SCRIPTS_DIR!\sync-projects.ts"
echo function formatDate(date: Date): string { >> "!SCRIPTS_DIR!\sync-projects.ts"
echo   return date.toISOString().split('T')[0]; >> "!SCRIPTS_DIR!\sync-projects.ts"
echo } >> "!SCRIPTS_DIR!\sync-projects.ts"

if errorlevel 1 (
    echo CRASH at sync-projects.ts! >> "!LOGFILE!"
    pause
    exit /b 1
)

echo setup-week.ts...
echo import { existsSync, mkdirSync, writeFileSync } from 'node:fs'; > "!SCRIPTS_DIR!\setup-week.ts"
echo import { join, dirname } from 'node:path'; >> "!SCRIPTS_DIR!\setup-week.ts"
echo const __dirname = dirname(fileURLToPath(import.meta.url)); >> "!SCRIPTS_DIR!\setup-projects.ts"

echo generate-coding-summaries.ts...
echo console.log('Summary generator'); > "!SCRIPTS_DIR!\generate-coding-summaries.ts"

echo Creating runner batch files...
echo @echo off > "!SCRIPTS_DIR!\RUN-sync-projects.bat"
echo cd /d "%%~dp0" >> "!SCRIPTS_DIR!\RUN-sync-projects.bat"
echo bun run sync-projects.ts >> "!SCRIPTS_DIR!\RUN-sync-projects.bat"
echo pause >> "!SCRIPTS_DIR!\RUN-sync-projects.bat"

echo @echo off > "!SCRIPTS_DIR!\RUN-setup-week.bat"
echo cd /d "%%~dp0" >> "!SCRIPTS_DIR!\RUN-setup-week.bat"  
echo bun run setup-week.ts >> "!SCRIPTS_DIR!\RUN-setup-week.bat"
echo pause >> "!SCRIPTS_DIR!\RUN-setup-week.bat"

echo @echo off > "!SCRIPTS_DIR!\RUN-generate-summaries.bat"
echo cd /d "%%~dp0" >> "!SCRIPTS_DIR!\RUN-generate-summaries.bat"
echo bun run generate-coding-summaries.ts >> "!SCRIPTS_DIR!\RUN-generate-summaries.bat"
echo pause >> "!SCRIPTS_DIR!\RUN-generate-summaries.bat"

echo Scripts section complete >> "!LOGFILE!"


:: ===================================================================
:: FINAL SUMMARY
:: ===================================================================
echo:
echo =========================================
echo COMPREHENSIVE VAULT SETUP COMPLETE!
echo =========================================
echo:
echo Location: !ROOT!
echo Log file: !LOGFILE!
echo:
echo [FINISHED SUCCESSFULLY] >> "!LOGFILE!"
echo Timestamp: %date% %time% >> "!LOGFILE!"

echo Press any key to close...
pause > nul
endlocal