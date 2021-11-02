@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\nginx\nssm stop nginx
C:\nginx\nssm remove nginx confirm

:END
echo bye
timeout /t 3
