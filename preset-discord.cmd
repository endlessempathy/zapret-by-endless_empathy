@echo off
chcp 65001 >nul
:: 65001 - UTF-8

cd /d "%~dp0"

:: Set the BIN variable to the path of the bin directory
set BIN=%~dp0bin\

:: Define arguments for the winws.exe tool
start "zapret: discord" /min "%BIN%winws.exe" ^
--wf-tcp=443 --wf-udp=443,50000-50100 ^
--filter-tcp=443 --hostlist="hostlists\list-discord.txt" --dpi-desync=fake,multisplit --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-fooling=badseq --dpi-desync-split-pos=1 --dpi-desync-split-pos=sld+1 --new ^
--filter-udp=50000-50100 --ipset="hostlists\ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-fake-unknown-udp=0x00 --dpi-desync-cutoff=d2
