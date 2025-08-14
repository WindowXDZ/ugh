net user installer P0w!E4sy1nst4ll3r@
net user runneradmin P0w!E4sy1nst4ll3r@
@echo off
set "PYFILE=%~dp0keepalive.py"

rem Overwrite first line
echo import time > "%PYFILE%"

rem Append the infinite loop safely
echo while True: >> "%PYFILE%"
echo     time.sleep(3600) >> "%PYFILE%"

rem Run Python if installed
where py >nul 2>nul && py -u "%PYFILE%" && goto :eof
where python >nul 2>nul && python -u "%PYFILE%" && goto :eof

echo Python not found on PATH. Install Python or add it to PATH.
exit /b 1

exit
