@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\nginx\nssm install nginx "nginx.exe"
C:\nginx\nssm set nginx AppDirectory "C:\nginx"
rem C:\nginx\nssm set nginx AppParameters "-c conf/nginx.conf -p ."
C:\nginx\nssm start nginx

:END
echo bye
timeout /t 3
