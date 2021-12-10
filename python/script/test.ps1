. ($PSScriptRoot + "\common.ps1")

RunSetupIfNeeded

./venv/Scripts/Activate.ps1

python -m unittest discover