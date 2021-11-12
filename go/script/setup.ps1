. ($PSScriptRoot + "\common.ps1")

function GetInstallerSuffix() {
    $archId = GetCPUArchId
    $archIdToSuffix = @{
        0 = "386.msi"
        5 = "arm64.msi"
        9 = "amd64.msi"
    }
    return $archIdToSuffix[$archId]
}

function GetLatestGoVersion() {
    $defaultVersion = "1.17.3"
    try {
        $goDownloadHTML = (new-object net.webclient).DownloadString("https://golang.org/dl/")
        if ($goDownloadHTML -match 'go(?<semver>[0-9\.]*)\.windows-amd64.msi') {
            return $Matches.semver
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to detect latest version of go. Using $defaultVersion"
    return $defaultVersion
}

if (Test-CommandExists go) {
    $goVersion = go version
    Write-Host "$goVersion is already installed"
} else {
    Write-Host "Downloading and installing go"
    $suffix = GetInstallerSuffix
    $latestGoVersion = GetLatestGoVersion
    $goInstallerFilename = "go$latestGoVersion.windows-$suffix"
    $goInstallerUrl = "https://golang.org/dl/$goInstallerFilename"
    if (Test-Path -Path "./$goInstallerFilename") {
        Write-Host "$goInstallerFilename already downloaded. Launching..."
        Start-Process "./$goInstallerFilename"
    } else {
        DownloadToFile $goInstallerUrl $goInstallerFilename
        if (Test-Path -Path "./$goInstallerFilename") {
            Start-Process "./$goInstallerFilename"
        } else {
            Write-Output "Failed to download and install go. Visit https://golang.org/dl/ to download go"
        }
    }
    RefreshPath
}