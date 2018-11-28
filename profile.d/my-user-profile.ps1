#
# Theme
#
Import-Module posh-git
Import-Module oh-my-posh
$ThemeSettings.MyThemesLocation = "$PSScriptRoot/themes"
Set-Theme My-Paradox
# Hide 'username@domain' in prompt
$DefaultUser = $env:USERNAME

[ScriptBlock]$Prompt = $function:prompt

#
# Enhancements
#
## Unload modules that slow down autocomplete
Remove-Module PackageManagement -Force -ErrorAction Ignore

## Load unix tool as for 'cmder:cmd'
if(Test-Path env:GIT_INSTALL_ROOT) {
    $env:Path += $(";" + $env:GIT_INSTALL_ROOT + "\usr\bin")
}
