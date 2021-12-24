. ($PSScriptRoot + "\common.ps1")

function GetLatestJDK8Link($cpuArchId) {
    $archString = "x64"
    if ($cpuArchId -eq 0) {
        $archString = "x86-32"
    }
    $defaultLink = "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_windows_hotspot_8u312b07.msi"
    try {
        $regex = "\/adoptium\/temurin8-binaries\/releases\/download\/jdk-8[0-9\.\-%a-bA-B]*\/OpenJDK8U-jdk_" + $archString + "_windows_hotspot_[0-9\._-]*.msi"
        $releasesHTML = (new-object net.webclient).DownloadString("https://github.com/adoptium/temurin8-binaries/releases/latest")
        if ($releasesHTML -match $regex) {
            return "https://github.com" + $Matches[0]
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to determine latest version of JDK 8. Using $defaultLink"
    return $defaultLink
}

function GetJDKLocation() {
    $jdkLocation = ""
    if (Test-CommandExists javac) {
        $jdkLocation = (get-item (get-command javac).Path).Directory.Parent.FullName
    }
    if ((-Not $jdkLocation) -And (Test-Path -Path "C:\Program Files\Eclipse Adoptium\")) {
        $subfolders = Get-ChildItem -Path "C:\Program Files\Eclipse Adoptium" -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName
        foreach ($subfolder in $subfolders) {
            $jdkLocation = $subfolder.FullName
            if ($subfolder.FullName.Contains("jdk-8")) {
                return $subfolder.FullName
            }
        }
    }
    return $jdkLocation
}

function GetFilenameFromPath($filepath, $default) {
    if ($filepath -match '\/(?<file>[%a-zA-Z\.\-_0-9]*)$') {
        return $Matches.file
    }
    return $default
}

$gradleVersion = "7.3.3"

function DownloadGradleIfNeeded {
    Write-Host "Downloading gradle if needed..."
    $gradleZipUrl = "https://services.gradle.org/distributions/gradle-$gradleVersion-bin.zip"
    $gradleZip = GetFilenameFromPath $gradleZipUrl "gradle-$gradleVersion-bin.zip"
    if (Test-Path "./$gradleZip") {
        Write-Host "Already downloaded $gradleZip"
    } else {
        DownloadToFile $gradleZipUrl $gradleZip
    }
    Expand-Archive -Force -LiteralPath ./$gradleZip -DestinationPath "./gradle"
    $env:PATH = $env:PATH + ";" + (Convert-Path . ) + "/gradle/gradle-$gradleVersion/bin"
}

function DownloadJDK() {
    $cpuArchId = GetCPUArchId
    $downloadLink = GetLatestJDK8Link($cpuArchId)
    Write-Host "DOWNLOAD LINK $downloadLink"
    $installerFilename = GetFilenameFromPath $downloadLink "jdk_8_installer.msi"
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
if ($jdkLocation) {
    Write-Host "JDK found at $jdkLocation, setting JAVA_HOME and adding to Path"
    $env:JAVA_HOME = $jdkLocation
    $env:Path = "$env:Path;$jdkLocation/bin"
} else {
    Write-Host "JDK not installed. Downloading JDK 8..."
    DownloadJDK
}

$env:PATH = $env:PATH + ";" + (Convert-Path . ) + "/gradle/gradle-$gradleVersion/bin"
gradle build