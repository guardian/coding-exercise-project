. ($PSScriptRoot + "/../../common.ps1")
. ($PSScriptRoot + "/../../jdk.ps1")

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

function DownloadMavenIfNeeded {
    if (-Not (Test-CommandExists mvn)) {
        $mavenVersion = GetLatestMaven3Version
        $mavenZipUrl = "https://dlcdn.apache.org/maven/maven-3/$mavenVersion/binaries/apache-maven-$mavenVersion-bin.zip"
        $mavenLocalInstallDir = (Convert-Path . ) + "\maven\apache-maven-$mavenVersion\bin"
        DownloadAndUnzipIfNeeded $mavenZipUrl "./maven"
        $env:PATH = "$env:PATH;$mavenLocalInstallDir"
    }
}


FindOrInstallJDK
DownloadMavenIfNeeded
mvn -v