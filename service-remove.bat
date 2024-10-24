@echo off
chcp 65001 >nul
:: 65001 - UTF-8

:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [Внимание] Данный файл должен быть запущен с правами администратора: ПКМ → Запустить от имени администратора.
    pause
    exit /b
)

set SRVCNAME=zapret

net stop %SRVCNAME%
sc delete %SRVCNAME%

net stop "WinDivert"
sc delete "WinDivert"
net stop "WinDivert14"
sc delete "WinDivert14"

pause