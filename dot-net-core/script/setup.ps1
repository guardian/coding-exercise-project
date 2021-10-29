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

if ( Test-CommandExists dotnet ) {
    $DotNetVersion = Invoke-Expression "dotnet --version"
    "It appears you already have dotnet $DotNetVersion installed. You're good to go!"
} else {
    Write-Output "Downloading Dot Net Core Install Script from https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1"
    Write-Output "This script will download the latest version of Dot Net Core"
    Write-Output ""

    (new-object net.webclient).DownloadFile('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1','dotnet-install.ps1')
    . ./dotnet-install.ps1

    $DotNetPath = $env:DOTNET_INSTALL_DIR
    if (!$DotNetPath) {
        $DotNetPath = "$env:LocalAppData\Microsoft\dotnet"
    }
    Write-Output "Dot Net Install directory is " $DotNetPath

    [Environment]::SetEnvironmentVariable("DOTNET_ROOT", $DotNetPath) # Needed to make sure dotnet test works

    $CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ( -Not ( $CurrentPath -like "*dotnet*" ) ) {
        Write-Output "Adding Dot Net Core SDK permanently to User Path"
        [Environment]::SetEnvironmentVariable("Path", $CurrentPath + $DotNetPath, "User")
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    }
    
    
    if ( Test-CommandExists dotnet ) {
        $DotNetVersion = Invoke-Expression "dotnet --version"
        Write-Output "Dot Net Core SDK version $DotNetVersion installed. You're good to go!"
    } else {
        Write-Output "Hmmm something is wrong..."
    }

}
