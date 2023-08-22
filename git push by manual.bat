title %~n0
echo "__________________________________________________________________________________________________________________________ minimized window s
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized
echo "__________________________________________________________________________________________________________________________ minimized window e
echo "__________________________________________________________________________________________________________________________ variable defination
chcp 65001
@echo off
@rem @echo on
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
cls
echo "__________________________________________________________________________________________________________________________ add / commit / push


::set commit_ment=%yyyyMMddHHmmss%
::set commit_ment=테스트 커밋.
::set commit_ment=테스트 푸쉬
::set commit_ment=프로젝트 이니셜 커밋.
::set commit_ment=플러터 안드로이드 앱 업데이트 PHASE 1
::set commit_ment=개발환경 이동 및 프로젝트 작동 테스트 완료
::set commit_ment=넷플리쓰 서치 탭의 서치 바 UI 구현
::set commit_ment=const 리펙토링 진행
::set commit_ment=리펙토링 일부 진행, README.md 참조
::set commit_ment=랜덤 앱 기능 추가, README.md 참조
::set commit_ment=Video Player 앱 UI 추가, README.md 참조
::set commit_ment=Video Player 앱 플러그인 문제 발견 및 해결 시도 중, README.md 참조
::set commit_ment=오늘도 웹툰 문제 발견/디버깅/문제해결완료 , README.md 참조
::set commit_ment=Video Player 앱 플러그인 문제 발견 및 해결완료. 하늘이 디지털 사진첩 사진 에셋 적용. README.md 참조
::set commit_ment=video 가 새로운 video 를 선택 했을 때 새로 선택한 비디오로 초기화 되지 않고 기존의 비디오로 초기화 되는 이슈발견
::set commit_ment=생물학적 나이 계산기 앱 추가
::set commit_ment=미세먼지 오픈 API 앱 추가
::set commit_ment=미세먼지 오픈 API 앱 연동 및 중간 일부 리펙토링
::set commit_ment=미국주식 오픈 API 앱 추가, 일부리펙토링, README.md 참조
::set commit_ment=깃허브 레포지토리명 변경전 백업
::set commit_ment=깃허브 레포지토리명 변경후 첫 커밋 테스트
::set commit_ment=README.md 최신화
::set commit_ment=세계지도 화면, 근태관리 화면 추가, 지도 API 연동, README.md 참조
set commit_ment=신규 기능 추가, 추가코드샘플 테스트, README.md 참조






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
@REM echo %~n0.log
@REM timeout 15
@REM pause

