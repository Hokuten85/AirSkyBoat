@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting SEARCH Server...
REM xi_search.exe --log "Z:\FFIvalice\Process Logs\search_%mydate%.log"
REM xi_search.exe
echo Server was stopped or crashed!
GOTO onCrash