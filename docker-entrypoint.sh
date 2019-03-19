Set-Content -Value \"ALTER USER 'root'@'localhost' IDENTIFIED BY '$($env:mysql_root_password)';\" -Path C:\MySQL\mysql-init.txt -Encoding Ascii

Get-Content C:\MySQL\mysql-init.txt

If (!(Test-Path -Path "C:\\MySQL\\data")) {


	New-Item -Path C:\MySQL\data -ItemType directory
	
	$InitArgumentList = "--init-file=C:\\MySQL\\mysql-init.txt --initialize --console --explicit_defaults_for_timestamp"
	$InstallArgumentList = "--install"
	
	Start-Process -FilePath C:\MySQL\bin\mysqld.exe -ArgumentList $InitArgumentList -Wait -NoNewWindow
	Start-Process -FilePath C:\MySQL\bin\mysqld.exe -ArgumentList $InstallArgumentList -Wait -NoNewWindow

}
