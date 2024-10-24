@echo off
chcp 65001 >nul
:: 65001 - UTF-8

cd /d "%~dp0"

set BIN=%~dp0bin\

start "zapret: discord" /min "%BIN%winws.exe" ^
--wf-tcp=443 --wf-udp=443,50000-50100 ^
--filter-tcp=443 --hostlist="list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=50000-50100 --ipset="ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=n2