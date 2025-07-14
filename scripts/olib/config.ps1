$configFilePath = "$persist\config\config.json"

if (-not (Test-Path -Path $configFilePath)) {
    $config = @{
        "Settings" = @{
            "CacheFolder" = "$persist/cache"
            "DownloadFolder" = "$persist/book"
        }
    }
}
else {
    $config = Get-Content -Path $configFilePath | ConvertFrom-Json

    $config.Settings.CacheFolder = "$persist/cache"
    $config.Settings.DownloadFolder = "$persist/book"
}
ConvertTo-Json $config | Set-Content -Path $configFilePath

Write-Host "Configuration updated successfully."
