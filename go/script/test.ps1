. ($PSScriptRoot + "\common.ps1")

RunSetupIfNeeded

cd src

go test

cd ../