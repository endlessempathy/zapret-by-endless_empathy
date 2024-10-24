@ECHO OFF
PUSHD "%~dp0"
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\list-russia_blacklist.txt"
POPD
