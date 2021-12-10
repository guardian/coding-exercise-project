. ($PSScriptRoot + "\common.ps1")

if ( (Python3Installed) ) {
    Write-Output "Python 3 not installed. Installing python 3.10..."
    Write-Output "Please follow installer steps"
    $url = "https://www.python.org/ftp/python/3.10.1/python-3.10.1-amd64.exe"
    $installerFilename = "python-3.10.1-amd64.exe"
    if ( -Not (Test-Path -Path "./$installerFilename") ) {
        Write-Output "Downloading Python 3.10 64bit"
        DownloadToFile $url $installerFilename
    }

    $installArgs = 'InstallAllUsers=1 Include_launcher=1 Include_test=1 PrependPath=1'
    Start-Process "./$installerFilename" -Wait -ArgumentList $installArgs
}

RefreshPath

python -m venv ./venv

./venv/Scripts/Activate.ps1
