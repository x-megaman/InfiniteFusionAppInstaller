@echo off
setlocal

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
echo Uninstalling %TargetApp%...
echo Click OK to Uninstall so we can install the latest version.
cmd /c %UninstallString%

endlocal