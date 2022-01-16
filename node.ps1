. ($PSScriptRoot + "/common.ps1")
## NodeJS related scripts: Used by javascript and typescript

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
    if (-Not (UsingCorrectNodeVersion)) {
        Write-Output "Correct version of Node not installed."
        Write-Output "Use ./script/setup or nvm to setup correct version of node"
    }
}

function DownloadNVM() {
    Write-Output "Downloading temporary version of nvm for session"
    $url = "https://github.com/coreybutler/nvm-windows/releases/download/1.1.8/nvm-noinstall.zip"
    DownloadAndUnzipIfNeeded $url "./nvm"
    $pwd = pwd
    $env:NVM_HOME = "$pwd\nvm"
    $env:NVM_SYMLINK = "$pwd\nvm\nodejs"
    $env:Path = "$env:Path;$env:NVM_HOME;%NVM_SYMLINK%"
    "" | Out-File -Filepath "$pwd\nvm\settings.txt"
    nvm root "$pwd\nvm"
    .\nvm\elevate.cmd
}

function SetupNodeJS() {
    if ( UsingCorrectNodeVersion ) {
        Write-Output "Correct node version installed. You're good to go!"
    } else {
        $requiredNodeVersion = $(cat .nvmrc)
        Write-Output "Switching to $requiredNodeVersion using nvm"
        if (Test-CommandExists nvm) {
            Write-Output "nvm already installed" 
            nvm install $requiredNodeVersion
            nvm use $requiredNodeVersion
        } else {
            DownloadNVM
            nvm install $requiredNodeVersion
            $env:Path = "$env:Path;$(pwd)\nvm\$requiredNodeVersion"
        }
    }
}
