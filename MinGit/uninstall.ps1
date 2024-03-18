$InstalledApplicationNotMSI = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$UninstallString = $InstalledApplicationNotMSI | ? { $_.displayname -match "InfiniteFusionApp" } | select UninstallString 
$wshell = new-object -com wscript.shell
$selectedUninstallString = $UninstallString.UninstallString
$wshell.run("cmd /c $selectedUninstallString")
Start-Sleep 5
$wshell.sendkeys("`"OK`"~")
Start-Sleep 3
exit