. ($PSScriptRoot + "/../../common.ps1")
. ($PSScriptRoot + "/../../node.ps1")

SetupNodeJS

npm install
Write-Output "If you saw an error instead of npm installing then run npm install manually"