$upgradeOutput = winget upgrade | Select-Object -Skip 8
$ids = @()
foreach ($line in $upgradeOutput) {
    if ([string]::IsNullOrWhiteSpace($line)) {
        continue
    }
    $columns = $line -split '\s{2,}'
    if ($columns.Count -ge 4) {
        $id = $columns[1].Trim()
        if (-not [string]::IsNullOrWhiteSpace($id) -and $id -ne "Id") {
            $ids += $id
        }
    }
}
$totalPackages = $ids.Count
Write-Host "Found $totalPackages packages to upgrade." -ForegroundColor Cyan
$counter = 0
foreach ($id in $ids) {    
        $counter++
        Write-Host "[$counter/$totalPackages] Upgrading package: $id" -ForegroundColor Yellow
        winget upgrade $id --accept-source-agreements --accept-package-agreements
        Write-Host "----------------------------------------" -ForegroundColor Gray    
}
Write-Host "All package upgrades completed!" -ForegroundColor Green
