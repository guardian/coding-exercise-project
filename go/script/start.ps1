. ($PSScriptRoot + "/../../common.ps1")

RefreshPath
RunSetupIfNeeded go

$env:GO111MODULE="off"

go run main.go