@echo off
Echo Activating Windows
slmgr -ato
cls
Echo Activating Office 2010
Cd C:\Program Files (x86)\Microsoft Office\Office14
cscript ospp.vbs /act
Cd C:\
cls
Echo Activating Office 2013 (If applicable)
Cd C:\Program Files (x86)\Microsoft Office\Office15
cscript ospp.vbs /act
Cd C:\
cls
Echo Done (Profit)
pause
