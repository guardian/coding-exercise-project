. ($PSScriptRoot + "\common.ps1")

function GetLatestJDK11Link($cpuArchId) {
    $archString = "x64"
    if ($cpuArchId -eq 0) {
        $archString = "x86-32"
    }
    $defaultLink = "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_11.0.13_8.msi"
    try {
        $regex = "\/adoptium\/temurin11-binaries\/releases\/download\/jdk-11[0-9\.\-%a-bA-B]*\/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_[0-9\._-]*.msi"
        $releasesHTML = (new-object net.webclient).DownloadString("https://github.com/adoptium/temurin11-binaries/releases/latest")
        if ($releasesHTML -match $regex) {
            return "https://github.com" + $Matches[0]
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to determine latest version of ruby 2. Using $defaultLink"
    return $defaultLink
}

function GetFilenameFromPath($filepath, $default) {
    if ($filepath -match '\/(?<file>[%a-zA-Z\.\-_0-9]*)$') {
        return $Matches.file
    }
    return $default
}

function DownloadMavenIfNeeded {
    "Downloading maven if needed..."
    $mavenZipUrl = "https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.zip"
    $mavenZip = "apache-maven-3.8.3-bin.zip"
    if (Test-Path "./$mavenZip") {
        Write-Host "Already downloaded $mavenZip"
    } else {
        DownloadToFile $mavenZipUrl $mavenZip
        Expand-Archive -LiteralPath ./$mavenZip -DestinationPath "./maven"
    }
    $env:PATH = $env:PATH + ";" + (Convert-Path . ) + "\maven\apache-maven-3.8.3\bin"
}


if (Test-CommandExists javac) {
    $rubyVersion = javac --version
    Write-Host "JDK already installed $rubyVersion"
} else {
    Write-Host "JDK not installed. Downloading JDK 11..."
    $cpuArchId = GetCPUArchId
    $downloadLink = GetLatestJDK11Link($cpuArchId)
    Write-Host "DOWNLOAD LINK $downloadLink"
    $installerFilename = GetFilenameFromPath $downloadLink "jdk_11_installer.msi"
    Write-Host "Installer $installerFilename"
    if (Test-Path "./$installerFilename") {
        Write-Host "Already downloaded $installerFilename"
    } else {
        DownloadToFile $downloadLink $installerFilename
    }
    $msiPath = (Convert-Path . ) + "\$installerFilename"
    Start-Process msiexec.exe -Wait -ArgumentList "/I $msiPath"
    RefreshPath
}

# TODO Make this not hardcoded
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-11.0.13.8-hotspot"

DownloadMavenIfNeeded
mvn -v