@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo The will do a full setup for the Kiosk machines. (M93z)
echo.
echo This will also install the printer driver for uITX3003AG-C
echo.
pause

C:\Windows\System32\pnputil -i -a "%~dp0uITX_3003AG-C_Driver\oemprint.inf"
xcopy /y /i /q "%~dp0setup.exe" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
net user administrator /active:yes
net user administrator "D3sktopR0x!"
net user User /active:no
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /d 0 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f
net user /add Cafe Apxadmin99
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d Cafe /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d Apxadmin99 /f
WMIC USERACCOUNT WHERE Name=Cafe SET PasswordExpires=FALSE
powercfg -change -standby-timeout-ac 0
goto End

:End
cls
echo Done "Profit"
echo Would you like to (1) Shutdown (2) Restart (3) Do Nothing
set /p answer=
if %answer% EQU 1 goto Shutdown
if %answer% EQU 2 goto Restart
if %answer% EQU 3 goto Nothing
goto End

:Shutdown
shutdown /s /t 10

:Restart
shutdown /r /t 10

:Nothing
cls
exit

