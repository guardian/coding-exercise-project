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

function GetCommandPath($command) {
    if (Test-CommandExists($command)) {
        return Get-Command $command | Select-Object -ExpandProperty Definition | Split-Path
    }
    return ""
}

function SetupCommandOnPath($command, $potentialPaths) {
    $oldPath = $env:Path
    $potentialPaths = (GetCommandPath $command) + $potentialPaths
    foreach ($potentialCmdPath in $potentialPaths) {
        $env:Path = "$oldPath;$potentialCmdPath"
        $workingCommandPath = GetCommandPath $command
        if ($workingCommandPath) {
            Write-Host "Found install path for $command at $workingCommandPath"
            return $workingCommandPath
        }
    }
    $env:Path = $oldPath
    Write-Host "Failed to find install path for $command"
    return ""
}

function RunSetupIfNeeded($command) {
    if ( -Not (Test-CommandExists $command) ) {
        Write-Output "$command not found. Running setup script..."
        . ("./script/setup.ps1")
        Write-Output ""
    }
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
