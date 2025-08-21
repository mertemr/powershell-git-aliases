. $PSScriptRoot\utils.ps1

# Prevent conflict with built-in aliases
Remove-Alias gc -Force -ErrorAction SilentlyContinue
Remove-Alias gcb -Force -ErrorAction SilentlyContinue
Remove-Alias gcm -Force -ErrorAction SilentlyContinue
Remove-Alias gcs -Force -ErrorAction SilentlyContinue
Remove-Alias gl -Force -ErrorAction SilentlyContinue
Remove-Alias gm -Force -ErrorAction SilentlyContinue
Remove-Alias gp -Force -ErrorAction SilentlyContinue
Remove-Alias gpv -Force -ErrorAction SilentlyContinue

function g {
    git $args
}
function ga {
    git add $args
}
function gaa {
    git add --all $args
}
function gau {
    git add --update $args
}
function gapa {
    git add --patch $args
}
function gap {
    git apply $args
}
function gb {
    git branch -vv $args
}
function gba {
    git branch -a -v $args
}
function gban {
    git branch -a -v --no-merged $args
}
function gbd {
    git branch -d $args
}
function gbD {
    git branch -D $args
}
function ggsup {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git branch --set-upstream-to=origin/$currentBranch
    }
}
function gbl {
    git blame -b -w $args
}
function gbs {
    git bisect $args
}
function gbsb {
    git bisect bad $args
}
function gbsg {
    git bisect good $args
}
function gbsr {
    git bisect reset $args
}
function gbss {
    git bisect start $args
}
function gc {
    git commit -v $args
}
function gc! {
    git commit -v --amend $args
}
function gcn! {
    git commit -v --no-edit --amend $args
}
function gca {
    git commit -v -a $args
}
function gca! {
    git commit -v -a --amend $args
}
function gcan! {
    git commit -v -a --no-edit --amend $args
}
function gcv {
    git commit -v --no-verify $args
}
function gcav {
    git commit -a -v --no-verify $args
}
function gcav! {
    git commit -a -v --no-verify --amend $args
}
function gcm {
    git commit -m $args
}
function gcam {
    git commit -a -m $args
}
function gcs {
    git commit -S $args
}
function gscam {
    git commit -S -a -m $args
}
function gcfx {
    git commit --fixup $args
}
function gcf {
    git config --list $args
}
function gcl {
    git clone $args
}
function gclean {
    git clean -di $args
}
function gclean! {
    git clean -dfx $args
}
function gclean!! {
    git reset --hard; git clean -dfx
}
function gcount {
    git shortlog -sn $args
}
function gcp {
    git cherry-pick $args
}
function gcpa {
    git cherry-pick --abort $args
}
function gcpc {
    git cherry-pick --continue $args
}
function gd {
    git diff $args
}
function gdca {
    git diff --cached $args
}
function gds {
    git diff --stat $args
}
function gdsc {
    git diff --stat --cached $args
}
function gdt {
    git diff-tree --no-commit-id --name-only -r $args
}
function gdw {
    git diff --word-diff $args
}
function gdwc {
    git diff --word-diff --cached $args
}
function gdto {
    git difftool $args
}
function gdg {
    git diff --no-ext-diff $args
}
function gignore {
    git update-index --assume-unchanged $args
}
function gf {
    git fetch $args
}
function gfa {
    git fetch --all --prune $args
}
function gfm {
    $defaultBranch = Get-Git-MainBranch
    git fetch origin $defaultBranch --prune
    git merge FETCH_HEAD
}
function gfo {
    git fetch origin $args
}
function gl {
    git pull $args
}
function ggl {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git pull origin $currentBranch
    }
}
function gll {
    git pull origin $args
}
function glr {
    git pull --rebase $args
}
function glg {
    git log --stat $args
}
function glgg {
    git log --graph $args
}
function glgga {
    git log --graph --decorate --all $args
}
function glo {
    git log --oneline --decorate --color $args
}
function glog {
    git log --oneline --decorate --color --graph $args
}
function gloga {
    git log --oneline --decorate --color --graph --all $args
}
function glom {
    $defaultBranch = Get-Git-MainBranch
    git log --oneline --decorate --color "$defaultBranch".. $args
}
function glod {
    git log --oneline --decorate --color develop.. $args
}
function gloo {
    git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short $args
}
function gm {
    git merge $args
}
function gma {
    git merge --abort $args
}
function gmc {
    git merge --continue $args
}
function gms {
    git merge --squash --no-commit $args
}
function gmf {
    git merge --ff-only $args
}
function gmt {
    git mergetool --no-prompt $args
}
function gmom {
    $defaultBranch = Get-Git-MainBranch
    git merge origin/$defaultBranch $args
}
function gp {
    git push $args
}
function gp! {
    git push --force-with-lease $args
}
function gpo {
    git push origin $args
}
function gpo! {
    git push --force-with-lease origin $args
}
function gpv {
    git push --no-verify $args
}
function gpv! {
    git push --no-verify --force-with-lease $args
}
function ggp {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git push origin $currentBranch $args
    }
}
function ggp! {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git push origin $currentBranch --force-with-lease
    }
}
function gpu {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git push origin $currentBranch --set-upstream
    }
}
function gpoat {
    git push origin --all; git push origin --tags
}
function ggpnp {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git pull origin $currentBranch; git push origin $currentBranch
    }
}
function gr {
    git remote -vv $args
}
function gra {
    git remote add $args
}
function grb {
    git rebase $args
}
function grba {
    git rebase --abort $args
}
function grbc {
    git rebase --continue $args
}
function grbi {
    git rebase --interactive $args
}
function grbm {
    $defaultBranch = Get-Git-MainBranch
    git rebase $defaultBranch $args
}
function grbmi {
    $defaultBranch = Get-Git-MainBranch
    git rebase $defaultBranch --interactive $args
}
function grbmia {
    $defaultBranch = Get-Git-MainBranch
    git rebase $defaultBranch --interactive --autosquash $args
}
function grbom {
    $defaultBranch = Get-Git-MainBranch
    git fetch origin $defaultBranch; git rebase FETCH_HEAD
}
function grbomi {
    $defaultBranch = Get-Git-MainBranch
    git fetch origin $defaultBranch; git rebase FETCH_HEAD --interactive
}
function grbomia {
    $defaultBranch = Get-Git-MainBranch
    git fetch origin $defaultBranch; git rebase FETCH_HEAD --interactive --autosquash
}
function grbd {
    git rebase develop $args
}
function grbdi {
    git rebase develop --interactive $args
}
function grbdia {
    git rebase develop --interactive --autosquash $args
}
function grbs {
    git rebase --skip $args
}
function ggu {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git pull --rebase origin $currentBranch
    }
}
function grev {
    git revert $args
}
function grh {
    git reset $args
}
function grhh {
    git reset --hard $args
}
function grhpa {
    git reset --patch $args
}
function grm {
    git rm $args
}
function grmc {
    git rm --cached $args
}
function grmv {
    git remote rename $args
}
function grpo {
    git remote prune origin $args
}
function grrm {
    git remote remove $args
}
function grs {
    git restore $args
}
function grset {
    git remote set-url $args
}
function grss {
    git restore --source $args
}
function grst {
    git restore --staged $args
}
function grup {
    git remote update $args
}
function grv {
    git remote -v $args
}
function gsh {
    git show $args
}
function gsd {
    git svn dcommit $args
}
function gsr {
    git svn rebase $args
}
function gsb {
    git status -sb $args
}
function gss {
    git status -s $args
}
function gst {
    git status $args
}
function gsta {
    git stash $args
}
function gstd {
    git stash drop $args
}
function gstl {
    git stash list $args
}
function gstp {
    git stash pop $args
}
function gsts {
    git stash show --text $args
}
function gsu {
    git submodule update $args
}
function gsur {
    git submodule update --recursive $args
}
function gsuri {
    git submodule update --recursive --init $args
}
function gts {
    git tag -s $args
}
function gtv {
    git tag | sort -V
}
function gsw {
    git switch $args
}
function gswc {
    git switch --create $args
}
function gunignore {
    git update-index --no-assume-unchanged $args
}
function gup {
    git pull --rebase $args
}
function gupv {
    git pull --rebase -v $args
}
function gupa {
    git pull --rebase --autostash $args
}
function gupav {
    git pull --rebase --autostash -v $args
}
function gwch {
    git whatchanged -p --abbrev-commit --pretty=medium $args
}
function gco {
    git checkout $args
}
function gcb {
    git checkout -b $args
}
function gcod {
    $developBranch = Get-Git-DevelopBranch
    if ($developBranch) {
        git checkout $developBranch
    }
}
function gcom {
    $defaultBranch = Get-Git-MainBranch
    if ($defaultBranch) {
        git checkout $defaultBranch
    }
}
function gcot {
    git checkout testing
}
function gfb {
    git flow bugfix $args
}
function gff {
    git flow feature $args
}
function gfr {
    git flow release $args
}
function gfh {
    git flow hotfix $args
}
function gfs {
    git flow support $args
}
function gfbs {
    git flow bugfix start $args
}
function gffs {
    git flow feature start $args
}
function gfrs {
    git flow release start $args
}
function gfhs {
    git flow hotfix start $args
}
function gfss {
    git flow support start $args
}
function gfbt {
    git flow bugfix track $args
}
function gfft {
    git flow feature track $args
}
function gfrt {
    git flow release track $args
}
function gfht {
    git flow hotfix track $args
}
function gfst {
    git flow support track $args
}
function gfp {
    git flow publish $args
}
function gwt {
    git worktree $args
}
function gwta {
    git worktree add $args
}
function gwtls {
    git worktree list $args
}
function gwtlo {
    git worktree lock $args
}
function gwtmv {
    git worktree move $args
}
function gwtpr {
    git worktree prune $args
}
function gwtrm {
    git worktree remove $args
}
function gwtulo {
    git worktree unlock $args
}
function gmr {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git push origin $currentBranch --set-upstream -o merge_request.create
    }
}
function gmwps {
    $currentBranch = Get-Git-CurrentBranch
    if ($currentBranch) {
        git push origin $currentBranch --set-upstream -o merge_request.create -o merge_request.merge_when_pipeline_succeeds
    }
}
function gbage {
    git for-each-ref --sort=committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"
}
function gbda {
    $defaultBranch = Get-Git-MainBranch

    # Merged branches silme (squashed commitler hariç)
    git branch --merged | Select-String -Pattern "^\*|^\+|^\s*($defaultBranch|develop|dev)\s*$" -NotMatch | ForEach-Object {
        git branch -d $_.Trim()
    }

    # Squashed commit'li branch'leri bulup silme
    $branches = git for-each-ref refs/heads/ "--format=%(refname:short)"
    foreach ($branch in $branches) {
        $mergeBase = git merge-base $defaultBranch $branch 2>$null
        if ($LASTEXITCODE -eq 0) {
            $cherryOutput = git cherry $defaultBranch (git commit-tree (git rev-parse "$($branch)^{tree}") -p $mergeBase -m "_") 2>$null
            if ($cherryOutput -match '^-') {
                git branch -D $branch
            }
        }
    }
}
function gdv {
    git diff -w $args | Out-Host
}
function gignored {
    git ls-files -v | Select-String "^[a-z]" -CaseSensitive
}
function glp {
    param([string]$format)
    if ($format) {
        git log --pretty=$format
    }
}
function grename {
    param([string]$old, [string]$new)
    if (-not $old -or -not $new) {
        Write-Error "Usage: grename old_branch new_branch"
        return
    }
    git branch -m $old $new
    git push origin ":$old"
    git push --set-upstream origin $new
}
function grt {
    try {
        $rootPath = git rev-parse --show-toplevel 2>$null
        if ($rootPath) {
            Set-Location $rootPath
        } else {
            Set-Location '.'
        }
    } catch {
        Set-Location '.'
    }
}
function gtest {
    $stagedChanges = git stash push -q --keep-index --include-untracked 2>$null
    if ($LASTEXITCODE -ne 0) {
        return
    }

    & $args
    $cmdstatus = $LASTEXITCODE

    git reset -q
    git restore .
    git stash pop -q --index 2>$null
    if ($LASTEXITCODE -ne 0) {
        return
    }

    return $cmdstatus
}
function gtl {
    param([string]$prefix)
    git tag --sort=-v:refname -n -l "$prefix*"
}
function gunwip {
    if (Test-BranchHasWip) {
        git reset HEAD~1
    }
}
function gwip {
    git add -A
    git rm (git ls-files --deleted) 2> $null
    git commit -m "--wip--" --no-verify
}
function gbda {
    $mainBranch = Get-Git-MainBranch
    $mergedBranches = $(git branch --merged | Select-String "^(\*|^\s*($mainBranch|develop)\s*$)").Line | Where-Object { $_.Trim().Length -gt 0 }

    foreach ($branch in $mergedBranches) {
        git branch -d $branch.Trim()
    }
}

