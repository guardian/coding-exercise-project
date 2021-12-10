function Test-CommandExists {
    param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'
    try {
        if (Get-Command $command) {
            return $true
        }
    }
    catch {
        return $false
    }
    finally {
        $ErrorActionPreference = $oldPreference
    }
}

function RefreshPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}

function RunSetupIfNeeded {
    RefreshPath
    if ( -Not (Python3Installed) ) {
        Write-Output "python is not installed. Running setup script..."
        . ($PSScriptRoot + "\setup.ps1")
        Write-Output ""
    }
}

function Python3Installed() {
    RefreshPath
    if ( Test-CommandExists python ) {
        $versionString = python --version
        if ($versionString.StartsWith("Python 3.")) {
            return $True
        }
    }
    return $False
}

function DownloadToFile ($url, $filename) {
    Write-Output "Attempting to download $url to $filename" 
    $startTime = Get-Date

    try {
        Import-Module BitsTransfer

        Start-BitsTransfer -Source $url -Destination $filename

        Write-Output "Time taken: $((Get-Date).Subtract($startTime).Seconds) second(s)"
    } catch {
        Write-Host "An error occurred:"
        Write-Host $_
        Write-Output "Failed to download using BITS. Trying net.webclient"
        $workingDir = Get-Location
        (new-object net.webclient).DownloadFile($url, "$workingDir\$filename")
    }
}
