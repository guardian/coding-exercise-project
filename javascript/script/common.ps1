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

function UsingCorrectNodeVersion {
    if ( Test-CommandExists node ) {
        $runningNodeVersion=$(node -v)
        $requiredNodeVersion=$(cat .nvmrc)
        if ($runningNodeVersion -eq $requiredNodeVersion) {
            return $true
        }
    }
    return $false
}

function RunSetupIfNeeded {
    RefreshPath
    if ( UsingCorrectNodeVersion ) {
        Write-Output "Correct version of Node not installed. Running setup script..."
        . ($PSScriptRoot + "\setup.ps1")
        Write-Output ""
    }
}

# Returns integer for CPU architecture as listed here: https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-processor
# 0 - x86 32bit
# 5 - ARM
# 9 - x86 64bit
function GetCPUArchId {
    $CPUObj = Get-WMIObject -Class Win32_Processor -ComputerName $env:ComputerName -EA Stop
    return [int]$CPUObj.Architecture
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
