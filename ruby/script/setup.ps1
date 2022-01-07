. ($PSScriptRoot + "/../../common.ps1")

if (Test-CommandExists ruby) {
    $rubyVersion = ruby --version
    Write-Host "Ruby already installed $rubyVersion"
} else {
    Write-Host "Ruby not installed. Downloading ruby 2 installer with devkit..."
    $cpuArchStr = GetCPUArchString "" "x64" "" ""
    $fileRegex = "RubyInstaller-2[0-9\-\.]*\/rubyinstaller-devkit-2[0-9\-\.]*-$cpuArchStr\.exe"
    $defaultLink = "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.5-1/rubyinstaller-2.7.5-1-$cpuArchStr.exe"
    $searchQuery = "RubyInstaller-2"
    $downloadUrl = GetLatestDownloadViaGithub "oneclick" "rubyinstaller2" $fileRegex $defaultLink $searchQuery
    Write-Host "Latest Ruby github url is $downloadUrl"
    $installerFilename = Split-Path $downloadUrl -Leaf
    DownloadIfNeeded $downloadUrl $installerFilename
    Start-Process "./$installerFilename" -NoNewWindow -Wait 
    RefreshPath
}

gem install bundler:1.16.3
bundle update
bundle install
