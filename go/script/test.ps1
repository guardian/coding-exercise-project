. ($PSScriptRoot + "/../../common.ps1")

RunSetupIfNeeded go

$env:GO111MODULE="off"

cd src

go test

cd ../