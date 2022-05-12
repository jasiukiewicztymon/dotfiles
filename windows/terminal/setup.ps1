# Tymon Jasiukiewicz dotfiles
# Github: https://github.com/jasiukiewicztymon

cls;

# oh my posh installation

winget install oh-my-posh;

net stop "print spooler";
if (-not(Test-Path -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell")) {
        New-Item -Path "$($env:USERPROFILE)\Documents" -Name "WindowsPowerShell" -ItemType "directory";
}

if (Test-Path -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -PathType Leaf) {
        Add-Content -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Value 'oh-my-posh init pwsh | Invoke-Expression;' -Force;
}
else {
        New-Item -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell" -Name "Microsoft.PowerShell_profile.ps1" -ItemType "file" -Value "oh-my-posh init pwsh | Invoke-Expression";
}
net start "print spooler";

. $Profile

oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json' | Invoke-Expression;

. $Profile

Install-Module -Name Terminal-Icons -Repository PSGallery;
Add-Content -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Value 'Import-Module -Name Terminal-Icons;' -Force;

. $Profile

# vim installation

if (-not(Test-Path -Path "C:\config")) {
        net stop "print spooler";
        New-Item -Path "c:\" -Name "config" -ItemType "directory"
        net start "print spooler";
}

Invoke-WebRequest -Uri "https://github.com/vim/vim-win32-installer/releases/download/v8.2.1970/gvim_8.2.1970_x64.exe" -OutFile "C:\config\vim.exe";
C:\config\vim.exe;
