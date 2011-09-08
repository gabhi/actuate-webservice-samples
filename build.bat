@if "%HOSTNAME%" == "" set HOSTNAME=localhost
@if "%PORT%" == "" set PORT=8000
@if not "%1" == "" set HOSTNAME=%1
@if not "%2" == "" set PORT=%2
mkdir build
call setClassPath.bat
ant compile -DhostName=%HOSTNAME% -Dport=%PORT%