FROM mcr.microsoft.com/powershell:latest

SHELL ["powershell.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV mysql_version="8.0.15"
ENV mysql_root_password="root"

ADD "https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.15-winx64.zip" mysql.zip

RUN Expand-Archive -Path c:\mysql.zip -DestinationPath C:\ ; \
	Rename-Item -Path "C:\mysql-"$env:mysql_version"-winx64" -NewName C:\MySQL ; \
	Remove-Item C:\mysql.zip -Force 
	
ADD ./docker-entrypoint.ps1 /
	
ENTRYPOINT ["powershell.exe", "C:\\docker-entrypoint.ps1"]
