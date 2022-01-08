. ($PSScriptRoot + "/../../common.ps1")

RunSetupIfNeeded python

./venv/Scripts/Activate.ps1

python -m unittest discover