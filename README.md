# Flutter All In One 프로젝트
- 클론 코딩 결과물 수집
- 플러터 샘플 코드 수집
- 플러터 문제 발생 시 시도대안 코드 수집
- 강의 응용 결과물 feat. 노마드 코더 flutter 기초앱 클론코딩 
- 강의 응용 결과물 feat. 인프런 flutter 넥플릭스 클론코딩 
- 강의 응용 결과물 feat. 인프런 [코드팩토리] [초급] Flutter 3.0 앱 개발 - 10개의 프로젝트로 오늘 초보 탈출! 
- android 기반으로 개발


# 개발정책(작업약속)
- 추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError() 를 사용하도록 작업약속.
- 추후 묘사용 주석 작성 //대신에 /**/(여러줄 주석용 주석) 로 작업약속.



# 작업완료(DONE) 2023 07 20 12:29:03 까지 작업완료사항
###  Don't invoke 'print' in production code. 에 대한 리펙토링 
- print() 호출 되는 부분 일괄 printWithoutErrorOrPrintWithError() 로 변경
- printWithoutErrorOrPrintWithError()는 IDE 에서 제공하는 Don't invoke 'print' in production code. 에 대한 에러를 한번에 처리하기 위해서 만듬.
- 추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError() 를 사용하도록 작업약속.

###  dart 디렉토리명(패키지명?)에 대한 리펙토링 
- snake case 로 변경

###  The file name 'ScreenPracticeApiConnection2.dart' isn't a snake_case identifier. 에 대한 리펙토링 
- Upper Calmel Case 로 변경

###  The file name 'SampleRoutingScreenSecond.dart' isn't a snake_case identifier. 에 대한 리펙토링 
- 파일명을 snake case 로 변경

###  dart 객체명에 대한 리펙토링 
- Upper Calmel Case 로 변경

###  The variable name 'mkr' isn't a lowerCamelCase identifier. 에 대한 리펙토링 
- Lower Calmel Case 로 변경

###  Constructors in '@immutable' classes should be declared as 'const'. 에 대한 리펙토링 
- const 를 붙임

###  dart 파라미터명에 대한 리펙토링 
- Lower Calmel Case 로 변경

###  imports 에 대한 리펙토링 
- 사용하지 않는 library 는 imports.dart 로 주석하여 이동

###  Use interpolation to compose strings and values. 에 대한 리펙토링 
- String interpolation 문맥으로 교체

###  Constructors for public widgets should have a named 'key' parameter. 에 대한 리펙토링 
- key 삽입

###  Invalid use of a private type in a public API. 에 대한 리펙토링 
- createState() 메소드 자료형 및 return 값 수정

- 리펙토리용 스니펫
    @override
    State<mkr> createState() =>  mkr2();

###  An uninitialized field should have an explicit type annotation. 에 대한 리펙토링 
- 자료형 변경 ex) var > Color

###  Unnecessary 'null' comparison before assigning a value. 에 대한 리펙토링 
- ex before) if (widget.borderRadius == null) {
  widget.borderRadius = BorderRadius.circular(5);
  }를
- ex after) widget.borderRadius ??= BorderRadius.circular(5); 로 변경 

###  묘사용 주석은 /**/(여러줄 주석용 주석) 로 일부 변경 
- 종종 보이면 추가 수정 계획
- 추후 묘사용 주석 작성 //대신에 /**/(여러줄 주석용 주석) 로 작업약속.

### flutter 앱 랜덤 앱 추가
 

# 작업중(ING)
- flutter 앱 랜덤 앱 추가



# 추후할일(TO DO)
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


- flutter 앱 10시 45분 점심 구매하러 가실시간입니다
- flutter 앱 7시 하늘이 돌봄 알람
- flutter 앱 8시 50분에 출근처리 알람
- flutter 앱 랜덤 스케줄
- flutter 앱 텔레그램
- flutter 앱 만나이 계산기
  52 = 2023-1971(kjh age)
  생년월일->만나이
  print(~.inYear);

- flutter app 5번째주 첫일 계산기
  국가기술표준원 KS X ISO8601 에 의거 약속됨.
  1. 한주는 월요일부터 일요일까지이다.
  2. 첫번째 목요일을 포함하는 주이다 
    달을 볼때 첫번째 목요일을 1 한다
    그 목요일을 포함한 주를 1 한다
    그게 첫주다.

- getBiologicalAge(birthday, refday):			
  1994 04 05		2023 03 13
  #생일전		
  if
    28=2023-1994-1
  # 생일후
  else :  
    29=2023-1994    except:
    print(-->'yyyy mm dd' 꼴로 파라미터를 입력해주세요)
    print(-->'ex 1994 04 05')

 
    
# 작업개인회고
### 리펙토링에 대하여
  dart의 코드 작성 스타일을 지금보다 더 숙련되지 않은 상태에서 만든 코드들에 대한 리펙토링이 필요했고 수행했다.
  작은 problems 가 쌓여서 엄청 많아졌지만 IDE 의 도움으로 꽤 빠르게 처리할 수 있었다.
  그럼에도 노란색 지그재그 밑줄은 만들지 중간 중간 미리 리펙토링 해두는 것이 좋겠다 생각을 했고 앞으로 중간중간 리펙토링 할 것이다.
  