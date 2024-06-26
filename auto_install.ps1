
Write-Host "----------------Installing Scoop----------------"
irm get.scoop.sh | iex

Write-Host "--------------Installing touch command----------"
scoop install touch
clear
Write-Host "--------------Installing terminal icons----------"
install-Module -Name Terminal-Icons -Repository PSGallery

Write-Host "----------------Installing All The Apps----------------"
winget install -e --id Microsoft.VCRedist.2015+.x64
winget install -e --id Microsoft.VCRedist.2013.x64
winget install -e --id Microsoft.DotNet.Runtime.7
winget install -e --id Microsoft.DirectX
winget install -e --id 7zip.7zip
winget install -e --id Git.Git
winget install -e --id VideoLAN.VLC
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Telegram.TelegramDesktop
winget install -e --id Starship.Starship
Write-Host "-----------Forcing File Explorer to open to This PC instead of Quick Access--------------"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
