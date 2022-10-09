@echo off
setlocal enabledelayedexpansion

:: Script variables
set txtfile=BLS_2022_2023.TXT
set regulars=Regulars.txt
set csvfile=Sidepots.csv

:: Delete CSV file if exists
if EXIST %csvfile% (
  del /F %csvfile%
)

:: Display message and exit if Regulars.txt is missing
if NOT EXIST %regulars% (
  echo %regulars% does not exist
  pause
  exit 1
)

:: Loop over text file, set defaults for subs, remove average bk and write final CSV
for /F "usebackq tokens=1-5 delims=," %%a in ("%txtfile%") do (
  set team=%%b
  set nwlane=%%e
  findstr /I /R /C:%%a %regulars% > nul
  if !ERRORLEVEL! NEQ 0 (
    set team="0"
    set nwlane=""
  )
  set avg=%%d
  rem echo %%a,!team!,%%c,!avg:bk=!,!nwlane!
  echo %%a,!team!,%%c,!avg:bk=!,!nwlane!>>%csvfile%
)

:: Delete TXT file if exists
if EXIST %txtfile% (
  del /F %txtfile%
)
