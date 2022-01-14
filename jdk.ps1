. ($PSScriptRoot + "/common.ps1")

## JDK Related Functions used by:
# Java, Scala, Kotlin, Clojure

function GetLatestJDK11Link() {
    $archString = GetCPUArchString "x86-32" "x64" "" ""
    $defaultLink = "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_11.0.13_8.msi"
    $fileRegex = "jdk-11[0-9\.\-%a-bA-B]*\/OpenJDK11U-jdk_" + $archString + "_windows_hotspot_[0-9\._-]*.msi"
    return GetLatestDownloadViaGithub "adoptium" "temurin11-binaries" $fileRegex $defaultLink ""
}

function GetJDKLocation() {
    # Check for JDK on Path
    if (Test-CommandExists javac) {
        return (get-item (get-command javac).Path).Directory.Parent.FullName
    }
    # Check for common install locations if JDK not already on path
    foreach ($parentFolder in @("C:\Program Files\Eclipse Adoptium", "C:\Program Files\Java", "C:\Program Files(x86)\Java")) {
        if (Test-Path -Path $parentFolder) {
            $subfolders = Get-ChildItem -Path $parentFolder -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName
            foreach ($subfolder in $subfolders) {
                if (Test-Path -Path "$subfolder\bin\javac.exe" -PathType Leaf) {
                    Write-Output "JDK found at $subfolder"
                    return $subfolder
                }
            }
        }
    }
    return $jdkLocation
}

function DownloadAndInstallJDK() {
    $downloadLink = GetLatestJDK11Link
    $installerFilename = $zipFilename = Split-Path $downloadLink -Leaf
    DownloadIfNeeded $downloadLink $installerFilename
    $msiPath = (Convert-Path . ) + "\$installerFilename"
    Start-Process msiexec.exe -Wait -ArgumentList "/I $msiPath"
    RefreshPath
}

# If javac is not on path then attempt to find a JDK install on machine.
# If a JDK install can't be found ask user if they would like to download and install JDK 11 automatically.
function FindOrInstallJDK() {
    $jdkLocation = GetJDKLocation
    if ([string]::IsNullOrEmpty($jdkLocation)) {
        Write-Host "JDK not installed or could not be found"
        $rejectMsg = "Install JDK 11 manually and re-run this setup script. You can download Open JDK here: https://adoptium.net/?variant=openjdk11"
        AskPermissionForGlobalInstall "Adoptium Open JDK 11" $rejectMsg
        DownloadAndInstallJDK
        $jdkLocation = GetJDKLocation
    }
    if (-Not (Test-CommandExists javac)) {
        Write-Host "javac command not found on Path adding $jdkLocation/bin to Path for this session"
        $env:Path = "$env:Path;$jdkLocation/bin"
    }
    if ([string]::IsNullOrEmpty($env:JAVA_HOME)) {
        Write-Host "JAVA_HOME not set. Setting JAVA_HOME to $jdkLocation for this session"
        $env:JAVA_HOME = $jdkLocation
    }
}