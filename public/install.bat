@echo off
setlocal enabledelayedexpansion

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:: Set Configuration Variables
set "APP_NAME=SysBeacon"
set "EXE_NAME=SysBeacon.exe"
set "TARGET_DIR=%ProgramFiles%\%APP_NAME%"
set "TARGET_EXE=%TARGET_DIR%\%EXE_NAME%"
set "TASK_NAME=SysBeaconServer"
set "LOCAL_EXE=%~dp0%EXE_NAME%"

echo ===================================================
echo           %APP_NAME% Local Setup
echo ===================================================

:: Check if local executable exists in the current script folder
if not exist "%LOCAL_EXE%" (
    echo [ERROR] %EXE_NAME% was not found in the script directory.
    echo Please place this script in the same folder as %EXE_NAME%.
    pause
    exit /b
)

:: Ensure target installation directory exists
if not exist "%TARGET_DIR%" (
    echo Creating application directory at %TARGET_DIR%...
    mkdir "%TARGET_DIR%"
)

:: Copy local executable to Program Files
echo Installing binary to %TARGET_EXE%...
copy /Y "%LOCAL_EXE%" "%TARGET_EXE%" >nul

if %errorLevel% neq 0 (
    echo [ERROR] Failed to copy binary to target directory.
    pause
    exit /b
)

:: Remove existing scheduled task if present
schtasks /delete /tn "%TASK_NAME%" /f >nul 2>&1

:: Create scheduled task running at user logon with highest privileges
echo Configuring Task Scheduler...
schtasks /create /tn "%TASK_NAME%" /tr "\"%TARGET_EXE%\"" /sc onlogon /rl highest /f >nul

if %errorLevel% eq 0 (
    echo.
    echo [SUCCESS] %APP_NAME% successfully installed!
    echo Application binary installed to: %TARGET_EXE%
    echo Scheduled task configured to launch on logon.
    echo.

    :PROMPT_RESTART
    set /p "RESTART_CHOICE=Do you want to restart your computer now? (Y/N): "
    if /i "!RESTART_CHOICE!"=="Y" (
        echo.
        echo System will restart in 30 seconds...
        shutdown /r /t 30 /c "%APP_NAME% setup complete. System restarting."
        pause
    ) else if /i "!RESTART_CHOICE!"=="N" (
        echo.
        echo Installation complete. Task will run on next system reboot or logon.
        pause
    ) else (
        echo Invalid choice. Please enter Y or N.
        goto PROMPT_RESTART
    )
) else (
    echo [ERROR] Failed to configure Scheduled Task.
    pause
)