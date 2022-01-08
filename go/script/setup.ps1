. ($PSScriptRoot + "/../../common.ps1")

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
    return $defaultVersion
}

if (Test-CommandExists go) {
    $goVersion = go version
    Write-Host "$goVersion is already installed"
} else {
    Write-Host "Downloading and installing go"
    $suffix = GetCPUArchString "386.msi" "amd64.msi" "" "arm64.msi"
    $latestGoVersion = GetLatestGoVersion
    $goInstallerFilename = "go$latestGoVersion.windows-$suffix"
    $goInstallerUrl = "https://golang.org/dl/$goInstallerFilename"
    DownloadIfNeeded $goInstallerUrl $goInstallerFilename
    Start-Process "./$goInstallerFilename"
    RefreshPath
}

$env:GO111MODULE="off"