@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting GAME Server...
xi_map.exe --log "Z:\FFIvalice\Process Logs\Main_Map_%mydate%.log"
REM xi_map.exe
echo Server was stopped or crashed!
GOTO onCrash