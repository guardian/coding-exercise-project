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

function Invoke-Admin() {
    param ( [string]$program = $(throw "Please specify a program" ),
            [string]$argumentString = "",
            [switch]$waitForExit )

    $psi = new-object "Diagnostics.ProcessStartInfo"
    $psi.FileName = $program 
    $psi.Arguments = $argumentString
    $psi.Verb = "runas"
    $proc = [Diagnostics.Process]::Start($psi)
    if ( $waitForExit ) {
        $proc.WaitForExit();
    }
}

function UsingCorrectNodeVersion() {
    if ( Test-CommandExists node ) {
        $runningNodeVersion=$(node -v)
        $requiredNodeVersion=$(cat .nvmrc)
        if ($runningNodeVersion -eq $requiredNodeVersion) {
            return $True
        }
    }
    return $False
}

function WarnIfIncorrectNodeVersion {
    Write-Output "Running UsingCorrectNodeVersion?"
    $res = UsingCorrectNodeVersion
    Write-Output "res: $res"
    if ($res -eq $False ) {
        Write-Output "Correct version of Node not installed."
        Write-Output "Use ./script/setup or nvm to setup correct version of node"
    }
}

function RefreshPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
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
