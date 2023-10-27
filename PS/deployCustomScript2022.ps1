# Überprüfen, ob das Verzeichnis C:\Service existiert, wenn nicht, dann erstellen
if (-not (Test-Path "C:\Service")) {
    New-Item -Path "C:\Service" -ItemType Directory
}

# Definieren Sie den Pfad, wohin das Zip-File heruntergeladen werden soll
$zipFilePath = "C:\Service\CustomServerScript2022.zip"

# Herunterladen des Zip-Files
Invoke-WebRequest -Uri "https://github.com/ocomag/Azure/raw/main/Custom/CustomServerScript2022.zip" -OutFile $zipFilePath

# Entpacken des Zip-Files nach C:\Service
Expand-Archive -Path $zipFilePath -DestinationPath "C:\Service"

# Löschen des heruntergeladenen Zip-Files nach dem Entpacken
Remove-Item -Path $zipFilePath

# Ausführen der server_customization.cmd
Start-Process -NoNewWindow -FilePath "C:\Service\Custom Server Script 2022\server_customization.cmd"
