# Definieren Sie den Pfad, wohin das Zip-File heruntergeladen werden soll
$zipFilePath = "C:\Service\CustomServerScript2022.zip"

# Herunterladen des Zip-Files
Invoke-WebRequest -Uri "URL_TO_YOUR_ZIP_FILE_IN_GITHUB" -OutFile $zipFilePath

# Entpacken des Zip-Files nach C:\Service
Expand-Archive -Path $zipFilePath -DestinationPath "C:\Service"

# Ausführen der server_customization.cmd
Start-Process -NoNewWindow -FilePath "C:\Service\server_customization.cmd"
