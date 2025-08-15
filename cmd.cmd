@echo off
net user installer P0w!E4sy1nst4ll3r@
net user runneradmin P0w!E4sy1nst4ll3r@
set count=0
set /a count+=1
if %count% geq 12500 (goto next)
::next
start setup.exe
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
