@echo off
rem This batch file starts the Python scanner and passes a dragged file's path.

rem Change the current directory to the location of this batch file
cd /d "%~dp0"

rem Check if a file was dropped onto the .bat file
if "%1"=="" goto no_file
echo Running scanner with dropped file: %1

rem The %1 variable holds the path to the file that was dropped
python homemadeav.py "%1"
goto end

:no_file
echo No file was dropped. Starting scanner in manual mode.
python homemadeav.py

:end
rem The pause command is helpful for debugging, but you can remove it for a cleaner user experience
pause
