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

:s1
echo What is the username you would like to delete the profile for?
echo.
echo Please double check the username (VERY IMPORTANT)
echo.
set /p uname=Please enter the username:%=%
FOR /F "tokens=*" %%G in ('reg query "hklm\software\microsoft\windows nt\currentversion\profilelist" /f "%uname%" /t REG_EXPAND_SZ /s ^| findstr HKEY') do reg delete "%%G" /f

:s2
if exist "c:\users\%uname%.apex" goto p2

:p1
mkdir c:\users\public\bu
xcopy /e /y /i /q "c:\users\%uname%\desktop\*" "c:\users\public\bu"
echo @echo off > "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo if exist "c:\users\%uname%.apex" goto p1 >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo exit >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo :p1 >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo xcopy /e /y /i /q "c:\users\public\bu\*" "c:\users\%uname%.apex\desktop" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo rmdir /s /q "c:\users\public\bu" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo rmdir /s /q "c:\users\%uname%" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
goto p3


:p2
mkdir c:\users\public\bu
xcopy /e /y /i /q "c:\users\%uname%.apex\desktop\*" "c:\users\public\bu"
echo @echo off > "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo if exist "c:\users\%uname%" goto p1 >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo exit >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo :p1 >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo xcopy /e /y /i /q "c:\users\public\bu\*" "c:\users\%uname%\desktop" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo rmdir /s /q "c:\users\public\bu" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
echo rmdir /s /q "c:\users\%uname%.apex" >> "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\cpbu.bat"
goto p3

:p3
cls
echo Done "Profit"
echo.
echo Would you like to (1) Restart - Recommended (2) Do Nothing
set /p answer=
if %answer% EQU 1 goto Restart
if %answer% EQU 2 goto Nothing
if not %answer% EQU 1,2 goto invalid

:invalid
cls
echo Invalid choice please try again
echo.
pause
goto p3

:Restart
shutdown /r /t 10

:Nothing
exit