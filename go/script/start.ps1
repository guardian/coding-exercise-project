. ($PSScriptRoot + "/../../common.ps1")

RunSetupIfNeeded go

$env:GO111MODULE="off"

go run main.go