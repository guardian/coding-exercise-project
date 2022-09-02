:: Setup python virtual environment if it doesn't already exist
@echo off
if not exist venv\ (
    python -m venv .\venv
)

call .\venv\Scripts\activate.bat

python -m unittest discover
