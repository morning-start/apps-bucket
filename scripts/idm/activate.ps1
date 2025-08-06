# Parse command line arguments
param(
    [switch]$update
)

function Invoke-IDMActivationScript {
    [CmdletBinding()]
    param(
        [switch]$update
    )
    
    # Enable TLSv1.2 for compatibility with older clients
    $ErrorActionPreference = "Stop"
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    
    $DownloadURL = 'https://raw.githubusercontent.com/lstprjct/IDM-Activation-Script/main/IAS.cmd'
    $FilePath = "$persist_dir\IAS.cmd"
    
    # Check if file exists or if update is forced
    if (!(Test-Path $FilePath) -or $update) {
        Write-Host "Downloading latest IAS.cmd script..."
        $response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing
        $ScriptArgs = "$args "
        $prefix = "@REM IAS `r`n"
        $content = $prefix + $response
        Set-Content -Path $FilePath -Value $content
        Write-Host "Script downloaded to $FilePath"
    } else {
        Write-Host "Script already exists. Use -update to force download."
    }
    
    Start-Process $FilePath $ScriptArgs -Wait
}

# Call the function with provided arguments
Invoke-IDMActivationScript -update:$update
