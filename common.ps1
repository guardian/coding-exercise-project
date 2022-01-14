# Asks user permission before doing a global install
function AskPermissionForGlobalInstall($softwareName, $rejectionMsg) {
    $title    = "Install $softwareName globally?"
    $question = "Would you like this script to download and do a global install of $softwareName ?"

    $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
    $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    if ($decision -eq 0) {
        Write-Host "Proceeding to download and install $softwareName"
    } else {
        throw $rejectionMsg
    }
}

# Returns boolean for if a command is installed without throwing an error
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

# If a command is on the PATH return it's parent folder
function GetCommandPath($command) {
    if (Test-CommandExists($command)) {
        return Get-Command $command | Select-Object -ExpandProperty Definition | Split-Path
    }
    return ""
}

# Sets up a given command on the path.
# Given a command, and an array of strings with paths for where the command might be installed
# Checks each path for if the command is installed there
# If it finds the command at a given path that path is returned, and it is added to the $env:Path for this powershell session
# This also checks if the command is already installed before looking through the array of potential paths
function SetupCommandOnPath($command, $potentialPaths) {
    $oldPath = $env:Path
    $potentialPaths = (GetCommandPath $command) + $potentialPaths
    foreach ($potentialCmdPath in $potentialPaths) {
        $env:Path = "$oldPath;$potentialCmdPath"
        $workingCommandPath = GetCommandPath $command
        if ($workingCommandPath) {
            return $workingCommandPath
        }
    }
    $env:Path = $oldPath
    Write-Host "Failed to find install path for $command"
    return ""
}

# If the given command is not available then run the setup script
function RunSetupIfNeeded($command) {
    if ( -Not (Test-CommandExists $command) ) {
        Write-Output "$command not found. Running setup script..."
        . ("./script/setup.ps1")
        Write-Output ""
    }
}

# Download a file to the current directory
# Attempts to use BITS transfer and falls back to net.webclient if BITS transfer is not available.
# BITS transfer has the benefit of displaying a progress bar.
function DownloadToFile ($url, $filename) {
    Write-Host "Attempting to download $url to $filename"
    $startTime = Get-Date
    try {
        Import-Module BitsTransfer
        Start-BitsTransfer -Source $url -Destination $filename
        Write-Output "Time taken: $((Get-Date).Subtract($startTime).Seconds) second(s)"
    } catch {
        Write-Host "An error occurred:"
        Write-Host $_
        Write-Host "Failed to download using BITS. Trying net.webclient"
        $workingDir = Get-Location
        (new-object net.webclient).DownloadFile($url, "$workingDir\$filename")
    }
}

# Downloads (unless already downloaded) a file
function DownloadIfNeeded($url, $filename) {
    if (-Not $filename) {
        $filename = Split-Path $url -Leaf
    }
    if (Test-Path "./$filename") {
        Write-Host "Already downloaded $filename"
    } else {
        DownloadToFile $url $filename
    }
}

# Downloads (unless already downloaded) and extracts a zip file to a destination path
function DownloadAndUnzipIfNeeded($url, $destPath) {
    $zipFilename = Split-Path $url -Leaf
    DownloadIfNeeded $url $zipFilename
    Write-Host "Extracting $zipFilename to $destPath"
    Expand-Archive -Force -LiteralPath ./$zipFilename -DestinationPath $destPath
}

# Get CPU Architecture
# Possible return values: amd64, x64, x86, arm64, arm
function Get-Machine-Architecture() {
    # On PS x86, PROCESSOR_ARCHITECTURE reports x86 even on x64 systems.
    # To get the correct architecture, we need to use PROCESSOR_ARCHITEW6432.
    # PS x64 doesn't define this, so we fall back to PROCESSOR_ARCHITECTURE.
    # Possible values: amd64, x64, x86, arm64, arm
    if( $ENV:PROCESSOR_ARCHITEW6432 -ne $null )
    {    
        return $ENV:PROCESSOR_ARCHITEW6432
    }
    return $ENV:PROCESSOR_ARCHITECTURE
}

# Select one of 4 strings based on CPU architecure
# If a string is not provided for the users CPU architecture an error is thrown
# informing them to find a workaround
function GetCPUArchString($x86_32, $x86_64, $arm_32, $arm_64) {
    $archId = (Get-Machine-Architecture).ToLower()
    $archIdToStr = @{
        "x86" = "$x86_32";
        "x64" = "$x86_64";
        "amd64" = "$x86_64";
        "arm" = "$arm_32";
        "arm64" = "$arm_64";
    }
    if (-Not $archIdToStr[$archId]) {
        Write-Host "Your CPU architure $archId does not appear to be supported"
        Write-Host "Please try to install manually or emulate a different CPU architecture"
        throw "$archId not supported"
    }
    return $archIdToStr[$archId]
}

# Set Path for this powershell session using Machine and User persistent path values
function RefreshPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}

# Reads Github releases page and uses regex to match latest download file url
# 
# Example parameters:
# org = oneclick
# project = rubyinstaller2
# fileNameRegex = RubyInstaller-2[0-9\-\.]*\/rubyinstaller-devkit-2[0-9\-\.]*-x64\.exe
# defaultLink = https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.5-1/rubyinstaller-2.7.5-1-x64.exe
# searchQuery = RubyInstaller-2
function GetLatestDownloadViaGithub($org, $project, $fileNameRegex, $defaultLink, $searchQuery) {
    try {
        $regex = "\/$org\/$project\/releases\/download\/$fileNameRegex"
        $releasesHTML = (new-object net.webclient).DownloadString("https://github.com/$org/$project/releases?q=$searchQuery")
        if ($releasesHTML -match $regex) {
            return "https://github.com" + $Matches[0]
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to determine latest version for $project. Using $defaultLink"
    return $defaultLink
}
