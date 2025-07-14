$configFilePath = "$persist_dir\config\config.json"

if (-not (Test-Path -Path $configFilePath)) {
    $config = @{
        "Settings" = @{
            "CacheFolder" = "$persist_dir\cache"
            "DownloadFolder" = "$persist_dir\book"
        }
    }
}
else {
    $config = Get-Content -Path $configFilePath | ConvertFrom-Json

    $config.Settings.CacheFolder = "$persist_dir\cache"
    $config.Settings.DownloadFolder = "$persist_dir\book"
}
ConvertTo-Json $config | Set-Content -Path $configFilePath
Write-Host "Configuration updated successfully."
