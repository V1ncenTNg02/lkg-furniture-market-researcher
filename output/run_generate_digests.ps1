# Generate LKG Furniture Market Researcher Word artifacts
# Week ending: 08-05-2026
# Run this script from any directory - it uses absolute paths.

$scriptDir = "e:\GitProject\lkg-furniture-market-researcher\output"
$scriptPath = Join-Path $scriptDir "generate_digests.py"

Write-Host "Checking python-docx..."
$installed = python -c "import docx; print('ok')" 2>$null
if ($installed -ne "ok") {
    Write-Host "Installing python-docx..."
    pip install python-docx --quiet
}

Write-Host "Running digest generator..."
python $scriptPath

Write-Host ""
Write-Host "Done. Check output folder for:"
Write-Host "  $scriptDir\lkg-furniture-gm-weekly-digest-08-05-2026.docx"
Write-Host "  $scriptDir\lkg-furniture-board-weekly-digest-08-05-2026.docx"
Write-Host "  $scriptDir\lkg-furniture-internal-source-log-08-05-2026.docx"
