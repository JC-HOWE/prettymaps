$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot
$venvPython = Join-Path $PSScriptRoot ".venv\Scripts\python.exe"

if (-not (Test-Path $venvPython)) {
    throw ".venv was not found. Run .\setup_windows.ps1 first."
}

& $venvPython -m streamlit run (Join-Path $PSScriptRoot "app.py")
