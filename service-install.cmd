@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
:: 65001 - UTF-8

:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [Внимание] Данный файл должен быть запущен с правами администратора: ПКМ → Запустить от имени администратора.
    pause
    exit /b
)

cd /d "%~dp0"

:: Set the BIN variable to the path of the bin directory
set BIN_PATH=%~dp0bin\

:: Search for .cmd files in current directory, except files that start with "service" or "update".
set "count=0"
for %%f in (*.cmd) do (
    set "filename=%%~nxf"
    if /i not "!filename:~0,7!"=="service" (
        if /i not "!filename:~0,6!"=="update" (
            set /a count+=1
            echo !count!. %%f
            set "file!count!=%%f"
        )
    )
)

:: Choose file
set "choice="
set /p "choice=Введите номер файла: "

if "!choice!"=="" goto :eof

set "selectedFile=!file%choice%!"
if not defined selectedFile (
    echo Неверный выбор, завершение.
    pause
    goto :eof
)

:: Parse arguments (mergeargs: 2=start wf|1=wf argument|0=default)
set "args="
set "capture=0"
set "mergeargs=0"
set QUOTE="

for /f "tokens=*" %%a in ('type "!selectedFile!"') do (
    set "line=%%a"

    echo !line! | findstr /i "%BIN%winws.exe" >nul
    if not errorlevel 1 (
        set "capture=1"
    )

    if !capture!==1 (
        if not defined args (
            set "line=!line:*%BIN%winws.exe"=!"
        )

        set "temp_args="
        for %%i in (!line!) do (
            set "arg=%%i"

            if not "!arg!"=="^" (
                if "!arg:~0,2!" EQU "--" if not !mergeargs!==0 (
                    set "mergeargs=0"
                )

                if "!arg:~0,1!" EQU "!QUOTE!" (
                    set "arg=!arg:~1,-1!"

                    echo !arg! | findstr ":" >nul
                    if !errorlevel!==0 (
                        set "arg=\!QUOTE!!arg!\!QUOTE!"
                    ) else if "!arg:~0,1!"=="@" (
                        set "arg=\!QUOTE!@%~dp0!arg:~1!\!QUOTE!"
                    ) else if "!arg:~0,5!"=="%%BIN%%" (
                        set "arg=\!QUOTE!!BIN_PATH!!arg:~5!\!QUOTE!"
                    ) else (
                        set "arg=\!QUOTE!%~dp0!arg!\!QUOTE!"
                    )
                )

                if !mergeargs!==1 (
                    set "temp_args=!temp_args!,!arg!"
                ) else (
                    set "temp_args=!temp_args! !arg!"
                )

                if "!arg:~0,4!" EQU "--wf" (
                    set "mergeargs=2"
                ) else if "!arg!" EQU "--dpi-desync" (
                    set "mergeargs=2"
                ) else if "!arg!" EQU "--dpi-desync-fooling" (
                    set "mergeargs=2"
                ) else if !mergeargs!==2 (
                    set "mergeargs=1"
                )
            )
        )

        if not "!temp_args!"=="" (
            set "args=!args! !temp_args!"
        )
    )
)

:: Execute service with parsed arguments
set ARGS=%args%
echo Final args: !ARGS!

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

:: Create the service with the specified parameters
sc create %SRVCNAME% binPath= "\"%BIN_PATH%winws.exe\" %ARGS%" DisplayName= "%SRVCNAME%" start= auto
sc description %SRVCNAME% "zapret DPI bypass software"
sc start %SRVCNAME%

:: Wait for user input before closing the window
pause
