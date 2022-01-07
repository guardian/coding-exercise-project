. ($PSScriptRoot + "\common.ps1") # Import common functions

# Ensure DOTNET_ROOT is set
$env:DOTNET_ROOT = SetupCommandOnPath dotnet @("$env:LocalAppData/Microsoft/dotnet", "./dotnet")

# Run setup if dotnet command not installed
RunSetupIfNeeded dotnet

dotnet test