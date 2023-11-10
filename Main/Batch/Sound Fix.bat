@echo off
net localgroup administrators /add networkservice
net localgroup administrators /add localservice
cls
echo Success!!! Press any key to restart the computer.
echo.
pause
cls
shutdown /r /t 000