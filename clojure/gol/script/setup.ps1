. ($PSScriptRoot + "/../../../common.ps1")
. ($PSScriptRoot + "/../../../jdk.ps1")

FindOrInstallJDK

$env:PATH = $env:PATH + ";" + (Convert-Path . )
lein self-install
lein --version