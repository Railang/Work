@echo off
set /p blah= 1 or 2

if %blah% equ 1 goto success
exit

:success
echo win
pause
