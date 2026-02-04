@echo off
:: Checking Admin permissions
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo please restart the proggram with admin permissions
    pause
    exit
)

:: optimizing services and powerconfig
Get-Service | Where-Object {$_.StartType -eq 'Automatic'} | Set-Service -StartupType Manual
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61

:: Downloading tools
set "FILE_ID=16mPwAp8HkioSBL1TiO0wMCjDSyLEuZ6O"
set "EXE_NAME=NVCleanstall_1.19.0.exe"

echo "downloading NVCleaninstall"
curl -L "https://drive.google.com/uc?export=download&id=%FILE_ID%" -o "%EXE_NAME%"

echo "keep in minds that the driver efficiency is measured on RTX 50 series, performance on rtx 30 and 40 series might be a little bit different."
pause 
:: Nvidia driver optimized and clean install 
curl -L "https://drive.google.com/uc?export=download&id=1mtzdsRsmb4P9p2De20ohgsZ6i9EgePM-" -o Nvidia_Driver_580.88_desktop.exe
start "" "~/Downloads/Nvidia_Driver_580.88_desktop.exe"


pause