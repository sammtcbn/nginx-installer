@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set NGINX_VER=1.21.3
set zipfile=nginx-%NGINX_VER%.zip
set NGINX_FOLDER_NAME=nginx-%NGINX_VER%

curl --fail --output %zipfile% http://nginx.org/download/%zipfile%
if %errorlevel% neq 0 (
    echo Fail to download %zipfile%
    pause
    goto End
)

if not exist %zipfile% (
    echo %zipfile% not found
    pause
    goto End
)

powershell -command "Expand-Archive -Force %zipfile% ."

if not exist %NGINX_FOLDER_NAME%\nginx.exe (
    echo Fail to extract %zipfile%
    pause
    goto End
)

rename %NGINX_FOLDER_NAME% nginx

:END
echo bye
timeout /t 3
