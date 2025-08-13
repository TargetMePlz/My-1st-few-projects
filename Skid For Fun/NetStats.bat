@echo off
setlocal enabledelayedexpansion

:main_menu
cls
echo ================================
echo          MAIN MENU
echo ================================
echo 1. Check active network connections and all open ports
echo 2. Check for reverse shell payloads and suspicious indicators
echo 3. Check netstat for network connections and open ports
echo 4. Check for listening services
echo 5. Check for unusual outbound connections
echo 6. Check for exposed administrative shares
echo 7. Check firewall status
echo 8. Check for suspicious registry keys
echo 9. Check for suspicious scheduled tasks
echo 10. Exit
echo ================================
set /p choice="Select an option (1-10): "

if "%choice%"=="1" goto check_network
if "%choice%"=="2" goto check_reverse_shell_and_suspicious_indicators
if "%choice%"=="3" goto check_netstat
if "%choice%"=="4" goto check_listening_services
if "%choice%"=="5" goto check_outbound_connections
if "%choice%"=="6" goto check_admin_shares
if "%choice%"=="7" goto check_firewall_status
if "%choice%"=="8" goto check_registry_persistence
if "%choice%"=="9" goto check_scheduled_tasks
if "%choice%"=="10" exit
goto main_menu

:check_network
cls
echo Checking active network connections and all open ports...
echo =====================================
netstat -ano
netstat -an
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_reverse_shell_and_suspicious_indicators
cls
echo Checking for reverse shell payloads and suspicious indicators...
echo =====================================

:: Reverse shell tools check
set reverse_shells=nc.exe powershell.exe bash.exe python.exe telnet.exe perl.exe
for %%s in (%reverse_shells%) do (
    tasklist | findstr "%%s" > nul
    if !errorlevel! equ 0 (
        echo Warning: Found suspicious process: %%s
    )
)

:: Check for WMI-based reverse shell activity (WMI commands)
echo Checking for suspicious WMI activity...
wmic process list brief | findstr /i "wmic" > nul
if !errorlevel! equ 0 (
    echo Warning: Suspicious WMI process detected.
)

:: Check for dynamic link libraries (DLLs) or hidden processes (suspicious parent-child processes)
echo Checking for suspicious DLLs...
tasklist /m | findstr /i "suspectdll" > nul
if !errorlevel! equ 0 (
    echo Warning: Suspicious DLL loaded in a process.
)

:: Check for known RATs (Remote Access Tools)
echo Checking for known RATs...
set rat_tools=njRAT Gh0stRAT njRat
for %%r in (%rat_tools%) do (
    tasklist | findstr "%%r" > nul
    if !errorlevel! equ 0 (
        echo Warning: Found RAT process: %%r
    )
)

echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_netstat
cls
echo Checking network connections and open ports (including listening services)...
echo =====================================
netstat -ano
netstat -an | findstr "LISTEN"
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_listening_services
cls
echo Checking for potentially vulnerable listening services...
echo =====================================
netstat -an | findstr "LISTEN"
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_outbound_connections
cls
echo Checking for unusual outbound connections...
echo =====================================
netstat -an | findstr "ESTABLISHED"
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_admin_shares
cls
echo Checking for exposed administrative shares...
echo =====================================
:: Check for C$ and ADMIN$ shares
net share | findstr /i "C$"
if %errorlevel% equ 0 (
    echo Exposed administrative share detected: C$
) else (
    echo No exposed administrative share found for C$
)

net share | findstr /i "ADMIN$"
if %errorlevel% equ 0 (
    echo Exposed administrative share detected: ADMIN$
) else (
    echo No exposed administrative share found for ADMIN$
)

echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_firewall_status
cls
echo Checking firewall status...
echo =====================================
netsh advfirewall show allprofiles state
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_registry_persistence
cls
echo Checking for suspicious registry keys...
echo =====================================

:: Additional registry queries for persistence mechanisms
echo Checking "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"... 
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
echo Checking "HKLM\Software\Microsoft\Windows\CurrentVersion\Run"... 
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run"
echo Checking "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"... 
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"
echo Checking "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce"... 
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce"
echo Checking "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"... 
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
echo Checking "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"... 
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"

echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu

:check_scheduled_tasks
cls
echo Checking for suspicious scheduled tasks...
echo =====================================
schtasks /query /fo LIST
echo =====================================
echo Press any key to return to the main menu.
pause >nul
goto main_menu
