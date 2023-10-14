$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_DISTRO = "者"
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons