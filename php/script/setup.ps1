$phpZipUrl = "https://windows.php.net/downloads/releases/php-8.1.10-nts-Win32-vs16-x64.zip"
$phpZipFilename = "php-8.1.10-nts-Win32-vs16-x64.zip"
$localPhp = "./php"

# Download PHP zip
Import-Module BitsTransfer
Start-BitsTransfer -Source $phpZipUrl -Destination $phpZipFilename

# Extract PHP zip
Expand-Archive -Force -LiteralPath ./$phpZipFilename -DestinationPath $localPhp

# Add downloaded php to path
$phpPath = (Convert-Path $localPhp)
$env:PATH = $env:PATH + ";" + $phpPath

php --version

# Copy php config to local install
cp ./php.ini $localPhp

# Download Composer install php script
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

php composer.phar install