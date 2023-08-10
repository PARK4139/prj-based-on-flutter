# ✔️프로젝트 묘사
- 멀티플랫폼 프로젝트(플러터 프레임워크 기반)
- 스크린 기반으로 만든 통합 All In One 앱.
- 클론 코딩 응용 결과물 (# feat. # 노마드 코더 flutter 기초앱 클론코딩 # 인프런 flutter 넥플릭스 클론코딩 # 인프런 [코드팩토리] [초급] Flutter 3.0 앱 개발) 
- 플러터 문제 발생 시 시도대안 코드 수집
- 플러터 샘플 코드 수집
- 실험 코드 수집 및 정리






# ✔️개발정책
- Minimum Viable Product (MVP) 를 빠르게 구축하는 것을 목표로 한다.
- 클린 아키텍쳐를 지향하며 모방한다.
- Android/IOS/웹 순서로 작업진행.
- 추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError()로 대체하던 것을 도태.
- 추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutError()로 대체
- 추후 묘사용 주석 작성 //대신에 /**/(여러줄 주석용 주석) 로 작업약속.
코드묘사용 주석은 /**/(여러줄 주석용 주석) 로 일부 변경 
종종 보이면 변경 계획 
- 추후작업에서 Navigator 의 pop() 기능을 필요로 할 시 maybePop() 으로 대체 
- 주석 작성을 생활화






# ✔️DONE  
#### main.dart
- 위젯트리 상태관리 bloC/cubit 적용(isDarkMode 변수)
#### 개발자도우미 앱
- 클립보드 복사 기능(clipboard 라이브러리)
#### 프로모도 앱
- UI 구현 
- 디스플레이 시간 갱신 기능(async 내장라이브러리 내의 Timer 클래스) 
- 타이머 기능 
- 프로모도 시간관리 기능   
#### 랜덤 앱
- UI 구현 
- 랜덤버튼을 눌러 4자리 정수를 랜덤으로 생성하는 기능 
- 라우팅 기능 
#### 참 펜시한 메모장 앱
- UI 구현 
- 아코디언 메뉴 기능   
#### 당근마껫 앱
- UI 구현 
- 라우팅 기능
- 네비게이션바 기능
#### 넷플릿쓰 앱
- UI 구현 
- 라우팅 기능
- 네비게이션바 기능
- 검색 기능
#### TTS 앱
- TTS 기능(flutter_tts 라이브러리)
#### 구글 앱
- UI 구현 
- web view 기능(webview_flutter 라이브러리)
- history 페이지로 라우팅 기능
#### 내 프로필 소개 앱
- UI 구현 
- 하이퍼링크 기능(linkify 라이브러리)
- 스낵바 기능
#### Video Player 앱
- UI 구현 
- 관련 비디오 재생 기능((video_player 라이브러리))
- 관련 이미지 asset
- 관련 font family 
- 오늘도 웹툰 디버깅. Class Future<List<Webtoon>> has no instance getter entries. 에러 디버깅. iteralble 을 print() 코드를 해서 생긴 문제 의심스러운 부분을 주석으로 처리하여 디버깅/수정/테스트
- 실행하여 화면 로고를 클릭하여 영상 갤러리 화면으로 전환 후 특정 영상 클릭 시 의도와는 다르게 홈화면으로 돌아가는 문제 디버깅/수정/테스트.
- 플러그인에 문제가 있을 수 있다는 내용을 알게 되어서, 내용 확인 후 플러그인에 문제를 해결할 수 있도록 Android/app/build.gradle 디버깅/수정/테스트
- 라우팅 기능
- 갤러리로 이동 기능 버튼
- 영상 5초 간격 뒤로/앞으로 이동 기능 버튼
- 영상 재생 멈춤 토글 기능 버튼 
<!-- video 가 새로운 video 를 선택 했을 때 새로 선택한 비디오로 초기화 되지 않고 기존의 비디오로 초기화 되는 이슈 디버깅/수정/테스트 -->
#### 나이 계산기 앱
- UI 구현 
- 생물학적 나이 계산 로직 구현
#### 웹툰 API 앱
- UI 구현 
- API 연동
- 외부 네트워크 이미지 연동 기능 
#### 미세먼지 오픈 API 앱
- UI 구현 
- 공공데이터 포털 API 연동(API 키 신청/코드 적용)[미세먼지/초미세먼지]
- Json 데이터 직렬화 기능(dio 라이브러리)
- 미세먼지 시현 카드 구현
- 초미세먼지 시현 카드 구현
#### 세계지도 API 앱
- 기획
- 지도기능 (google_maps_flutter 라이브러리)
- GPS위치좌표 출력 기능(geolocator 라이브러리)
#### 근태관리 API 앱
#### 미국주식 API 앱
- UI 구현 
- 미국주식 API 연동(API 키 신청/코드 적용)[특정기간기준 상장/비상장 목록]
- csv 데이터 직렬화 기능(csv 라이브러리)
- 테이블 UI Component 인 TableMaker 위젯을 작성



# ✔️ING(작업중)
#### 미국주식 API 앱
ListView(), DataTable() 을 사용하여 item 이 너무 많을 때 out of memory 가 되는 문제를 마주했다.
이는 ListView.builder() 로 해결을 했다.  ListView.builder() 는 매우 잘 만들어졌다.
children:[] 내의 화면에 보여지는 child wiget 에 대해서만 렌더링을하고 나머지 child wiget 에 대해서는 dispose()를 해주는데. 
이 부분이 구현해본적이 없는데 덕분에 쉽게 해결하고 넘어가게 되었다. DataTable() 도 마찬가지 테이블 형태에 미국주식 API 를 통해 받은 데이터들을 직렬화 시킨 뒤
화면에 보여주려고 했으나 out of Memmory 가 나타났고, 이는 아예 도표 형태를 구현하는 계기가 되어 도표를 만들었다.

 




 


# ✔️TO DO
- The value of the field '_imageSliderCurrentPage' isn't used. 에 대한 리펙토링
아니 분명히 필드가 참조되는데도 불구하고 이 에러가 왜 나타나는지 모르겠다. .. 어딘가 내가 잘못했겠지?...
- An uninitialized field should have an explicit type annotation. 에 대한 리펙토링
    방법을 찾아야 한다.
- This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: CircleBoxMaker.item  에 대한 리펙토링
    방법을 찾아야 한다.
- Field overrides a field inherited from 'Coach'.  에 대한 리펙토링
  방법을 찾아야 한다.
- Use an initializing formal to assign a parameter to a field. 에 대한 리펙토링
  방법을 찾아야 한다.
- 스케쥴링 앱
  10시 45분 점심 구매하러 가실시간입니다
  7시 하늘이 돌봄 알람
  8시 50분에 출근처리 알람
  랜덤 스케줄
  잠정 스케줄
- 텔레그램 앱 
- 번째주 계산기 
  국가기술표준원 KS X ISO8601 에 의거 약속됨.
  1. 한주는 월요일부터 일요일까지이다.
  2. 첫번째 목요일을 포함하는 주이다 
    달을 볼때 첫번째 목요일을 1 한다
    그 목요일을 포함한 주를 1 한다
    그게 첫주다.
- tech blog 앱 (밑은 참고 자료)
  이건 웹으로 컨텐츠를 만들고 웹뷰로 만드는 건 어떤가?
  플러터 웹 뭔가 구현해보고 싶은 생각이 들었다.
  https://muhly.tistory.com/26
  https://tmdfyd0807.tistory.com/89
- http 연동 테스트(밑은 참고 자료)
  https://tmdfyd0807.tistory.com/107?category=1025772
- 사진첩 앱
타일스프레디드화면에서 사진클릭 시 전체화면 기능
전체화면에서 손가락을 이용한 zoom in, zoom out 제스쳐 시 사진 zoom in, zoom out 기능
감상 모드로 전환이 되는 버튼 UI 구현
감상 모드로 전환이 되는 버튼 클릭 시 감상 모드로 전환
감상 모드에서는 화면이 자동으로 넘어감.   
- 동물동감 앱
- 강아지도감 앱
- 식물도감 앱
- 디지몬?(게임몬스터)도감 앱
- 프로젝트명을 prj_app_for_mvp 로 변경한다.



  
# ✔️작업개인회고
### 리펙토링에 대하여
dart의 코드 작성 스타일을 지금보다 더 숙련되지 않은 상태에서 만든 코드들에 대한 리펙토링이 필요했고 수행했다.
작은 problems 가 쌓여서 엄청 많아졌지만 IDE 의 도움으로 꽤 빠르게 처리할 수 있었다.
그럼에도 노란색 지그재그 밑줄은 만들지 중간 중간 미리 리펙토링 해두는 것이 좋겠다 생각을 했고 앞으로 중간중간 리펙토링 할 것이다.
### 클린아키텍쳐에 대하여
프로그래밍을 하면 반복되는 많은 패턴의 일들이 있고 프로그래머들이 선호하는 것들이 생겨나는 것 같다.
API 를 연동하는 일에서도 객체를 만드는 일도 패턴이 존재한다.
프로젝트 트리(디렉토리,패키지)를 만드는 일도 패턴이 존재한다.
이를 따르는 것이 가독성도 높이고, 협업하기 좋고, 유지보수 까지도 좋게 만들어 주는 것 같다.
하지만 아직은 모르겠다. 어떤게 모범사례이고 어떻게 따르는 것이 좋은 것인지.
갈길이 멀어보인다. 이런 것을 가이드해줄 좋은 사수를 만나고 싶다는 생각이 들었다.
### API 연동에 대하여
이제 API 연동은 이제 할 수 있다는 자신감이 꽤나 생겼다.
하지만 자만은 금물. 실수한 부분이 없는지 확인하고, 어떻게 해야 효율적인지 고민을 늘상하자.
### 주석 작성정책에 대하여
주석작성정책이 필요하다. 중구난방으로 작성된 프로젝트는 시간이 흐른뒤 다시 보아쓸때 보기가 불편했다.



 

# ✔️리펙토링 방법 정리 
- Don't invoke 'print' in production code. 
print() 호출 되는 부분 일괄 printWithoutErrorOrPrintWithError() 로 변경
printWithoutErrorOrPrintWithError()는 IDE 에서 제공하는 Don't invoke 'print' in production code. 에 대한 에러를 한번에 처리하기 위해서 만듬.
추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError() 를 사용하도록 작업약속.
- dart 디렉토리명(패키지명?)
snake case 로 변경
-  The file name 'ScreenPracticeAPIConnection2.dart' isn't a snake_case identifier. 
Upper Calmel Case 로 변경
-  The file name 'SampleRoutingScreenSecond.dart' isn't a snake_case identifier. 
파일명을 snake case 로 변경
-  dart 객체명
Upper Calmel Case 로 변경
-  The variable name 'mkr' isn't a lowerCamelCase identifier. 
Lower Calmel Case 로 변경
-  Constructors in '@immutable' classes should be declared as 'const'. 
const 를 붙임
-  dart 파라미터명
Lower Calmel Case 로 변경
-  imports 
사용하지 않는 library 는 imports.dart 로 주석하여 이동
-  Use interpolation to compose strings and values. 
String interpolation 문맥으로 교체
-  Constructors for public widgets should have a named 'key' parameter. 
key 삽입
-  Invalid use of a private type in a public API. 
createState() 메소드 자료형 및 return 값 수정
리펙토리용 스니펫
    @override
    State<mkr> createState() =>  mkr2();
-  An uninitialized field should have an explicit type annotation. 
자료형 변경 ex) var > Color
-  Unnecessary 'null' comparison before assigning a value. 
ex before) if (widget.borderRadius == null) {
  widget.borderRadius = BorderRadius.circular(5);
  }를
ex after) widget.borderRadius ??= BorderRadius.circular(5); 로 변경 





# ✔️클린 아키텍쳐를 위한 프로젝트 리펙토링 일지
- 클린 아키텍쳐 이해가 부족하지만 최대한 노력.
- 디렉토리명(패키지명) 수정
- 파일(다트파일 등)을 분류하여 이동
- 다트파일 내 import 일괄 수정
- 생성파일(.g.dart)에서 g. 를 제거하여 이력관리가 되도록.
- gitignore 에 *.g.dart 등록 
- API key 가 배포되지 않도록 gitignore 등록
