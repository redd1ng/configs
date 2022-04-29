# Adjust Prompt

function prompt
{
        Write-Host "PS " -nonewline -ForegroundColor "DarkYellow"
        Write-Host "$env:USERNAME@$env:COMPUTERNAME " -ForegroundColor "Green" -NoNewLine
        Write-Host "$PWD" -ForegroundColor "Blue"
        Write-Host "PS >" -nonewline -ForegroundColor "DarkYellow"

        return " "
}

# Git Sync

function Update-GitRepositories {
        param (
        $Directories
        )

        Get-ChildItem -Directory $Directories | ForEach-Object {
                echo $_.BaseName
                git -C $_.BaseName fetch
                git -C $_.BaseName lg HEAD..origin/HEAD
                git -C $_.BaseName merge --ff-only
                }
        }

# Aliases

Set-Alias up Update-GitRepositories 
Set-Alias ll ls
