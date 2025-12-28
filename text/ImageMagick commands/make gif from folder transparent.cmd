@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "IN=%~1"
if "%IN%"=="" (
  echo Drag the FRAMES folder onto this .cmd file.
  pause
  exit /b 1
)
if "%IN:~-1%"=="\" set "IN=%IN:~0,-1%"

REM Output setup
for %%P in ("%IN%\..") do (
  set "OUTDIR=%%~fP"
  set "OUTBASE=%%~nxP"
)

REM Set output name with @5 suffix
set "OUT=%OUTDIR%\%OUTBASE%@5.gif"

REM Find first frame
set "FIRST="
for /f "delims=" %%F in ('dir /b /on "%IN%\*.png" 2^>nul') do (
  set "FIRST=%%F"
  goto :gotfirst
)
:gotfirst

REM Get BG Color
for /f "usebackq delims=" %%C in (`
  magick "%IN%\%FIRST%" -format "#%%[hex:u.p{0,0}]" info:
`) do set "BG=%%C"

echo Processing...
echo BG Color: %BG%
echo Output  : "%OUTBASE%@5.gif"

REM Create GIF
REM -filter point preserves pixel art edges
REM -resize 500%% scales it up 5x
magick "%IN%\*.png" ^
  -alpha set -transparent "%BG%" ^
  +repage ^
  -set dispose background ^
  -filter point -resize 500%% ^
  -delay 10 -loop 0 ^
  "%OUT%"

if errorlevel 1 (
  echo FAILED.
  pause
  exit /b 1
)

echo DONE!
pause