@echo off
title Computer Maintenance Script
cls

echo.
echo.
echo.
echo.
echo.
echo ---------- Updates ----------
echo.
echo.

echo Starting Windows Updates
powershell -Command "Install-WindowsUpdate -AcceptAll -IgnoreReboot"
echo Completed Windows Updates
echo --------------------

echo Starting Optional Windows Updates
powershell -Command "Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot"
echo Completed Optional Windows Updates
echo --------------------

echo Running Winget Updates
winget source update
winget update --all --silent
echo Completed Winget Updates
echo --------------------

echo.
echo.
echo.
echo.
echo.
echo ---------- Maintenance ----------
echo.
echo.

echo Running Disk Cleanup With Saved Settings On C Drive
cleanmgr /sagerun:1 /d C:
echo Completed Disk Cleanup With Saved Settings On C Drive
echo --------------------

echo Starting Free Up Space Of Previously Deleted Files
defrag C: /O
echo Completed Free Up Space Of Previously Deleted Files
echo --------------------

echo Starting Check For Corrupted Windows Files
sfc /scannow
echo Completed Check For Corrupted Windows Files
echo --------------------

echo Starting Check For Corrupted Windows Image
DISM /Online /Cleanup-Image /RestoreHealth
echo Completed Check For Corrupted Windows Image
echo --------------------
pause

echo.
echo.
echo.
echo.
echo. 
echo ---------- Longer Checks ----------
echo.
echo.
echo respond 'Y' or 'y' if you would like to do the following prompts.
echo these either take a long time or will require a restart and perform tasks while restarting preventing you from using your computer until it has completed

set /p answer=Check RAM? [computer wont be useable for 10-30 mins] (Y/N):
if "%answer%" == "Y" goto ram_check
if "%answer%" == "y" goto ram_check
echo skipping RAM Check
goto after_ram

:ram_check
echo External Prompt for RAM Check
mdsched.exe
echo RAM check scheduled
goto after_ram

:after_ram
set /p answer=Scan C Drive for issues? (Y/N):
if "%answer%" == "Y" goto drive_scan
if "%answer%" == "y" goto drive_scan
echo skipping Drive Scan
goto after_drive_scan

:drive_scan
echo Starting Drive Scan
chkdsk C: /F /R /X
echo Scheduled Drive Scan
goto after_drive_scan

:after_drive_scan
echo.
echo.
echo.
echo.
echo.
echo ---------- Computer Specs ----------
echo.
echo.
echo Here are your hardware and software/firmware/bios specs.
echo these are not easly automatable taking into account various computer configurations
echo you can check online if your versions are the latest
echo =====Motherboard Info=====
wmic baseboard get Manufacturer,Product,Version,SerialNumber
echo =====BIOS Info=====
wmic bios get Manufacturer,Name,SMBIOSBIOSVersion,Version,ReleaseDate
echo =====CPU Info=====
wmic cpu get Name,Manufacturer,MaxClockSpeed,CurrentClockSpeed,ProcessorId
echo =====GPU Info=====
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object Name,VideoProcessor,DriverVersion | Format-Table -AutoSize"
echo =====RAM Info=====
wmic MEMORYCHIP get Capacity,Speed,Manufacturer,PartNumber
echo =====Drive Info=====
wmic diskdrive get Model,InterfaceType,Size,SerialNumber
echo =====Network Adapters Info=====
wmic nic get Name,MACAddress,Speed,AdapterType
echo =====Operating System Info=====
wmic os get Caption,Version,BuildNumber,OSArchitecture
pause
