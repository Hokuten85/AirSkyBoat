@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting WORLD Server...
REM xi_world.exe --log "Z:\FFIvalice\Process Logs\world_%mydate%.log"
REM xi_world.exe
echo Server was stopped or crashed!
GOTO onCrash