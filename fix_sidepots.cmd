@echo off
setlocal enabledelayedexpansion

:: Script variables
set txtfile=BLS_2022_2023.TXT
set regulars=Regulars.txt
set csvfile=Sidepots.csv

:: Delete CSV file if exists
if exist %csvfile% (
  echo Deleting CSV file...
  del /f %csvfile%
)

:: Display message and exit if Regulars.txt is missing
if not exist %regulars% (
  echo %regulars% does not exist
  pause
  exit 1
)

:: Loop over text file, set defaults for subs, remove average bk and write final CSV
echo Processing TXT file...
for /f "usebackq tokens=1-5 delims=," %%a in ("%txtfile%") do (
  set team=%%b
  set nwlane=%%e
  findstr /i /r /c:%%a %regulars% > nul
  if !ERRORLEVEL! neq 0 (
    set team="0"
    set nwlane=""
  )
  set avg=%%d
  echo %%a,!team!,%%c,!avg:bk=!,!nwlane!>>%csvfile%
)

:: Delete TXT file if exists
if exist %txtfile% (
  echo Deleting TXT file
  del /f %txtfile%
)
