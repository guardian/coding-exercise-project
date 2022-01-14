. ($PSScriptRoot + "/../../common.ps1")
. ($PSScriptRoot + "/../../node.ps1")

WarnIfIncorrectNodeVersion

npm test --watch
