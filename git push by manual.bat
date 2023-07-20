title %~n0
echo "__________________________________________________________________________________________________________________________________________ minimized window s
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized
echo "__________________________________________________________________________________________________________________________________________ minimized window e
echo "__________________________________________________________________________________________________________________________________________ variable defination
chcp 65001
@echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
cls
echo "__________________________________________________________________________________________________________________________________________ add / commit / push


::set commit_ment=%yyyyMMddHHmmss%
::set commit_ment=테스트 커밋.
::set commit_ment=프로젝트 이니셜 커밋.
::set commit_ment=플러터 안드로이드 앱 업데이트 PHASE 1
::set commit_ment=개발환경 이동 및 프로젝트 작동 테스트 완료
::set commit_ment=넷플리쓰 서치 탭의 서치 바 UI 구현
::set commit_ment=const 리펙토링 진행
set commit_ment=README.md 참조


git add *  
git commit -m "%commit_ment%" 
git push -u origin main  
git status | find "working tree clean" 



set DIRECTORY_THAT_CONTAINING_GIT_FILE=%cd%
CD ..
set DIRECTORY_THAT_CONTAINING_GIT_USELESS_PART=%cd%
echo %DIRECTORY_THAT_CONTAINING_GIT_FILE%
echo %DIRECTORY_THAT_CONTAINING_GIT_USELESS_PART%
SET OPENING_DIRECTORY=%DIRECTORY_THAT_CONTAINING_GIT_FILE%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*\=FOO%
SET OPENING_DIRECTORY=%OPENING_DIRECTORY:*FOO=%
ECHO %OPENING_DIRECTORY%
explorer https://github.com/PARK4139/%OPENING_DIRECTORY%
del /f "git push by auto.py"
REM echo %~n0.log
timeout 5


