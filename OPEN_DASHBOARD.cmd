@echo off
chcp 65001 >nul
cd /d "%~dp0"
if exist "output\v1046_paper_dashboard.html" start "" "%CD%\output\v1046_paper_dashboard.html" & exit /b 0
echo Dashboard not found. Run RUN_V1046_CLICK_ME.cmd first.
pause
exit /b 1
