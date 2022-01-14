. ($PSScriptRoot + "/../../common.ps1")

$phpZipUrl = "https://windows.php.net/downloads/releases/php-8.1.1-nts-Win32-vs16-x64.zip"
DownloadAndUnzipIfNeeded $phpZipUrl "./php"

# Add downloaded php to path
$phpPath = (Convert-Path . ) + "/php"
$env:PATH = $env:PATH + ";" + $phpPath

php --version

cp php.ini ./php

# Install composer
DownloadToFile "https://getcomposer.org/installer" "composer-setup.php"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php -f "composer-setup.php"
php -r "unlink('composer-setup.php');"

php composer.phar install