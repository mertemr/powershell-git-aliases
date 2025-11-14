# Git command alias to full command mappings
# These mappings convert your PowerShell function aliases (ga, gb, gc, etc.)
# directly to git commands
$script:GitCommandMappings = @{
    # Single letter aliases
    'a'       = 'add'
    'aa'      = 'add --all'
    'au'      = 'add --update'
    'apa'     = 'add --patch'
    'ap'      = 'apply'

    # Branch commands (b*)
    'b'       = 'branch -vv'
    'ba'      = 'branch -a -v'
    'ban'     = 'branch -a -v --no-merged'
    'bd'      = 'branch -D'
    'bl'      = 'blame -b -w'
    'bnm'     = 'branch --no-merged'
    'br'      = 'branch --remote'

    # Bisect commands (bs*)
    'bs'      = 'bisect'
    'bsb'     = 'bisect bad'
    'bsg'     = 'bisect good'
    'bsr'     = 'bisect reset'
    'bss'     = 'bisect start'

    # Clone commands (cl*)
    'cl'      = 'clone --recurse-submodules'
    'cll'     = 'clone --local --recurse-submodules'
    'clb'     = 'clone --branch'
    'cl1'     = 'clone --depth 1'

    # Commit commands (c*)
    'c'       = 'commit -v'
    'c!'      = 'commit -v --amend'
    'cn!'     = 'commit -v --no-edit --amend'
    'ca'      = 'commit -v -a'
    'ca!'     = 'commit -v -a --amend'
    'can!'    = 'commit -v -a --no-edit --amend'
    'cans!'   = 'commit -v -a -s --no-edit --amend'
    'cv'      = 'commit -v --no-verify'
    'cav'     = 'commit -a -v --no-verify'
    'cav!'    = 'commit -a -v --no-verify --amend'
    'cm'      = 'commit -m'
    'cam'     = 'commit -a -m'
    'cmsg'    = 'commit -m'
    'cs'      = 'commit -S'
    'cfx'     = 'commit --fixup'
    'cf'      = 'config --list'

    # Checkout commands (co*)
    'co'      = 'checkout'
    'cb'      = 'checkout -b'
    'od'      = 'checkout develop'
    'om'      = 'checkout main'
    'ot'      = 'checkout testing'

    # Cherry-pick (cp*)
    'cp'      = 'cherry-pick'
    'cpa'     = 'cherry-pick --abort'
    'cpc'     = 'cherry-pick --continue'

    # Diff commands (d*)
    'd'       = 'diff'
    'dca'     = 'diff --cached'
    'ds'      = 'diff --stat'
    'dsc'     = 'diff --stat --cached'
    'dt'      = 'diff-tree --no-commit-id --name-only -r'
    'dw'      = 'diff --word-diff'
    'dwc'     = 'diff --word-diff --cached'
    'dto'     = 'difftool'
    'dg'      = 'diff --no-ext-diff'

    # Fetch commands (f*)
    'f'       = 'fetch'
    'fa'      = 'fetch --all --prune'
    'fo'      = 'fetch origin'

    # Pull commands (l*)
    'l'       = 'pull'
    'lr'      = 'pull --rebase'
    'la'     = 'pull --rebase --autostash'
    'lv'     = 'pull --rebase -v'
    'lom'    = 'pull --rebase origin main'
    'lum'     = 'pull upstream main'
    'll'      = 'pull origin'

    # Log commands (l*)
    'lg'      = 'log --stat'
    'lgg'     = 'log --graph'
    'lgga'    = 'log --graph --decorate --all'
    'lo'      = 'log --oneline --decorate --color'
    'log'     = 'log --oneline --decorate --color --graph'
    'loga'    = 'log --oneline --decorate --color --graph --all'
    'lom'     = 'log --oneline --decorate --color'
    'lod'     = 'log --oneline --decorate --color $()..'
    'loo'     = "log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
    'lgm'     = 'log --graph --max-count=10'
    'lgp'     = 'log --stat --color -p'
    'lol'     = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    'lola'    = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

    # Merge commands (m*)
    'm'       = 'merge'
    'ma'      = 'merge --abort'
    'mc'      = 'merge --continue'
    'ms'      = 'merge --squash --no-commit'
    'mf'      = 'merge --ff-only'
    'mt'      = 'mergetool --no-prompt'
    'mtvim'   = 'mergetool --no-prompt --tool=vimdiff'
    'mom'     = 'merge origin/main'
    'mum'     = 'merge upstream/main'

    # Push commands (p*)
    'p'       = 'push'
    'p!'      = 'push --force-with-lease'
    'po'      = 'push origin'
    'po!'     = 'push --force-with-lease origin'
    'pv'      = 'push --no-verify'
    'pv!'     = 'push --no-verify --force-with-lease'
    'pd'      = 'push --dry-run'
    'pf'      = 'push --force-with-lease'
    'pf!'     = 'push --force'
    'poat'    = 'push origin --all && push origin --tags'

    # Remote commands (r*)
    'r'       = 'remote -vv'
    'ra'      = 'remote add'
    'rv'      = 'remote -v'
    'rpo'     = 'remote prune origin'
    'rrm'     = 'remote remove'
    'rset'    = 'remote set-url'
    'rup'     = 'remote update'
    'rmv'     = 'remote rename'

    # Rebase commands (rb*)
    'rb'      = 'rebase'
    'rba'     = 'rebase --abort'
    'rbc'     = 'rebase --continue'
    'rbi'     = 'rebase --interactive'
    'rbs'     = 'rebase --skip'
    'rbd'     = 'rebase develop'
    'rbdi'    = 'rebase develop --interactive'
    'rbdia'   = 'rebase develop --interactive --autosquash'

    # Reset commands (rh*)
    'rh'      = 'reset'
    'rhh'     = 'reset --hard'
    'rhpa'    = 'reset --patch'
    'roh'     = 'reset origin/HEAD --hard'
    'ru'      = 'reset --'

    # Restore commands (rs*)
    'rs'      = 'restore'
    'rss'     = 'restore --source'
    'rst'     = 'restore --staged'

    # Remove (rm*)
    'rm'      = 'rm'
    'rmc'     = 'rm --cached'

    # Revert (rev*)
    'rev'     = 'revert'

    # Show (sp*)
    'sh'      = 'show'
    'shps'     = 'show --pretty=short --show-signature'

    # Status commands (s*)
    'sb'      = 'status -sb'
    'ss'      = 'status -s'
    'st'      = 'status'
    'si'      = 'submodule init'
    'scam'    = 'commit -S -a -m'

    # Stash commands (sta*)
    'sta'     = 'stash'
    'stad'    = 'stash drop'
    'stal'    = 'stash list'
    'stap'    = 'stash pop'
    'stas'    = 'stash show --text'
    'staa'    = 'stash apply'
    'stac'    = 'stash clear'

    # Submodule (su*)
    'su'      = 'submodule update'
    'sur'     = 'submodule update --recursive'
    'suri'    = 'submodule update --recursive --init'

    # Switch (sw*)
    'sw'      = 'switch'
    'swc'     = 'switch --create'

    # Tag (t*)
    'ts'      = 'tag -s'
    'tv'      = 'tag | sort -V'
    'vt'      = 'verify-tag'

    # SVN (s*)
    'sd'      = 'svn dcommit'
    'sr'      = 'svn rebase'

    # Whatchanged (wch*)
    'wch'     = 'whatchanged -p --abbrev-commit --pretty=medium'

    # Worktree (wt*)
    'wt'      = 'worktree'
    'wta'     = 'worktree add'
    'wtls'    = 'worktree list'
    'wtlo'    = 'worktree lock'
    'wtmv'    = 'worktree move'
    'wtpr'    = 'worktree prune'
    'wtrm'    = 'worktree remove'
    'wtulo'   = 'worktree unlock'

    # Git Flow commands (f*)
    'fb'      = 'flow bugfix'
    'ff'      = 'flow feature'
    'fr'      = 'flow release'
    'fh'      = 'flow hotfix'
    'fs'      = 'flow support'
    'fbs'     = 'flow bugfix start'
    'ffs'     = 'flow feature start'
    'frs'     = 'flow release start'
    'fhs'     = 'flow hotfix start'
    'fss'     = 'flow support start'
    'fbt'     = 'flow bugfix track'
    'fft'     = 'flow feature track'
    'frt'     = 'flow release track'
    'fht'     = 'flow hotfix track'
    'fst'     = 'flow support track'
    'fp'      = 'flow publish'

    # Misc
    'clean'   = 'clean -di'
    'clean!'  = 'clean -dfx'
    'count'   = 'shortlog -sn'
    'ignore'  = 'update-index --assume-unchanged'
    'unignore'= 'update-index --no-assume-unchanged'
    'up'      = 'pull --rebase'
    'upv'     = 'pull --rebase -v'
    'upa'     = 'pull --rebase --autostash'
    'upav'    = 'pull --rebase --autostash -v'
    'u'       = 'push upstream'
}

function Get-GitCommandMapping {
    param([string]$alias)
    return $script:GitCommandMappings[$alias]
}

function Get-AllGitCommandMappings {
    return $script:GitCommandMappings
}

Export-ModuleMember -Function Get-GitCommandMapping, Get-AllGitCommandMappings
