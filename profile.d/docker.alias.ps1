function Remove-StoppedContainers {
	docker container rm $(docker container ls -q)
}

function Remove-AllContainers {
	docker container rm -f $(docker container ls -aq)
}

function Get-ContainerIPAddress {
	param (
		[string] $id
	)
	& docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' $id
}

function Add-ContainerIpToHosts {
	param (
		[string] $name
	)
	$ip = docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' $name
	$newEntry = "$ip  $name  #added by d2h# `r`n"
	$path = 'C:\Windows\System32\drivers\etc\hosts'
	$newEntry + (Get-Content $path -Raw) | Set-Content $path
}

Set-Alias drm  Remove-StoppedContainers

Set-Alias drmf  Remove-AllContainers

Set-Alias dip  Get-ContainerIPAddress

Set-Alias d2h  Add-ContainerIpToHosts