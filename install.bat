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
set "VERCEL_DOMAIN=https://sysbeacon.vercel.app"
set "APP_NAME=SysBeacon"
set "EXE_NAME=SysBeacon.exe"
set "TARGET_DIR=C:\Program Files\%APP_NAME%"
set "TARGET_EXE=%TARGET_DIR%\%EXE_NAME%"
set "TASK_NAME=SysBeaconServer"
set "DOWNLOAD_URL=%VERCEL_DOMAIN%/%EXE_NAME%"
set "TEMP_EXE=%TEMP%\%EXE_NAME%"

echo ===================================================
echo           %APP_NAME% Automated Setup
echo ===================================================

:: Ensure target installation directory exists
if not exist "%TARGET_DIR%" (
    echo Creating application directory...
    mkdir "%TARGET_DIR%"
)

:: Download executable with legacy Windows fallback support
echo Downloading %EXE_NAME% from server...

where curl >nul 2>&1
if %errorLevel% eq 0 (
    curl -sSL "%DOWNLOAD_URL%" -o "%TEMP_EXE%"
) else (
    where certutil >nul 2>&1
    if !errorLevel! eq 0 (
        certutil -urlcache -split -f "%DOWNLOAD_URL%" "%TEMP_EXE%" >nul
    ) else (
        powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%TEMP_EXE%')"
    )
)

if not exist "%TEMP_EXE%" (
    echo [ERROR] Download failed. Please check your network connection.
    pause
    exit /b
)

:: Copy downloaded executable to target path
echo Installing application binary...
copy /Y "%TEMP_EXE%" "%TARGET_EXE%" >nul
del /F /Q "%TEMP_EXE%" >nul 2>&1

if %errorLevel% neq 0 (
    echo [ERROR] Failed to install binary to target path.
    pause
    exit /b
)

:: Remove existing scheduled task if present
schtasks /delete /tn "%TASK_NAME%" /f >nul 2>&1

:: Create scheduled task running under active logon with standard user context
echo Configuring Windows Task Scheduler startup entry...
schtasks /create /tn "%TASK_NAME%" /tr "\"%TARGET_EXE%\"" /sc onlogon /rl highest /f >nul

if %errorLevel% eq 0 (
    echo.
    echo [SUCCESS] %APP_NAME% successfully installed!
    echo Application configured to start automatically on user logon.
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
        echo Installation complete. Restart manually later to initialize the background service.
        pause
    ) else (
        echo Invalid input. Enter Y or N.
        goto PROMPT_RESTART
    )
) else (
    echo [ERROR] Failed to create Task Scheduler entry.
    pause
)