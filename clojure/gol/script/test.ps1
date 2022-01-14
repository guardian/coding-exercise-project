. ($PSScriptRoot + "/../../../common.ps1")

RunSetupIfNeeded javac

$env:PATH = $env:PATH + ";" + (Convert-Path . )

lein self-install

lein test