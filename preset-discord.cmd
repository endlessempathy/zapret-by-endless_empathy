@echo off
chcp 65001 >nul
:: 65001 - UTF-8

cd /d "%~dp0"

:: Set the BIN variable to the path of the bin directory
set BIN=%~dp0bin\

:: Define arguments for the winws.exe tool
start "zapret: discord" /min "%BIN%winws.exe" ^
--wf-tcp=443 --wf-udp=443,50000-50100 ^
--filter-tcp=443 --hostlist="hostlists\list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=md5sig --dpi-desync-ttl=4 --new ^
--filter-udp=50000-50100 --ipset="hostlists\ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=n2
