. ($PSScriptRoot + "\common.ps1")
function GetLatestRuby2Download($cpuArchId) {
    $defaultLink = ""
    try {
        $64BitRegex = '\/oneclick\/rubyinstaller2\/releases\/download\/RubyInstaller-2[0-9\-\.]*\/rubyinstaller-devkit-2[0-9\-\.]*-x64\.exe'
        $32BitRegex = '\/oneclick\/rubyinstaller2\/releases\/download\/RubyInstaller-2[0-9\-\.]*\/rubyinstaller-devkit-2[0-9\-\.]*-x86\.exe'
        $regex = $64BitRegex
        if ($cpuArchId -eq 0) {
            $regex = $32BitRegex
        }
        $releasesHTML = (new-object net.webclient).DownloadString("https://github.com/oneclick/rubyinstaller2/releases")
        if ($releasesHTML -match $regex) {
            return "https://github.com" + $Matches[0]
        }
    } catch {
        Write-Host $_
    }
    Write-Host "Failed to determine latest version of ruby 2. Using $defaultLink"
    return $defaultLink
}

function GetFilenameFromPath($filepath, $default) {
    if ($filepath -match '\/(?<file>[a-zA-Z\.\-0-9]*)$') {
        return $Matches.file
    }
    return $default
}

if (Test-CommandExists ruby) {
    $rubyVersion = ruby --version
    Write-Host "Ruby already installed $rubyVersion"
} else {
    Write-Host "Ruby not installed. Downloading ruby 2 installer with devkit..."
    $cpuArchId = GetCPUArchId
    $downloadLink = GetLatestRuby2Download($cpuArchId)
    $installerFilename = GetFilenameFromPath($downloadLink, "rubyinstaller.exe")
    if (Test-Path -Path "./$installerFilename") {
        Write-Host "Already downloaded $installerFilename"
    } else {
        DownloadToFile $downloadLink $installerFilename
    }
    Start-Process "./$installerFilename" -NoNewWindow -Wait 
    RefreshPath
    Write-Host "Follow installer instructions then run this setup.ps1 script again to setup this ruby project"
}

gem install bundler:1.16.3
bundle update
bundle install
