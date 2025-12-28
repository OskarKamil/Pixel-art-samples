@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "IMG=%~1"
if "%IMG%"=="" (
  echo Drag an image onto this script file.
  echo Program ended.
  pause
  exit /b 1
)

REM --- Build output filename: same folder, original base name + _transparent.png
set "DIR=%~dp1"
set "BASE=%~n1"
set "OUT=%DIR%%BASE%_transparent.png"

REM --- Read color of pixel at (0,0) as a hex string like #RRGGBB
for /f "usebackq delims=" %%C in (`
  magick "%IMG%" -format "#%%[hex:u.p{0,0}]" info:
`) do set "BG=%%C"

echo Input : "%IMG%"
echo Pixel (0,0) color: %BG%
echo Output: "%OUT%"
echo.

REM --- Make that color transparent and save
magick "%IMG%" -alpha set -transparent "%BG%" "%OUT%"

if errorlevel 1 (
  echo.
  echo Failed. Make sure ImageMagick is installed and "magick" works in CMD.
) else (
  echo.
  echo Done!
)

pause
