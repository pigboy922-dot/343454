@echo off
cd /d "%~dp0"
if exist "state\v1046_paper_positions.csv" del /q "state\v1046_paper_positions.csv"
if exist "state\v1046_paper_closed_trades.csv" del /q "state\v1046_paper_closed_trades.csv"
if exist "state\v1046_daily_signal_ledger.csv" del /q "state\v1046_daily_signal_ledger.csv"
if exist "state\v1046_guard_state.json" del /q "state\v1046_guard_state.json"
echo V1046 paper state reset done.
pause
