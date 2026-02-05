$pkgPath = Get-ChildItem "$env:LOCALAPPDATA\Packages" -Filter "Microsoft.Windows.ContentDeliveryManager_*" -Directory -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $pkgPath) {
    Write-Host "ERROR: Windows Spotlight folder not found. Make sure Windows Spotlight is enabled." -ForegroundColor Red
    exit 1
}

$source = "$($pkgPath.FullName)\LocalState\Assets"

if (-not (Test-Path $source)) {
    Write-Host "ERROR: Assets folder not found at $source" -ForegroundColor Red
    exit 1
}

$dest = "$(Get-Location)\Lockscreen_Backups"

New-Item -ItemType Directory -Path $dest -Force | Out-Null

$count = 0
Get-ChildItem $source -ErrorAction SilentlyContinue | Where-Object { $_.Length -gt 100KB } | ForEach-Object {
    $count++
    Copy-Item $_.FullName "$dest\wallpaper_$count.jpg"
}

if ($count -eq 0) {
    Write-Host "No wallpapers found. Windows Spotlight might not have downloaded any images yet." -ForegroundColor Yellow
} else {
    Write-Host "Lockscreen images copied to: $dest" -ForegroundColor Green
    Write-Host "Total: $count files" -ForegroundColor Green
}
