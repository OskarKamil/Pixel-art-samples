@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Ensure file was provided
if "%~1"=="" (
  echo Drag an image file onto this script.
  pause
  exit /b 1
)

set "IMG=%~1"
echo Image: "%IMG%"

:: Ask for grid layout
set /p COLS=Enter number of columns: 
set /p ROWS=Enter number of rows: 

if "%COLS%"=="" exit /b 1
if "%ROWS%"=="" exit /b 1

:: Get image width and height using ImageMagick
for /f "tokens=1,2" %%A in ('
  magick identify -format "%%w %%h" "%IMG%"
') do (
  set IMG_W=%%A
  set IMG_H=%%B
)

:: Calculate frame size
set /a W=IMG_W / COLS
set /a H=IMG_H / ROWS

echo Image size: !IMG_W!x!IMG_H!
echo Frame size: !W!x!H!

:: Create output folder
if not exist "frames" mkdir "frames"

:: Crop into frames
magick "%IMG%" -crop !W!x!H! "frames\frame_%%03d.png"

echo Done.
pause
