@echo off
:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c, %~s0' -Verb runAs"
    exit /b
)

:: Admin Privileges Granted, Show Message
echo #################################################
echo FROLIX'S SPACE CLEANER
echo Please dont close until it says cleanup completed
echo #################################################

:: Delete contents from Temp folders and Prefetch
echo Cleaning up AppData\Local\Temp...
rd /s /q "%USERPROFILE%\AppData\Local\Temp"
mkdir "%USERPROFILE%\AppData\Local\Temp"

echo Cleaning up C:\Windows\Temp...
rd /s /q "C:\Windows\Temp"
mkdir "C:\Windows\Temp"

echo Cleaning up C:\Windows\Prefetch...
rd /s /q "C:\Windows\Prefetch"
mkdir "C:\Windows\Prefetch"

echo Cleanup complete, you may now close this.
pause