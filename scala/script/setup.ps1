

$url = "https://github.com/sbt/sbt/releases/download/v1.6.2/sbt-1.6.2.zip"
$zipFilename = "./sbt-1.6.2.zip"
$localSbt = "./sbt"

# Download SBT Zip
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $zipFilename

# Unzip to temp folder
Expand-Archive -Force -LiteralPath ./$zipFilename -DestinationPath $localSbt

# Add to temp PATH
$env:PATH += ";" + (Convert-Path "$localSbt/sbt/bin" )  + ";"