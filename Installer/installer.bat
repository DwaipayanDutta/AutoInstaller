@echo off
setlocal

:: Define the path to the folder containing the installers
set "installFolder=C:\Users\dwaip\OneDrive\Desktop\Soft"

:: Print the list of .exe and .msi files
echo Listing .exe and .msi files in %installFolder%:
dir "%installFolder%\*.exe" /b
dir "%installFolder%\*.msi" /b

:: Define the path to the PowerShell script
set "psScript=C:\Users\dwaip\OneDrive\Desktop\InstallSoftware.ps1"

:: Run the PowerShell script
powershell -NoProfile -ExecutionPolicy Bypass -File "%psScript%"

endlocal
pause
