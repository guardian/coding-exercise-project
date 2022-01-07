. ($PSScriptRoot + "\..\..\common.ps1") # Import common functions

if ( -Not (Test-CommandExists dotnet) ) {
    Write-Host "dotnet command not available running setup script"
    . ($PSScriptRoot + "\setup.ps1")
}

dotnet run --project Code