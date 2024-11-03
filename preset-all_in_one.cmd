@echo off
chcp 65001 >nul
:: 65001 - UTF-8

cd /d "%~dp0"

:: Set the BIN variable to the path of the bin directory
set BIN=%~dp0bin\

:: Define arguments for the winws.exe tool
start "zapret: all in one" /min "%BIN%winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-50100 ^
--filter-udp=443 --hostlist="hostlists\list-youtube_quic.txt" --dpi-desync=fake --dpi-desync-repeats=2 --dpi-desync-cutoff=n2 --dpi-desync-fake-quic="%BIN%quic_pl_by_ori.bin" --new ^
--filter-tcp=443 --hostlist="hostlists\list-youtube_gv.txt" --dpi-desync=split --dpi-desync-split-pos=1 --dpi-desync-fooling=badseq --dpi-desync-repeats=10 --dpi-desync-ttl=4 --new ^
--filter-tcp=443 --hostlist="hostlists\list-youtube.txt" --dpi-desync=fake,split2 --dpi-desync-split-seqovl=2 --dpi-desync-split-pos=3 --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-ttl=4 --new ^
--filter-tcp=80 --hostlist="hostlists\list-russia_blacklist.txt" --hostlist="hostlists\list-custom.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=md5sig --dpi-desync-ttl=4 --new ^
--filter-tcp=443 --hostlist="hostlists\list-russia_blacklist.txt" --hostlist="hostlists\list-custom.txt" --dpi-desync=fake,split2 --dpi-desync-split-seqovl=2 --dpi-desync-split-tls=sniext --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-ttl=4 --new ^
--filter-tcp=443 --hostlist="hostlists\list-discord.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=md5sig --dpi-desync-ttl=4 --new ^
--filter-udp=50000-50100 --ipset="hostlists\ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d2 --dpi-desync-fake-unknown-udp=0x00
