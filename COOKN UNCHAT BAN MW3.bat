@echo off

net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
  echo Administrator privileges required!
  echo Right click %~n0%~x0 and click "Run as administrator".
  exit /b %errorlevel%
)

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

echo Terminating Call of Duty related processes... 
taskkill /f /IM Agent.exe
taskkill /f /IM Battle.net.exe
taskkill /f /IM cod.exe
taskkill /f /IM codCrashHandler.exe
taskkill /f /IM cod22-cod.exe
taskkill /f /IM bootstrapper.exe
taskkill /f /IM bootstrapperCrashHandler.exe
taskkill /f /IM steam.exe

for /f "" %%# in ('"WMIC Path Win32_LocalTime Get month,day,year /format:value"') do (
    for /f %%Z in ("%%#") do set "%%Z"
)
set /a CURRENTMONTH=month
set /a LASTMONTH=month-1
set /a CURRENTDAY=day
set /a CURRENTYEAR=year
echo Setting system date to 1 month ago: %LASTMONTH%-%CURRENTDAY%-%CURRENTYEAR%
date %LASTMONTH%-%CURRENTDAY%-%CURRENTYEAR%
start "" "C:\Program Files (x86)\Battle.net\Battle.net.exe"
echo Start Cod now in the Battle net launcher and
pause
echo Restoring date to %CURRENTMONTH%-%CURRENTDAY%-%CURRENTYEAR%
date %CURRENTMONTH%-%CURRENTDAY%-%CURRENTYEAR%
