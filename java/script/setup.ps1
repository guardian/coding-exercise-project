. ($PSScriptRoot + "/../../common.ps1")

function GetLatestJDK11Link($cpuArchId) {
    $archString = GetCPUArchString "x86-32" "x64" "" ""
    $defaultLink = "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_11.0.13_8.msi"
    $fileRegex = "jdk-11[0-9\.\-%a-bA-B]*\/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_[0-9\._-]*.msi"
    Write-Host "Failed to determine latest version of jdk 11. Using $defaultLink"
    return GetLatestDownloadViaGithub "adoptium" "temurin11-binaries" $fileRegex $defaultLink $searchQuery
}

function GetJDKLocation() {
    $jdkLocation = ""
    if (Test-Path -Path "C:\Program Files\Eclipse Adoptium") {
        $subfolders = Get-ChildItem -Path "C:\Program Files\Eclipse Adoptium" -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName
        $jdkLocation = $subfolders[0].FullName
    }
    if (-Not $jdkLocation) {
        $jdkLocation = (get-item (get-command javac).Path).Directory.Parent.FullName
    }
    return $jdkLocation
}

function GetLatestMaven3Version() {
    $version = "3.6.3"
    try {
        $regex = 'a href="(3.8.[0-9.]+)\/'
        $releasesHTML = (new-object net.webclient).DownloadString("https://dlcdn.apache.org/maven/maven-3/")
        if ($releasesHTML -match $regex) {
            $version = $Matches[1]
            return $version
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to determine latest Maven 3 version using $version"
    return $version
}

function GetFilenameFromPath($filepath, $default) {
    if ($filepath -match '\/(?<file>[%a-zA-Z\.\-_0-9]*)$') {
        return $Matches.file
    }
    return $default
}

function DownloadMavenIfNeeded {
    "Downloading maven if needed..."
    $mavenVersion = GetLatestMaven3Version
    Write-Host "Latest maven version $mavenVersion"
    $mavenZipUrl = "https://dlcdn.apache.org/maven/maven-3/$mavenVersion/binaries/apache-maven-$mavenVersion-bin.zip"
    $mavenZip = "apache-maven-$mavenVersion-bin.zip"
    if (Test-Path "./$mavenZip") {
        Write-Host "Already downloaded $mavenZip"
    } else {
        DownloadToFile $mavenZipUrl $mavenZip
        Expand-Archive -LiteralPath ./$mavenZip -DestinationPath "./maven"
    }
    $env:PATH = $env:PATH + ";" + (Convert-Path . ) + "/maven/apache-maven-$mavenVersion/bin"
}

function DownloadJDK() {
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

$jdkLocation = GetJDKLocation
if (Test-CommandExists javac) {
    $jdkVersion = javac --version
    Write-Host "JDK already installed $jdkVersion"
} elseif ($jdkLocation) {
    Write-Host "JDK found at $jdkLocation, setting JAVA_HOME and adding to session Path"
    $env:JAVA_HOME = $jdkLocation
    $env:Path = "$env:Path;$jdkLocation/bin"
} else {
    Write-Host "JDK not installed."
    AskPermissionForGlobalInstall "jdk11" "Install JDK 11 manually https://adoptium.net/?variant=openjdk11"
    DownloadJDK
}

DownloadMavenIfNeeded
mvn -v