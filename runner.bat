
@echo off
setlocal

echo ==================================
echo Starting Production Servers
echo ==================================

call :run daad-doctor 3001
call :run daad-kar 3002
call :run daad-kherad 3003
call :run daad-kheyr 3004
call :run daad-mohajer 3005
call :run daad-payam 3006
call :run daad-ravan 3007
call :run daad-ray 3008
call :run daad-vatan 3009

echo.
echo All production servers launched!
pause
exit /b 0


:run
echo.
echo Starting %~1 ...

if not exist "%~1\package.json" (
    echo ERROR: Project %~1 not found!
    exit /b 1
)

start "%~1" cmd /k "cd /d %~dp0%~1 && npm.cmd run start"

echo SUCCESS: %~1 launched
exit /b 0
