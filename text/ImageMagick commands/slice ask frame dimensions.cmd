@echo off
setlocal EnableExtensions

if "%~1"=="" (
  echo Drag an image file onto this script.
  pause
  exit /b 1
)

set "IMG=%~1"
echo Image: "%IMG%"

set /p W=Enter frame width (px): 
set /p H=Enter frame height (px): 

if "%W%"=="" exit /b 1
if "%H%"=="" exit /b 1

if not exist "frames" mkdir "frames"

magick "%IMG%" -crop %W%x%H% "frames\frame_%%03d.png"

echo Done.
pause
