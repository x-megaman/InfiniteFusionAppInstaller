@echo off

cd /d "%~dp0"

:: Define the folder name
set "folderName=megaman"

:: Build the full path using %APPDATA%
set "folderPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%folderName%"


.\MinGit\7z.exe e -spf -aoa "MinGit\MinGit.7z"

set mgit=".\REQUIRED_BY_INSTALLER_UPDATER\cmd\git.exe"
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo -----------------------------------------------------------------------------------  
echo Welcome! This is the Pokemon Infinite Fusion App Installer!
echo Developed by megaman
echo: 
echo -----------------------------------------------------------------------------------  
%mgit% config --global http.postBuffer 1048576000
%mgit% config --global http.version HTTP/1.1
%mgit% config --global pack.window 1
%mgit% config --global core.compression 0
%mgit% config --global core.packedGitLimit 512m
%mgit% config --global core.packedGitWindowSize 512m
%mgit% config --global pack.deltaCacheSize 2047m
%mgit% config --global pack.packSizeLimit 2047m
%mgit% config --global pack.windowMemory 2047m
%mgit% config --global http.lowSpeedLimit 1000
%mgit% config --global http.lowSpeedTime 600
%mgit% config --global core.autocrlf false

%mgit% init . 

%mgit% remote add origin "https://github.com/x-megaman/InfiniteFusionAppInstaller.git" 
%mgit% config --local core.autocrlf false
%mgit% fetch origin main
%mgit% reset --hard origin/main

rd /s /q "REQUIRED_BY_INSTALLER_UPDATER"
echo: 
echo -----------------------------------------------------------------------------------  
set "destinationDir=%APPDATA%\spriteInstaller\"


rmdir /s /q "%destinationDir%\InfiniteFusionApp"
xcopy /s /e /i "%CD%\Lib" "%destinationDir%\InfiniteFusionApp\Lib"
xcopy /s /e /i "%CD%\MinGit" "%destinationDir%\InfiniteFusionApp\MinGit"

xcopy /s /e /i "%destinationDir%\InfiniteFusionApp\MinGit\InfiniteFusionUpdater.bat" "%destinationDir%\InfiniteFusionApp\"
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo -----------------------------------------------------------------------------------  

cd "%destinationDir%\InfiniteFusionApp"

if exist "%folderPath%" (
    call "MinGit\uninstall.bat"
)

cd "%destinationDir%\InfiniteFusionApp" 

if not exist "Lib\InfiniteFusionApp.application" (
    echo: EXTRACT InfiniteFusionSetup.zip. You did not extract before running this!!!
)

start "Setup" "Lib\InfiniteFusionApp.application"
rem Wait for setup.exe to finish running
echo Click Install to Install the App. 
echo The app will be installed on your desktop. You can close this now.
echo: 
echo -----------------------------------------------------------------------------------  
pause