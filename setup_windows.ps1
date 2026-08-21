$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

function Get-PythonCommand {
    if (Get-Command py -ErrorAction SilentlyContinue) {
        try {
            & py -3.12 -c "import sys; assert sys.version_info >= (3, 12)" 2>$null
            if ($LASTEXITCODE -eq 0) {
                return @("py", "-3.12")
            }
        } catch {}
    }

    if (Get-Command python -ErrorAction SilentlyContinue) {
        & python -c "import sys; assert sys.version_info >= (3, 12), sys.version" 2>$null
        if ($LASTEXITCODE -eq 0) {
            return @("python")
        }
    }

    throw "Python 3.12+ was not found. Install Python 3.12 or newer, then run this script again."
}

$pythonCommand = Get-PythonCommand
$venvPython = Join-Path $PSScriptRoot ".venv\Scripts\python.exe"

if (-not (Test-Path $venvPython)) {
    Write-Host "Creating .venv with Python 3.12+..."
    if ($pythonCommand.Count -eq 2) {
        & $pythonCommand[0] $pythonCommand[1] -m venv .venv
    } else {
        & $pythonCommand[0] -m venv .venv
    }
}

Write-Host "Upgrading packaging tools..."
& $venvPython -m pip install --upgrade pip setuptools wheel

Write-Host "Installing prettymaps from this fork in editable mode..."
& $venvPython -m pip install -e .

Write-Host ""
Write-Host "Setup complete. Start the app with:"
Write-Host "  .\run_windows.ps1"
Write-Host ""
Write-Host "No virtual-environment activation is required; the run script uses .venv directly."
