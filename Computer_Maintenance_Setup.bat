@echo off
title Computer Maintenance One Time Setup

echo Please select file cleanup options you want in the window that opens
echo This configuration will be saved and used in future cleanups
cleanmgr /sageset:1
echo Configuration saved!

echo Installing Windows Update Scripts
powershell -NoProfile -ExecutionPolicy Bypass -Command "Install-PackageProvider -Name NuGet -Force; Install-Module PSWindowsUpdate -force"; Import-Module PSWindowsUpdate -Force
echo Successfully Installed Windows Update Scripts

pause