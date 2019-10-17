@echo off
cd /d %~dp0
set CURRDIR=%~dp0
SET ERROR=0
set depot_tools=%~dp0..\depot_tools
Call :InPath %depot_tools% Result
IF %Result% == 0 SET PATH=%PATH%;%depot_tools%;%depot_tools%\win_tools-2_7_6_bin\python\bin

echo Detecting Visual Studio 2017 environment ...
if not defined VS150ENTCOMNTOOLS GOTO checkVsinstalldir
echo Visual Studio 2017 environment be detected...
set VSINSTALLDIR=%VS150ENTCOMNTOOLS%\..\..\
goto MSVCVarsDone

:checkVsinstalldir
REM Check what architecture we are installing on
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    echo Detected 64 bit system...
    set SYSARCH=64
) else if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
        echo Detected 64 bit system running 32 bit shell...
        set SYSARCH=64
    ) else (
        echo Detected 32 bit system...
        set SYSARCH=32
    )
) else (
    echo Error: Could not detect current platform architecture!"
    goto EXITONERROR
)

REM Check for default install locations based on current system architecture
if "%SYSARCH%"=="32" (
    set WOWNODE=
) else if "%SYSARCH%"=="64" (
    set WOWNODE=\WOW6432Node
) else (
    goto EXITONERROR
)

:queryVS2017Install
reg.exe query "HKLM\SOFTWARE%WOWNODE%\Microsoft\VisualStudio\SxS\VS7" /v 15.0 >nul 2>&1
if ERRORLEVEL 1 GOTO EXITONERROR
echo Visual Studio 2017 installation be detected...
for /f "skip=2 tokens=2,*" %%a in ('reg.exe query "HKLM\SOFTWARE%WOWNODE%\Microsoft\VisualStudio\SxS\VS7" /v 15.0') do (set VSINSTALLDIR=%%b)

:MSVCVarsDone
echo Devenv filename is in "%VSINSTALLDIR%".
GOTO END

:InPath [In]Path [Out]0/1
SETLOCAL
SET LocalPathCopy=%PATH%
SET Result=0
:WHILE
IF "%LocalPathCopy%" == "" GOTO INPATHRET
FOR /F "delims=;" %%I IN ("%LocalPathCopy%") DO (
  IF /I "%%~I" == "%~1" (
    SET Result=1
    GOTO INPATHRET
  )
)
FOR /F "delims=; tokens=1,*" %%I IN ("%LocalPathCopy%") DO (
  SET LocalPathCopy=%%~J
)
GOTO WHILE
:INPATHRET
ENDLOCAL & SET %2=%Result% & GOTO :EOF

:EXITONERROR
SET ERROR=1

:END
cd "%CURRDIR%"
EXIT /B %ERROR%
@echo on
