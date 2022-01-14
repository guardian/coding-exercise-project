. ($PSScriptRoot + "/../../common.ps1")

function Python3Installed() {
    RefreshPath
    if ( Test-CommandExists python ) {
        $versionString = python --version
        if ($versionString.StartsWith("Python 3.")) {
            return $True
        }
    }
    return $False
}

if ( -Not (Python3Installed) ) {
    Write-Host "Python 3 not installed.."
    AskPermissionForGlobalInstall "Python 3.10.1" "Please install Python 3.10.1 manually then re-run ./script/setup.ps1"
    Write-Host "Please follow installer steps"
    $url = "https://www.python.org/ftp/python/3.10.1/python-3.10.1-amd64.exe"
    $installerFilename = "python-3.10.1-amd64.exe"
    if ( -Not (Test-Path -Path "./$installerFilename") ) {
        Write-Host "Downloading Python 3.10 64bit"
        DownloadToFile $url $installerFilename
    }

    $installArgs = 'InstallAllUsers=1 Include_launcher=1 Include_test=1 PrependPath=1'
    Start-Process "./$installerFilename" -Wait -ArgumentList $installArgs
}

RefreshPath

python -m venv ./venv

./venv/Scripts/Activate.ps1
