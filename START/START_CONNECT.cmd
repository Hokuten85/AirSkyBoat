@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting CONNECT Server...
xi_connect.exe --log "Z:\FFIvalice\Process Logs\connect_%mydate%.log"
REM xi_connect.exe
echo Server was stopped or crashed!
GOTO onCrash