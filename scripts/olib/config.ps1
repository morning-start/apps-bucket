# 定义 JSON 文件路径
$configFilePath = "$persist\config\config.json"

# 如果文件不存在，则创建一个具有初始配置的文件
if (-not (Test-Path -Path $configFilePath)) {
    $config = @{
        "Settings" = @{
            "CacheFolder" = "$persist/cache"
            "DownloadFolder" = "$persist/book"
        }
    }
}
else {
    # 读取 JSON 文件内容
    $config = Get-Content -Path $configFilePath | ConvertFrom-Json

    # 更新 CacheFolder 和 DownloadFolder 的值
    $config.Settings.CacheFolder = "$persist/cache"
    $config.Settings.DownloadFolder = "$persist/book"
}
# 将更新后的内容写回 JSON 文件
ConvertTo-Json $config | Set-Content -Path $configFilePath

Write-Host "配置已更新或初始化。"
