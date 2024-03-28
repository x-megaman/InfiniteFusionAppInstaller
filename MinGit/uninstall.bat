@echo off

setlocal

set "destinationDir=%APPDATA%\spriteInstaller\"
cd "%destinationDir%\InfiniteFusionApp"

.\MinGit\7z.exe e -spf -aoa "MinGit\MinGit.7z"

set mgit=".\REQUIRED_BY_INSTALLER_UPDATER\cmd\git.exe"
%mgit% init . 
%mgit% remote add origin "https://github.com/x-megaman/InfiniteFusionAppInstaller.git" 
%mgit% config --local core.autocrlf false
%mgit% fetch origin main
%mgit% reset --hard origin/main

rd /s /q "REQUIRED_BY_INSTALLER_UPDATER"

xcopy /s /e /i /y "%destinationDir%\InfiniteFusionApp\MinGit\InfiniteFusionUpdater.bat" "%destinationDir%\InfiniteFusionApp\"


:: Initialize variables
set "TargetApp=InfiniteFusionApp"
set "UninstallString="

:: Query registry for UninstallString
for /f "tokens=2,*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%TargetApp%" /d /t REG_SZ /c /e /v UninstallString 2^>nul ^| find /i "%TargetApp%"') do (
    set "UninstallString=%%B"
)

:: Check if UninstallString is found
if not defined UninstallString (
    echo %TargetApp% not found.
    exit /b
)

:: Run UninstallString
echo:
echo -----------------------------------------------------------------------------------
echo Uninstalling %TargetApp%...
echo:
echo Click OK to Uninstall so we can install the latest version.
cmd /c %UninstallString%
echo:
echo -----------------------------------------------------------------------------------

cd /d "%LOCALAPPDATA%\Apps\2.0"

REM Delete all files in the directory
del /q /f /s *

REM Delete all subdirectories and their contents
for /d %%x in (*) do rd /s /q "%%x"

endlocal