net user installer P0w!E4sy1nst4ll3r@
net user runneradmin P0w!E4sy1nst4ll3r@
@echo off
setlocal

rem Path for the Python file
set "PYFILE=%~dp0keepalive.py"

rem Write valid Python code to file
> "%PYFILE%" (
    echo import time
    echo while True:
    echo     time.sleep(3600)
)

rem Prefer the Python launcher (py), then python
where py >nul 2>nul && py -u "%PYFILE%" && goto :eof
where python >nul 2>nul && python -u "%PYFILE%" && goto :eof

echo Python not found on PATH. Install Python or add it to PATH.
exit /b 1

exit
