@echo off
chcp 65001 >nul
setlocal EnableExtensions
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8
cd /d "%~dp0"
cls
echo ==========================================
echo V1046 OFFICIAL DAILY - VISIBLE FIX
echo TW: MSTOP_06_LOSS2_CD5
echo US: BIGLOSS_08_CD5
echo Folder: %CD%
echo ==========================================
echo.
if not exist "v1046_cloud_daily_risk_guard.py" (
  echo [ERROR] Missing v1046_cloud_daily_risk_guard.py
  pause
  exit /b 1
)
if not exist "output" mkdir "output"
if not exist "logs" mkdir "logs"
where py >nul 2>nul
if %ERRORLEVEL%==0 (
  py -3 v1046_cloud_daily_risk_guard.py
) else (
  python v1046_cloud_daily_risk_guard.py
)
set RUNERR=%ERRORLEVEL%
echo.
echo ========== TODAY RECOMMENDATION ==========
if exist "output\v1046_today_recommendations_SIMPLE.csv" (
  type "output\v1046_today_recommendations_SIMPLE.csv"
) else (
  echo [NO FILE] output\v1046_today_recommendations_SIMPLE.csv
)
echo.
echo ========== NO REC / FILTER INFO ==========
if exist "output\v1046_no_recommendation_reason.txt" type "output\v1046_no_recommendation_reason.txt"
echo.
if exist "output\v1046_paper_dashboard.html" (
  start "" "%CD%\output\v1046_paper_dashboard.html"
  echo [OK] Opened dashboard.
) else (
  echo [ERROR] Dashboard not created.
)
echo.
echo If today recommendation is empty, open dashboard - Health Check.
echo It will show exact reasons: risk block / max positions / filter count / guard block.
pause
exit /b %RUNERR%
