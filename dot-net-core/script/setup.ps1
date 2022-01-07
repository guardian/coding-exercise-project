. ($PSScriptRoot + "/../../common.ps1")

$DotNetPath = SetupCommandOnPath dotnet @("$env:DOTNET_INSTALL_DIR", "$env:LocalAppData\Microsoft\dotnet")
if ( -Not $DotNetPath ) {
    Write-Output "Downloading Dot Net Core Install Script from https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1"
    Write-Output "This script will download the latest version of Dot Net Core"
    Write-Output ""

    DownloadToFile 'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1' "$(Get-Location)/dotnet-install.ps1"
    . ./dotnet-install.ps1 -Version "6.0.101"
    $DotNetPath = SetupCommandOnPath dotnet @("$env:DOTNET_INSTALL_DIR", "$env:LocalAppData\Microsoft\dotnet")
}

$env:DOTNET_ROOT = $DotNetPath
Write-Output "dotnet version: $(dotnet --version) installed at $($DotNetPath)"

[Environment]::SetEnvironmentVariable("DOTNET_ROOT", $DotNetPath) # Needed to make sure dotnet test works

# Add .Net Core to User Path to persist between installs
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ( -Not ( $CurrentPath -like "*dotnet*" ) ) {
    Write-Output "Adding Dot Net Core SDK permanently to User Path"
    [Environment]::SetEnvironmentVariable("Path", "$CurrentPath;$DotNetPath", "User")
}