function Test-CommandExists {
    param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'
    try {
        if(Get-Command $command){
            return $true
        }
    } catch {
        return $false
    } finally {
        $ErrorActionPreference=$oldPreference
    }
}

function RunSetupIfNeeded {
    if ( -Not (Test-CommandExists dotnet) ) {
        Write-Output "dotnet is not installed. Running setup script..."
        . ($PSScriptRoot + "\setup.ps1")
        Write-Output ""
    }
}