# The original PowerShell module's functions were also included.
function gbnm {
    git branch --no-merged $args
}
function gbr {
    git branch --remote $args
}
function gcans! {
    git commit -v -a -s --no-edit --amend $args
}
function gcb {
    git checkout -b $args
}
function gcm {
    $MainBranch = Get-Git-MainBranch
    git checkout $MainBranch $args
}
function gcd {
    git checkout develop $args
}
function gcmsg {
    git commit -m $args
}
function gg {
    git gui citool $args
}
function gga {
    git gui citool --amend $args
}
function ggf {
    $CurrentBranch = Get-Git-CurrentBranch
    git push --force origin $CurrentBranch
}
function ggfl {
    $CurrentBranch = Get-Git-CurrentBranch
    git push --force-with-lease origin $CurrentBranch
}
function ghh {
    git help $args
}
function gpsup {
    $CurrentBranch = Get-Git-CurrentBranch
    git push --set-upstream origin $CurrentBranch
}
function glgm {
    git log --graph --max-count=10 $args
}
function glgp {
    git log --stat --color -p $args
}
function glol {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $args
}
function glola {
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all $args
}
function gmtvim {
    git mergetool --no-prompt --tool=vimdiff $args
}
function gmum {
    $MainBranch = Get-Git-MainBranch
    git merge upstream/$MainBranch $args
}
function gpd {
    git push --dry-run $args
}
function gpf {
    git push --force-with-lease $args
}
function gpf! {
    git push --force $args
}
function gpr {
    git pull --rebase $args
}
function gpra {
    git pull --rebase --autostash $args
}
function gpristine {
    git reset --hard
    git clean -dfx
}
function gprv {
    git pull --rebase -v $args
}
function gpu {
    git push upstream $args
}
function groh {
    $CurrentBranch = Get-Git-CurrentBranch
    git reset origin/$CurrentBranch --hard
}
function gru {
    git reset -- $args
}
function gsi {
    git submodule init $args
}
function gsps {
    git show --pretty=short --show-signature $args
}
function gstaa {
    git stash apply $args
}
function gstc {
    git stash clear $args
}
function glum {
    $MainBranch = Get-Git-MainBranch
    git pull upstream $MainBranch $args
}
function gvt {
    git verify-tag $args
}
function ggpnp {
    ggl; ggp $args
}
function gprom {
    $MainBranch = Get-Git-MainBranch
    git pull --rebase origin $MainBranch $args
}
function gwt {
    git worktree $args
}
function gwta {
    git worktree add $args
}
function gwtls {
    git worktree list $args
}
function gwtmv {
    git worktree move $args
}
function gwtrm {
    git worktree remove $args
}
