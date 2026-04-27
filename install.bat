@echo off
setlocal enabledelayedexpansion

rem ============================================================
rem  kigumi installer
rem  Usage: drag any project folder onto this script
rem         OR run it from inside a project folder
rem         OR run it and type the path when prompted
rem ============================================================

set KIGUMI_DIR=%~dp0
rem Remove trailing backslash
if "%KIGUMI_DIR:~-1%"=="\" set KIGUMI_DIR=%KIGUMI_DIR:~0,-1%

cls
echo.
echo  ██╗  ██╗██╗ ██████╗ ██╗   ██╗███╗   ███╗██╗
echo  ██║ ██╔╝██║██╔════╝ ██║   ██║████╗ ████║██║
echo  █████╔╝ ██║██║  ███╗██║   ██║██╔████╔██║██║
echo  ██╔═██╗ ██║██║   ██║██║   ██║██║╚██╔╝██║██║
echo  ██║  ██╗██║╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██║
echo  ╚═╝  ╚═╝╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝
echo.
echo  agent stack installer
echo  --------------------------------------------------------
echo.

rem --- Determine target project folder ---

rem If a folder was dragged onto the script, use it
if not "%~1"=="" (
    set TARGET=%~1
    goto CHECK_TARGET
)

rem If the script is NOT being run from its own folder, use current folder
if /I not "%CD%"=="%KIGUMI_DIR%" (
    set TARGET=%CD%
    goto CHECK_TARGET
)

rem Otherwise ask the user
echo  Where do you want to install kigumi?
echo  (paste a full path, or press Enter to use current folder)
echo.
set /p TARGET=  Path: 
if "%TARGET%"=="" set TARGET=%CD%

:CHECK_TARGET
rem Clean up trailing backslash
if "%TARGET:~-1%"=="\" set TARGET=%TARGET:~0,-1%

rem Sanity check — don't install into kigumi itself
if /I "%TARGET%"=="%KIGUMI_DIR%" (
    echo.
    echo  [ERROR] Cannot install kigumi into itself.
    echo  Run this script from your project folder, or drag your project onto it.
    echo.
    pause
    exit /b 1
)

rem Check target exists
if not exist "%TARGET%" (
    echo.
    echo  [ERROR] Folder not found: %TARGET%
    echo.
    pause
    exit /b 1
)

echo.
echo  Target project: %TARGET%
echo.

rem --- Check what already exists and warn ---

set CONFLICTS=0
if exist "%TARGET%\AGENTS.md"     set /a CONFLICTS+=1
if exist "%TARGET%\.cursorrules"  set /a CONFLICTS+=1
if exist "%TARGET%\CLAUDE.md"     set /a CONFLICTS+=1
if exist "%TARGET%\skills\kigumi" set /a CONFLICTS+=1

if %CONFLICTS% GTR 0 (
    echo  [WARNING] Some kigumi files already exist in this project.
    echo.
    choice /C YN /M "  Overwrite existing files?"
    if errorlevel 2 (
        echo.
        echo  Cancelled. No files were changed.
        echo.
        pause
        exit /b 0
    )
)

echo.
echo  Installing...
echo.

rem --- Copy skill files ---

if not exist "%TARGET%\skills" mkdir "%TARGET%\skills"

for %%S in (kigumi build-discipline wiki-workflow research-loop github-workflow versioning) do (
    if not exist "%TARGET%\skills\%%S" mkdir "%TARGET%\skills\%%S"
    copy /Y "%KIGUMI_DIR%\skills\%%S\SKILL.md" "%TARGET%\skills\%%S\SKILL.md" >nul
    echo  [OK] skills/%%S/SKILL.md
)

rem --- Copy bootstrap files ---

copy /Y "%KIGUMI_DIR%\AGENTS.md"    "%TARGET%\AGENTS.md"    >nul && echo  [OK] AGENTS.md
copy /Y "%KIGUMI_DIR%\CLAUDE.md"    "%TARGET%\CLAUDE.md"    >nul && echo  [OK] CLAUDE.md
copy /Y "%KIGUMI_DIR%\GEMINI.md"    "%TARGET%\GEMINI.md"    >nul && echo  [OK] GEMINI.md
copy /Y "%KIGUMI_DIR%\.cursorrules" "%TARGET%\.cursorrules" >nul && echo  [OK] .cursorrules

rem --- Copy program.md only if it doesn't exist (don't overwrite user's research directions) ---

if not exist "%TARGET%\program.md" (
    copy /Y "%KIGUMI_DIR%\program.md" "%TARGET%\program.md" >nul
    echo  [OK] program.md (template)
) else (
    echo  [SKIP] program.md already exists - keeping yours
)

rem --- Create wiki folder and starters ---

if not exist "%TARGET%\wiki" mkdir "%TARGET%\wiki"
if not exist "%TARGET%\wiki\index.md" (
    copy /Y "%KIGUMI_DIR%\wiki\index.md" "%TARGET%\wiki\index.md" >nul
    echo  [OK] wiki/index.md
) else (
    echo  [SKIP] wiki/index.md already exists - keeping yours
)
if not exist "%TARGET%\wiki\log.md" (
    copy /Y "%KIGUMI_DIR%\wiki\log.md" "%TARGET%\wiki\log.md" >nul
    echo  [OK] wiki/log.md
) else (
    echo  [SKIP] wiki/log.md already exists - keeping yours
)

rem --- Create raw folder ---

if not exist "%TARGET%\raw" (
    mkdir "%TARGET%\raw"
    echo  [OK] raw/ (folder created)
) else (
    echo  [SKIP] raw/ already exists - keeping yours
)

rem --- Create results folder and starters ---

if not exist "%TARGET%\results" mkdir "%TARGET%\results"
if not exist "%TARGET%\results\baseline.md" (
    copy /Y "%KIGUMI_DIR%\results\baseline.md" "%TARGET%\results\baseline.md" >nul
    echo  [OK] results/baseline.md
) else (
    echo  [SKIP] results/baseline.md already exists - keeping yours
)
if not exist "%TARGET%\results\log.md" (
    copy /Y "%KIGUMI_DIR%\results\log.md" "%TARGET%\results\log.md" >nul
    echo  [OK] results/log.md
) else (
    echo  [SKIP] results/log.md already exists - keeping yours
)

rem --- Done ---

echo.
echo  --------------------------------------------------------
echo  kigumi installed into:
echo  %TARGET%
echo.
echo  Next steps:
echo    1. Open the project in your agent tool
echo    2. The agent will read its config file automatically
echo    3. For web tools (AI Studio, Lovable) paste AGENTS.md
echo       + the four SKILL.md files as your system prompt
echo    4. Fill in program.md when you want the research loop
echo  --------------------------------------------------------
echo.
pause
