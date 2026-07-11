function New-SymlinkIfNotExists {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "The path of the symlink to create")]
        [string]$SymlinkPath,

        [Parameter(Mandatory = $true, HelpMessage = "The target path the symlink points to")]
        [string]$TargetPath
    )

    # Check whether the target path is already a symlink
    if (Test-Path -Path $SymlinkPath -ErrorAction SilentlyContinue) {
        $item = Get-Item -Path $SymlinkPath -Force -ErrorAction SilentlyContinue
        if ($item -and $item.Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
            Write-Verbose "$SymlinkPath is already a symlink, skipping"
            return
        }
    }

    try {
        # Ensure the target directory exists
        if (-not (Test-Path -Path $TargetPath)) {
            if ($PSCmdlet.ShouldProcess($TargetPath, "Create target directory")) {
                New-Item -ItemType Directory -Path $TargetPath -Force | Out-Null
                Write-Verbose "Created target directory: $TargetPath"
            }
        }

        # Handle an existing source path
        if (Test-Path -Path $SymlinkPath) {
            # Check whether the directory is empty
            $hasContent = (Get-ChildItem -Path $SymlinkPath -Force -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0

            if ($hasContent) {
                if ($PSCmdlet.ShouldProcess($SymlinkPath, "Move content to target directory $TargetPath")) {
                    # Move the directory contents, not the directory itself
                    Move-Item -Path "$SymlinkPath\*" -Destination $TargetPath -Force -ErrorAction Stop
                    Write-Verbose "Moved $SymlinkPath content to $TargetPath"
                }
            }

            # Remove the original path (whether empty or not)
            if ($PSCmdlet.ShouldProcess($SymlinkPath, "Remove original path")) {
                Remove-Item -Path $SymlinkPath -Recurse -Force -ErrorAction Stop
                Write-Verbose "Removed original path: $SymlinkPath"
            }
        }

        # Create the symlink
        if ($PSCmdlet.ShouldProcess($SymlinkPath, "Create symlink pointing to $TargetPath")) {
            New-Item -ItemType SymbolicLink -Path $SymlinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
            Write-Verbose "Successfully created symlink: $SymlinkPath -> $TargetPath"
        }
    } catch {
        Write-Error "Operation failed: $_"
        throw  # Re-throw so the caller can handle it
    }
}

# Safe invocation
if ($args.Count -lt 2) {
    Write-Error "Usage: link.ps1 <SymlinkPath> <TargetPath>"
    exit 1
}

New-SymlinkIfNotExists $args[0] $args[1]
