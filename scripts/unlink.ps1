<#
.SYNOPSIS
    Remove a symbolic link.

.DESCRIPTION
    This function removes the specified symbolic link.
    It checks whether the path is a symlink; if so it is removed, otherwise the operation is skipped.

.PARAMETER SymlinkPath
    The path of the symbolic link to remove.
#>
function Remove-Symlink {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "The path of the symlink to remove")]
        [string]$SymlinkPath
    )

    # Check whether the path is a symlink
    $item = Get-Item -Path $SymlinkPath -Force -ErrorAction SilentlyContinue
    if (-not $item -or -not $item.Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
        Write-Verbose "$SymlinkPath is not a symlink, skipping"
        return
    }

    try {
        # Remove only the symlink itself
        if ($PSCmdlet.ShouldProcess($SymlinkPath, "Remove symlink")) {
            Remove-Item -Path $SymlinkPath -Force -ErrorAction Stop
            Write-Verbose "Removed symlink: $SymlinkPath"
        }
    } catch {
        Write-Error "Failed to remove symlink: $_"
        throw
    }
}

Remove-Symlink $args[0]
