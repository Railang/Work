@echo off
net stop "w32time"
tzutil /s "Mountain Standard Time"
w32tm /config /syncfromflags:all
net start "w32time"
w32tm /resync /force
cscript //B "%windir%\system32\slmgr.vbs" /ato
cscript //B "c:\program files\microsoft office\office15\ospp.vbs" /act
cscript //B "c:\program files (x86)\microsoft office\office15\ospp.vbs" /act
cscript //B "c:\program files (x86)\microsoft office\office14\ospp.vbs" /act