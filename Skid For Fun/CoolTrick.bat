@echo off
title Error Message Spammer
color 4F
echo Prank Activated - Press Ctrl+C to Stop!
echo.

:loop
start "" wscript.exe "%~dp0error_message.vbs"
goto loop