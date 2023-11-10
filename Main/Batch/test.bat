@echo off
xcopy "%~dp0netdom.exe" "C:\Windows\System32\" /y /e /i
xcopy "%~dp0netdom.exe.mui" "c:\Windows\System32\en-US" /y /e /i
c:\windows\system32\netdom.exe move /d:gosolarit.com %computername% /ud:jason.simpson /pd:Gosolar123 /reboot 000