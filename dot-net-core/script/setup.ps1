. ($PSScriptRoot + "/common.ps1")

$DotNetPath = SetupCommandOnPath dotnet @("$env:LocalAppData/Microsoft/dotnet", "./dotnet")
if ( -Not $DotNetPath ) {
    Write-Output "Downloading Dot Net Core 6.0.101 (approx 243MB download)"
    $archString = GetCPUArchString "x86" "x64" "arm" "arm64"
    $url = "https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.101/dotnet-sdk-6.0.101-win-$archString.zip"
    DownloadAndUnzipIfNeeded $url "./dotnet"
    $DotNetPath = SetupCommandOnPath dotnet @("./dotnet")
}

$env:DOTNET_ROOT = $DotNetPath
Write-Output "dotnet version: $(dotnet --version) installed at $($DotNetPath)"
