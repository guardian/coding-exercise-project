. ($PSScriptRoot + "/../../common.ps1")
. ($PSScriptRoot + "/../../jdk.ps1")

function FindOrDownloadSBT {
    if (-Not (Test-CommandExists sbt)) {
        $env:Path = $env:Path + ";" + (Convert-Path . ) + "/sbt/bin"
    }
    if (-Not (Test-CommandExists sbt)) {
        DownloadAndUnzipIfNeeded "https://github.com/sbt/sbt/releases/download/v1.5.6/sbt-1.5.6.zip" "./"
    }
}

FindOrInstallJDK

FindOrDownloadSBT

sbt --version
Write-Output "JDK and sbt (scala build tool) installed. You're good to go!"


