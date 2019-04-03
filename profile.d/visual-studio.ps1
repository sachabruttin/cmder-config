## Visual Studio Command Prompt support
##Push-Location "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
##cmd /c "VsDevCmd.bat&set" |
##ForEach-Object {
##  if ($_ -match "=") {
##    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
##  }
##}
##Pop-Location