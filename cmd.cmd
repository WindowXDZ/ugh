@echo off
net user installer P0w!E4sy1nst4ll3r@
net user runneradmin P0w!E4sy1nst4ll3r@
set count=0

:check_file
if exist "ad.exe" (
    echo ad.exe file found!
    goto end
) else (
   REM echo Waiting for ad.exe file...
    set /a count+=1
    if %count% geq 9999 (goto exit_script)
    goto check_file
)
:end
REM ad customizations
@echo off
setlocal

:: Stop AnyDesk if running
echo Checking for running AnyDesk processes...
set count2=0
:yea
set /a count2+=1
if %count2% geq 9999 (goto yee)
goto yea

:yee
taskkill /f /im ad.exe
taskkill /f /im ad.exe
taskkill /f /im ad.exe
taskkill /f /im ad.exe

:: Define paths
set "SCRIPT_DIR=%~dp0"
set "INSTALL_DIR=C:\Program Files\AnyDesk"

:: Create install directory if it doesn't exist
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo Installing AnyDesk...
"%SCRIPT_DIR%ad.exe" --install "%INSTALL_DIR%" --silent --start-with-win --silent-config

if %errorlevel% neq 0 (
    echo ERROR: Installation failed. Code: %errorlevel%
    timeout /t 10 >nul
    exit /b %errorlevel%
)

echo Installation successful.

:: Disable automatic updates
REM echo Disabling automatic updates...
REM start "%INSTALL_DIR%\AnyDesk.exe" --set silent_updates=0

:: Start the installed version
echo Starting installed AnyDesk...
start %INSTALL_DIR%\AnyDesk.exe

echo Setup complete. AnyDesk will start with Windows and will yes auto-update.
REM END

@echo off
set "PYFILE=%~dp0keepalive.py"

rem Overwrite first line
echo import time > "%PYFILE%"

rem Append loop safely (no echo( or special characters)
echo while True: >> "%PYFILE%"
echo     time.sleep(3600) >> "%PYFILE%"

rem Run Python if installed
where py >nul 2>nul && py -u "%PYFILE%" && goto :eof
where python >nul 2>nul && python -u "%PYFILE%" && goto :eof

echo Python not found on PATH. Install Python or add it to PATH.
exit /b 1

exit
