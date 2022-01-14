. ($PSScriptRoot + "/../../common.ps1")
. ($PSScriptRoot + "/../../jdk.ps1")

$gradleVersion = "7.3.3"
function FindOrDownloadGradle {
    if (-Not (Test-CommandExists gradle)) {
        $env:Path = $env:Path + ";" + (Convert-Path . ) + "/gradle/gradle-$gradleVersion/bin"
    }
    if (-Not (Test-CommandExists gradle)) {
        $gradleZipUrl = "https://services.gradle.org/distributions/gradle-$gradleVersion-bin.zip"
        DownloadAndUnzipIfNeeded $gradleZipUrl "./gradle"
    }
}

FindOrInstallJDK
FindOrDownloadGradle
gradle build