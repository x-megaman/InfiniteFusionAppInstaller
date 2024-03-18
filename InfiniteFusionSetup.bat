@echo off

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
echo Welcome! This is the Pokemon Infinite Fusion Game Installer!
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
%mgit% init . 

%mgit% remote add origin "https://github.com/x-megaman/InfiniteFusionApp.git" 
%mgit% fetch origin main --depth=1
%mgit% reset --hard origin/main

rd /s /q "REQUIRED_BY_INSTALLER_UPDATER"

set "destinationDir=%APPDATA%\spriteInstaller\"


rd /s /q "%destinationDir%\InfiniteFusionApp"
xcopy /s /e /i "%CD%" "%destinationDir%\InfiniteFusionApp"


xcopy /s /e /i "%destinationDir%\InfiniteFusionApp\MinGit\InfiniteFusionUpdater.bat" "%destinationDir%\InfiniteFusionApp\"


cd "%destinationDir%\InfiniteFusionApp"

if exist "%folderPath%" (
    powershell -WindowStyle Hidden -File "MinGit\uninstall.ps1"
)

cd "%destinationDir%\InfiniteFusionApp"

start "Setup" "Lib\setup.exe"
rem Wait for setup.exe to finish running
echo -----------------------------------------------------------------------------------  
echo Continue with the Setup and click Install. The app will be installed on your desktop. You can close this now.
pause