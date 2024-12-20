@echo off

set "destinationDir=%APPDATA%\spriteInstaller\"
cd "%destinationDir%\InfiniteFusionLauncher"

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
echo Welcome! This is the Pokemon Infinite Fusion Launcher!
echo Developed by megaman
echo: 
echo -----------------------------------------------------------------------------------  
%mgit% config --global http.postBuffer 1048576000
%mgit% config --global http.version HTTP/2
%mgit% config --global pack.window 1
%mgit% config --global core.compression 0
%mgit% config --global core.packedGitLimit 512m
%mgit% config --global core.packedGitWindowSize 512m
%mgit% config --global pack.deltaCacheSize 2047m
%mgit% config --global pack.packSizeLimit 2047m
%mgit% config --global pack.windowMemory 2047m
%mgit% config --global http.lowSpeedLimit 0
%mgit% config --global http.lowSpeedTime 999999 
%mgit% config --global core.autocrlf false
%mgit% init . 

%mgit% remote add origin "https://github.com/x-megaman/InfiniteFusionAppInstaller.git" 
%mgit% config --local core.autocrlf false
%mgit% fetch origin main
%mgit% reset --hard origin/main

rd /s /q "REQUIRED_BY_INSTALLER_UPDATER"

if exist "%folderPath%" (
    powershell -WindowStyle Hidden -File "MinGit\uninstall.ps1"
)
echo: 
echo -----------------------------------------------------------------------------------  
echo: 

start "Setup" "Lib\InfiniteFusionLauncher.application"
rem Wait for setup.exe to finish running
echo: 
echo Click Install to Install the Launcher. 
echo The launcher will be installed on your desktop. You can close this now.
echo: 
echo -----------------------------------------------------------------------------------  
pause