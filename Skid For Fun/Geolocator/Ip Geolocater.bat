@echo off

chcp 65001 >nul

color 0A

title Geolocation Info Scraper

setlocal enabledelayedexpansion

:: Display ASCII Art
echo  ██▓ ██▓███       ▄████ ▓█████  ▒█████   ██▓     ▒█████   ▄████▄   ▄▄▄     ▄▄▄█████▓ ██▓ ▒█████   ███▄    █ 
echo ▓██▒▓██░  ██▒    ██▒ ▀█▒▓█   ▀ ▒██▒  ██▒▓██▒    ▒██▒  ██▒▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▓██▒▒██▒  ██▒ ██ ▀█   █ 
echo ▒██▒▓██░ ██▓▒   ▒██░▄▄▄░▒███   ▒██░  ██▒▒██░    ▒██░  ██▒▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██▒▒██░  ██▒▓██  ▀█ ██▒
echo ░██░▒██▄█▓▒ ▒   ░▓█  ██▓▒▓█  ▄ ▒██   ██░▒██░    ▒██   ██░▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ░██░▒██   ██░▓██▒  ▐▌██▒
echo ░██░▒██▒ ░  ░   ░▒▓███▀▒░▒████▒░ ████▓▒░░██████▒░ ████▓▒░▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░ ░██░░ ████▓▒░▒██░   ▓██░
echo ░▓  ▒▓▒░ ░  ░    ░▒   ▒ ░░ ▒░ ░░ ▒░▒░▒░ ░ ▒░▓  ░░ ▒░▒░▒░ ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░   ░▓  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
echo  ▒ ░░▒ ░          ░   ░  ░ ░  ░  ░ ▒ ▒░ ░ ░ ▒  ░  ░ ▒ ▒░   ░  ▒     ▒   ▒▒ ░   ░     ▒ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░
echo  ▒ ░░░          ░ ░   ░    ░   ░ ░ ░ ▒    ░ ░   ░ ░ ░ ▒  ░          ░   ▒    ░       ▒ ░░ ░ ░ ▒     ░   ░ ░ 
echo  ░                    ░    ░  ░    ░ ░      ░  ░    ░ ░  ░ ░            ░  ░         ░      ░ ░           ░ 
echo                                                          ░                                                  
echo  █████▒██▓ ███▄    █ ▓█████▄ ▓█████  ██▀███                     _.-----._                                      
echo ▓██   ▒▓██▒ ██ ▀█   █ ▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒                .'.-'''''-.'._                                  
echo ▒████ ░▒██▒▓██  ▀█ ██▒░██   █▌▒███   ▓██ ░▄█ ▒               //`.:#:'    `\\\                                 
echo ░▓█▒  ░░██░▓██▒  ▐▌██▒░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄                ;; '           ;;'.__.===============,           
echo ░▒█░   ░██░▒██░   ▓██░░▒████▓ ░▒████▒░██▓ ▒██▒              ||      IP     ||  __                 )           
echo  ▒ ░   ░▓  ░ ▒░   ▒ ▒  ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░  Made by™    ;;             ;;.'  '==============='           
echo  ░      ▒ ░░ ░░   ░ ▒░ ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░ ®TargetMePlz  \\           ///                                
echo  ░ ░    ▒ ░   ░   ░ ░  ░ ░  ░    ░     ░░   ░                 ':.._____..:'~                                
echo         ░           ░    ░       ░  ░   ░                      `'-----'`                                    

:: Prompt user for IP address
set /p ip="Enter the IP address to locate: "

:: Section 1: Fetch geolocation data from ip-api
echo Fetching geolocation data from ip-api.com...
curl -s "http://ip-api.com/json/%ip%" > ipapi_geo.json
echo Geolocation Data from ip-api:
type ipapi_geo.json
echo.

:: Section 2: Fetch geolocation data from ipinfo.io
echo Fetching geolocation data from ipinfo.io...
curl -s "https://ipinfo.io/%ip%/json" > ipinfo_geo.json
echo Geolocation Data from ipinfo.io:
type ipinfo_geo.json
echo.


:: Use curl to fetch WHOIS data from an online API
curl -s "https://rdap.arin.net/registry/ip/%ip%" > whois_data.json

:: Display the result
echo WHOIS Data for %ip%:
type whois_data.json

pause >nul
