@echo off

title Valheim Mod Manager

REM Set UTF-8 encoding for proper display of special characters
chcp 65001 >nul

REM Set the text color to green
color 0A
cls

REM Display ASCII art
echo ██╗   ██╗ █████╗ ██╗     ██╗  ██╗███████╗██╗███╗   ███╗    ███╗   ███╗ ██████╗ ██████╗
echo ██║   ██║██╔══██╗██║     ██║  ██║██╔════╝██║████╗ ████║    ████╗ ████║██╔═══██╗██╔══██╗
echo ██║   ██║███████║██║     ███████║█████╗  ██║██╔████╔██║    ██╔████╔██║██║   ██║██║  ██║
echo ╚██╗ ██╔╝██╔══██║██║     ██╔══██║██╔══╝  ██║██║╚██╔╝██║    ██║╚██╔╝██║██║   ██║██║  ██║
echo  ╚████╔╝ ██║  ██║███████╗██║  ██║███████╗██║██║ ╚═╝ ██║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝
echo   ╚═══╝  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚═╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝                                                                                       
echo             ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗              
echo             ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗             
echo             ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝             
echo             ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗             
echo             ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║             
echo             ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝             
echo.

pause




:loop
    echo Installing Valheim Mod Manager! This may take a Minute, Please Be Patient.
     
    timeout /nobreak /t 1 >nul
    cls
    echo Installing Valheim Mod Manager! This may take a Minute, Please Be Patient..
     
    timeout /nobreak /t 1 >nul
    cls
    echo Installing Valheim Mod Manager! This may take a Minute, Please Be Patient...
    
    timeout /nobreak /t 1 >nul
    cls
    goto loop