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

:: Set the service name
set SRVCNAME=zapret

:: Stop and delete zapret service
echo Stopping service "%SRVCNAME%"...
net stop "%SRVCNAME%" >nul 2>&1
if errorlevel 1 (
    echo Service "%SRVCNAME%" is not running or does not exist.
) else (
    echo Service "%SRVCNAME%" stopped successfully.
)
echo Deleting service "%SRVCNAME%"...
sc delete "%SRVCNAME%" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "%SRVCNAME%". It may not exist.
) else (
    echo Service "%SRVCNAME%" deleted successfully.
)

:: Stop and delete WinDivert service
echo Stopping service "WinDivert"...
net stop "WinDivert" >nul 2>&1
if errorlevel 1 (
    echo Service "WinDivert" is not running or does not exist.
) else (
    echo Service "WinDivert" stopped successfully.
)
echo Deleting service "WinDivert"...
sc delete "WinDivert" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "WinDivert". It may not exist.
) else (
    echo Service "WinDivert" deleted successfully.
)

:: Stop and delete WinDivert14 service
echo Stopping service "WinDivert14"...
net stop "WinDivert14" >nul 2>&1
if errorlevel 1 (
    echo Service "WinDivert14" is not running or does not exist.
) else (
    echo Service "WinDivert14" stopped successfully.
)
echo Deleting service "WinDivert14"...
sc delete "WinDivert14" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "WinDivert14". It may not exist.
) else (
    echo Service "WinDivert14" deleted successfully.
)

pause
