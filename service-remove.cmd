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

:: Stop the service if it is running
echo Stopping service "%SRVCNAME%"...
net stop "%SRVCNAME%" >nul 2>&1
if errorlevel 1 (
    echo Service "%SRVCNAME%" is not running or does not exist.
)

:: Delete the service
echo Deleting service "%SRVCNAME%"...
sc delete "%SRVCNAME%" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "%SRVCNAME%". It may not exist.
)

:: Stop WinDivert if it is running
echo Stopping service "%SRVCNAME%"...
net stop "WinDivert" >nul 2>&1
if errorlevel 1 (
    echo Service "%SRVCNAME%" is not running or does not exist.
)

:: Delete WinDivert
echo Deleting service "%SRVCNAME%"...
sc delete "WinDivert" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "%SRVCNAME%". It may not exist.
)

:: Stop WinDivert14 if it is running
echo Stopping service "%SRVCNAME%"...
net stop "WinDivert14" >nul 2>&1
if errorlevel 1 (
    echo Service "%SRVCNAME%" is not running or does not exist.
)

:: Delete WinDivert14
echo Deleting service "%SRVCNAME%"...
sc delete "WinDivert14" >nul 2>&1
if errorlevel 1 (
    echo Failed to delete service "%SRVCNAME%". It may not exist.
)

pause