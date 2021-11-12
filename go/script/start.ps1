. ($PSScriptRoot + "\common.ps1")

RunSetupIfNeeded

$env:GO111MODULE="off"

go run main.go