@echo off
echo "__________________________________________________________________________________________________ echo
echo "__________________________________________________________________________________________________ title
title %~n0
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
REM set directory_or_file_p=.\
REM set directory_or_file_n=private
REM set directory_or_file_x=.txt
REM set directory_or_file_pn=%directory_or_file_p%%directory_or_file_n%
REM set directory_or_file_nx=%directory_or_file_n%%directory_or_file_x%
REM set directory_or_file_pnx=%directory_or_file_p%%directory_or_file_n%%directory_or_file_x%
REM for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i



echo "______________________________________________________________________________________________________________________________ s
start /max explorer "https://github.com/PARK4139/PRJS_PRIVATE"
REM del /f "git push by auto.py"
echo "______________________________________________________________________________________________________________________________ e