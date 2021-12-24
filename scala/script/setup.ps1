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

function DownloadSBT() {
    $zipUrl = "https://github.com/sbt/sbt/releases/download/v1.5.6/sbt-1.5.6.zip"
    $zipFilename = GetFilenameFromPath $zipUrl
    if (Test-Path "./$zipFilename") {
        Write-Host "Already downloaded $zipFilename"
    } else {
        DownloadToFile $zipUrl $zipFilename
    }
    Write-Host "Extracting $zipFilename"
    Expand-Archive -Force -LiteralPath ./$zipFilename -DestinationPath "./"
    $env:PATH = $env:PATH + ";" + (Convert-Path . ) + "/sbt/bin/"
}

$jdkLocation = GetJDKLocation
if ($jdkLocation) {
    Write-Host "JDK found at $jdkLocation, setting JAVA_HOME and adding to Path"
    $env:JAVA_HOME = $jdkLocation
    $env:Path = "$env:Path;$jdkLocation/bin"
} else {
    DownloadJDK
}

if (-Not (Test-CommandExists sbt)) {
    DownloadSBT
}

sbt --version
Write-Output "JDK and sbt (scala build tool) installed. You're good to go!"


