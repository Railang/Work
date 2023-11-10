@echo off
echo What is the name of the computer to activate this on?
echo.
set /p cname=Please enter the computer name:%=%
sc \\%cname% config remoteregistry start=auto
sc \\%cname% start remoteregistry
cls
echo Done, Profit!!!
echo.
pause