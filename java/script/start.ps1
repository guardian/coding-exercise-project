. ($PSScriptRoot + "/../../common.ps1")

RunSetupIfNeeded "mvn"

mvn compile exec:java