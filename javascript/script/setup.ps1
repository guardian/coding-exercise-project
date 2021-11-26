. ($PSScriptRoot + "\common.ps1")

function DownloadNVM() {
    Write-Output "Downloading temporary version of nvm for session"
    $url = "https://github.com/coreybutler/nvm-windows/releases/download/1.1.8/nvm-noinstall.zip"
    $zipFilename = "nvm-nosetup.zip"
    DownloadToFile $url $zipFilename
    Remove-Item -LiteralPath "nvm" -Force -Recurse
    Expand-Archive -LiteralPath ./$zipFilename -DestinationPath "./nvm"
    $pwd = pwd
    $env:NVM_HOME = "$pwd\nvm"
    $env:NVM_SYMLINK = "$pwd\nvm\nodejs"
    $env:Path = "$env:Path;$env:NVM_HOME;%NVM_SYMLINK%"
    "" | Out-File -Filepath "$pwd\nvm\settings.txt"
    nvm root "$pwd\nvm"
    .\nvm\elevate.cmd
}

function SetupNode() {
    if ( UsingCorrectNodeVersion ) {
        Write-Output "Correct node version installed. You're good to go!"
    } else {
        $requiredNodeVersion = $(cat .nvmrc)
        DownloadNVM
        Write-Output "Switching to $requiredNodeVersion using nvm"
        nvm install $requiredNodeVersion
        $env:Path = "$env:Path;$(pwd)\nvm\$requiredNodeVersion"
        cp "$(pwd)/nvm/$requiredNodeVersion/node64.exe" "$(pwd)/nvm/$requiredNodeVersion/node.exe"
    }
}

SetupNode

npm install