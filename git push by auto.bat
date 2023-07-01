@echo off
echo "__________________________________________________________________________________________________ echo
echo "__________________________________________________________________________________________________ title
title %~n0
echo "__________________________________________________________________________________________________ maximized window s
if not "%maximized%"=="" goto :maximized
set maximized=true
start /max cmd /C "%~dpnx0"
goto :EOF
:maximized
echo "__________________________________________________________________________________________________ maximized window e"
echo "__________________________________________________________________________________________________ minimized window s
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized
echo "__________________________________________________________________________________________________ minimized window e
echo "__________________________________________________________________________________________________ getAdmin  
REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM if '%errorlevel%' NEQ '0' ( echo Requesting administrative privileges... goto UACPrompt 
REM ) else ( goto gotAdmin ) 
REM :UACPrompt 
	REM echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
	REM set params = %*:"="" 
	REM echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" 
	REM "%temp%\getadmin.vbs" 
	REM del "%temp%\getadmin.vbs" 
	REM exit /B 
REM :gotAdmin
	REM pushd "%CD%"
	REM CD /D "%~dp0"
REM :------------------------------------------ below cript will acted as administrator mode ------------------------------------------ 
color 0a
chcp 65001
cls
setlocal

echo "______________________________________________________________________________________________________________________________ s
echo . >> foo.txt
copy ".\.orichalcum\git push by auto.py" ".\git push by auto.py"
call py ".\git push by auto.py"  
echo "______________________________________________________________________________________________________________________________ e


pause
timeout 30

