@echo off
chcp 65001 >nul
:: 65001 - UTF-8

:: Admin rights check
echo Данный файл должен быть запущен с правами администратора: ПКМ → Запустить от имени администратора.
echo Нажмите любую клавишу, чтобы продолжить создание сервиса.
pause

set SRVCNAME=zapret

net stop %SRVCNAME%
sc delete %SRVCNAME%

net stop "WinDivert"
sc delete "WinDivert"
net stop "WinDivert14"
sc delete "WinDivert14"

pause