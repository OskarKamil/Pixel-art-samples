@echo off              :: Hide command output
setlocal               :: Keep variables local to this script

set "IMG=%~1"          :: Store first argument (dragged file path)

:: If no file was provided
if "%IMG%"=="" (
  echo Drag an image onto this script file.
  echo Program ended.
  pause
  exit /b 1
)

:: Slice image into 24x24 frames
magick "%IMG%" -crop 24x24 frame_%%03d.png

:: Keep window open
pause
