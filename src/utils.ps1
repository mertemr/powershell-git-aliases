<#
.SYNOPSIS
	Get current git branch.
#>
function Get-Git-CurrentBranch {
    $symbolicRef = git symbolic-ref --quiet HEAD 2>$null
    if ($LASTEXITCODE -eq 0) {
        return $symbolicRef -replace '^refs/heads/', ''
    } else {
        return git rev-parse --short HEAD 2>$null
    }
}

function Get-Git-MainBranch {
    git rev-parse --git-dir *> $null
    if ($LASTEXITCODE -ne 0) {
        return
    }

    $defaultBranchConfig = git config --get init.defaultBranch
    if ($defaultBranchConfig -ne $null -and $defaultBranchConfig -ne '') {
		return $defaultBranchConfig
	}

    $branches = @('main', 'master', 'trunk')

    foreach ($branch in $branches) {
        & git show-ref -q --verify "refs/heads/$branch"
        if ($LASTEXITCODE -eq 0) {
            return $branch
        }
    }

    return 'master'
}

function Get-Git-DevelopBranch {
	$branches = @('dev', 'develop', 'development')

	foreach ($branch in $branches) {
		& git show-ref -q --verify "refs/heads/$branch"
		if ($LASTEXITCODE -eq 0) {
			return $branch
		}
	}

	Write-Error "Neither 'dev' nor 'develop' branches exist in the current repository."
	return $null
}

function Test-BranchHasWip {
	$currentBranch = Get-Git-CurrentBranch

	if (-not $currentBranch) {
		Write-Error "Could not determine the current branch."
		return $false
	}

	$wipCommit = git log --pretty=format:"%s" -n 1 | Select-String -Pattern 'WIP' -CaseSensitive
	if ($wipCommit) {
		Write-Host "Current branch '$currentBranch' has a WIP commit." -ForegroundColor Yellow
		return $true
	} else {
		Write-Host "Current branch '$currentBranch' does not have a WIP commit." -ForegroundColor Green
		return $false
	}
}

# Don't add `Remove-Alias` on PowerShell >= 6.
# PowerShell >= 6 already has built-in `Remove-Alias`.
# Let use built-in `Remove-Alias` on PowerShell >= 6.
if ($PSVersionTable.PSVersion.Major -le 5) {
	function Remove-Alias ([string] $AliasName) {
		while (Test-Path Alias:$AliasName) {
			Remove-Item Alias:$AliasName -Force 2> $null
		}
	}
}

function Format-AliasDefinition {
	param (
		[Parameter(Mandatory = $true)][string] $Definition
	)

	$definitionLines = $Definition.Trim() -split "`n" | ForEach-Object {
		$line = $_.TrimEnd()

		# Trim 1 indent
		if ($_ -match "^`t") {
			return $line.Substring(1)
		}
		elseif ($_ -match '^    ') {
			return $line.Substring(4)
		}

		return $line

	}

	return $definitionLines -join "`n"
}

<#
.SYNOPSIS
	Get git aliases' definition.
.DESCRIPTION
	Get definition of all git aliases or specific alias.
.EXAMPLE
	PS C:\> Get-Git-Aliases
	Get definition of all git aliases.
.EXAMPLE
	PS C:\> Get-Git-Aliases -Alias gst
	Get definition of `gst` alias.
#>
function Get-Git-Aliases ([string] $Alias) {
	$esc = [char] 27
	$green = 32
	$magenta = 35

	$Alias = $Alias.Trim()
	$blacklist = @(
		'Get-Git-CurrentBranch',
		'Remove-Alias',
		'Format-AliasDefinition',
		'Get-Git-Aliases',
		'Write-Host-Deprecated'
	)
	$aliases = Get-Command -Module git-aliases | Where-Object { $_ -notin $blacklist }

	if (-not ([string]::IsNullOrEmpty($Alias))) {
		$foundAliases = $aliases | Where-Object -Property Name -Value $Alias -EQ

		if ($foundAliases -is [array]) {
			return Format-AliasDefinition($foundAliases[0].Definition)
		}
		else {
			return Format-AliasDefinition($foundAliases.Definition)
		}
	}

	$aliases = $aliases | ForEach-Object {
		$name = $_.Name
		$definition = Format-AliasDefinition($_.Definition)
		$definition = "$definition`n" # Add 1 line break for some row space

		return [PSCustomObject]@{
			Name       = $name
			Definition = $definition
		}
	}

	$cols = @(
		@{
			Name       = 'Name'
			Expression = {
				# Print alias name in green
				"$esc[$($green)m$($_.Name)$esc[0m"
			}
		},
		@{
			Name       = 'Definition'
			Expression = {
				# Print alias definition in yellow
				"$esc[$($magenta)m$($_.Definition)$esc[0m"
			}
		}
	)

	return Format-Table -InputObject $aliases -AutoSize -Wrap -Property $cols
}

<#
.SYNOPSIS
	Print deprecated message.
.DESCRIPTION
	Print a colored message telling that a specific alias ($previous)
	is deprecated, suggesting the use of another alias ($next).
.EXAMPLE
	PS C:\> Write-Host-Deprecated "gup" "gpr"
	[git-aliases] gup is a deprecated alias, use "gpr" instead.
#>
function Write-Host-Deprecated {
	param (
		[Parameter(Mandatory = $true)][string] $previous,
		[Parameter(Mandatory = $true)][string] $next
	)

	Write-Host "[git-aliases] " -ForegroundColor Yellow -NoNewLine
	Write-Host "${previous}" -ForegroundColor Red -NoNewLine
	Write-Host " is a deprecated alias, use " -ForegroundColor Yellow -NoNewLine
	Write-Host """${next}""" -ForegroundColor Green -NoNewLine
	Write-Host " instead.`n" -ForegroundColor Yellow
}
