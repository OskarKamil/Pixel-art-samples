@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Frames folder to Animated GIF (ImageMagick)

set "IN=%~1"
if "%IN%"=="" (
  echo Drag the FRAMES folder onto this .cmd file.
  pause
  exit /b 1
)

REM Remove trailing backslash
if "%IN:~-1%"=="\" set "IN=%IN:~0,-1%"

if not exist "%IN%\" (
  echo Folder not found:
  echo "%IN%"
  pause
  exit /b 1
)

where magick >nul 2>&1
if errorlevel 1 (
  echo ERROR: "magick" not found in PATH.
  pause
  exit /b 1
)

REM Parent folder (one level up)
for %%P in ("%IN%\..") do (
  set "OUTDIR=%%~fP"
  set "OUTBASE=%%~nxP"
)

set "OUT=%OUTDIR%\%OUTBASE%.gif"

echo Frames folder: "%IN%"
echo Output GIF   : "%OUT%"
echo Delay        : 100ms per frame
echo.

REM KEY FIX: +repage removes crop offsets so animation is correct size
magick "%IN%\*.png" -alpha set +repage -delay 10 -loop 0 "%OUT%"

if errorlevel 1 (
  echo.
  echo FAILED creating GIF.
  pause
  exit /b 1
)

echo.
echo DONE!
pause
