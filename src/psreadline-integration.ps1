using namespace System.Management.Automation.Language

. $PSScriptRoot\git-command-mappings.ps1

function Initialize-GitCommandValidation {
    <#
    .SYNOPSIS
        Automatically expands git command shortcuts to full commands

    .DESCRIPTION
        Uses PSReadLine to automatically expand git command shortcuts when you press Enter.
        Example: "git cm -m 'test'" -> "git commit -m 'test'"

    .EXAMPLE
        Initialize-GitCommandValidation
    #>

    # Check if PSReadLine module is available
    if (-not (Get-Module -Name PSReadLine)) {
        Write-Warning "PSReadLine module not found. Git command validation cannot be initialized."
        return
    }

    Set-PSReadLineOption -CommandValidationHandler {
        param([CommandAst]$CommandAst)

        if ($CommandAst.GetCommandName() -ne 'git' -or -not $CommandAst.GetCommandName().StartsWith('g')) {
            return
        }

        if ($CommandAst.CommandElements.Count -lt 2) {
            return
        }

        $gitSubCommand = $CommandAst.CommandElements[1]

        if ($gitSubCommand -isnot [StringConstantExpressionAst]) {
            return
        }

        $subCommandText = $gitSubCommand.Extent.Text

        $fullCommand = Get-GitCommandMapping -alias $subCommandText

        if ($fullCommand) {
            [Microsoft.PowerShell.PSConsoleReadLine]::Replace(
                $gitSubCommand.Extent.StartOffset,
                $gitSubCommand.Extent.EndOffset - $gitSubCommand.Extent.StartOffset,
                $fullCommand
            )
        }
    }

    Set-PSReadLineKeyHandler -Chord Enter -Function ValidateAndAcceptLine

    Write-Host "Git command validation initialized. Git shortcuts will auto-expand when you press Enter." -ForegroundColor Green
}

function Show-GitCommandMappings {
    <#
    .SYNOPSIS
        Displays all available git command shortcuts

    .DESCRIPTION
        Shows a table of all available git command shortcuts and their full command equivalents

    .EXAMPLE
        Show-GitCommandMappings
    #>

    $mappings = Get-AllGitCommandMappings

    Write-Host "`nAvailable Git Command Shortcuts:" -ForegroundColor Cyan
    Write-Host ("=" * 70) -ForegroundColor Cyan

    $mappings.GetEnumerator() |
        Sort-Object Key |
        Format-Table @{
            Label = "Shortcut"
            Expression = { $_.Key }
            Width = 15
        }, @{
            Label = "Expands To"
            Expression = { $_.Value }
            Width = 50
        } -AutoSize

    Write-Host "`nUsage: Type 'git <shortcut>' and press Enter. The shortcut will expand automatically." -ForegroundColor Yellow
    Write-Host "Example: 'git cm -m `"message`"' -> 'git commit -m `"message`"'`n" -ForegroundColor Yellow
    Write-Host "Example: 'glr' -> 'git pull --rebase'`n" -ForegroundColor Yellow
}

Export-ModuleMember -Function Initialize-GitCommandValidation, Show-GitCommandMappings
