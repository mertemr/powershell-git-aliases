# Git aliases for PowerShell
[![license](https://img.shields.io/github/license/gluons/powershell-git-aliases.svg?style=flat-square)](./LICENSE)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/git-aliases.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/git-aliases.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases/)

This [PowerShell](https://microsoft.com/powershell) module provides a comprehensive set of aliases and functions, incorporating both a portion of the Git plugin for [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and additional custom functions from my [fish shell](https://fishshell.com/) configuration.

It has evolved from a partial package to a rich set of commands designed to speed up your daily Git workflow.

> ℹ️ This module will replace some built-in PowerShell aliases with our Git aliases to **prevent** [conflict](https://github.com/gluons/powershell-git-aliases/issues?utf8=%E2%9C%93&q=is%3Aissue+label%3Aconflict).

---

## 🚀 Key Features

Beyond simple Git aliases, this module includes powerful custom functions for more complex tasks:

* **gbda:** A comprehensive function to automatically delete branches that have been both merged and **squashed** into the current HEAD.
* **grename:** Renames a branch locally and on the remote `origin` with a single command.
* **gtest:** Runs a specified command only on your staged changes by stashing other modifications.
* **gwip / gunwip:** Functions for creating and restoring 'Work in Progress' commits, making it easy to park your work and switch branches.
* **Extensive Rebase Aliases:** Streamlined commands for your rebase workflow, including interactive rebase (`grbi`, `grbmia`) and abort/continue commands (`grba`, `grbc`).
* **GitLab-specific aliases:** For creating a Merge Request (`gmr`) or automatically merging it when the pipeline succeeds (`gmwps`).

---

## ⚙️ Installation

Install from [PowerShell Gallery](https://www.powershellgallery.com/packages/git-aliases/)

```powershell
Install-Module git-aliases -Scope CurrentUser -AllowClobber
```

Or from [Scoop](https://github.com/ScoopInstaller/Extras/blob/master/bucket/git-aliases.json)

```powershell
scoop bucket add extras
scoop install git-aliases
```

---

⚠️ If you haven't allowed script execution policy, set your script execution policy to `RemoteSigned` or `Unrestricted`.

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 🛂 Usage

You have to import the module to use `git-aliases`.

Add below command into your PowerShell profile.

```powershell
Import-Module git-aliases -DisableNameChecking
```

Then restart your PowerShell.  
Now you can use Git aliases.

---

⚠️ If you don't have PowerShell profile yet, create it with below command!

```powershell
New-Item -ItemType File $profile
```
