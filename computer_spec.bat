@echo off
computer specs
cls

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