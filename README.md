# Flutter All In One 프로젝트
- 클론 코딩 결과물 수집
- 플러터 샘플 코드 수집
- 플러터 문제 발생 시 시도대안 코드 수집
- feat. 노마드 코더 flutter 기초앱 클론코딩 강의
- feat. 인프런 flutter 넥플릭스 클론코딩 강의
- feat. 인프런 [코드팩토리] [초급] Flutter 3.0 앱 개발 - 10개의 프로젝트로 오늘 초보 탈출!
- android 기반으로 개발




# 진행사항
- Don't invoke 'print' in production code. 에 대한 리펙토링 진행
  print() 호출 되는 부분 일괄 printWithoutErrorOrPrintWithError() 로 변경
  printWithoutErrorOrPrintWithError()는 IDE 에서 제공하는 Don't invoke 'print' in production code. 에 대한 에러를 한번에 처리하기 위해서 만듬.
  추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError() 를 사용하도록 작업약속선언.

- dart 디렉토리명(패키지명?)에 대한 리펙토링 진행
  snake case 로 변경

- The file name 'ScreenPracticeApiConnection2.dart' isn't a snake_case identifier. 에 대한 리펙토링 진행
  Upper Calmel Case 로 변경

- The file name 'SampleRoutingScreenSecond.dart' isn't a snake_case identifier. 에 대한 리펙토리 진행
  파일명을 snake case 로 변경

- dart 객체명에 대한 리펙토링 진행
  Upper Calmel Case 로 변경

- The variable name 'mkr' isn't a lowerCamelCase identifier. 에 대한 리펙토링 진행
  Lower Calmel Case 로 변경

- Constructors in '@immutable' classes should be declared as 'const'. 에 대한 리펙토링 진행
  const 를 붙임

- dart 파라미터명에 대한 리펙토링 진행
  Lower Calmel Case 로 변경

- imports 에 대한 리펙토링 진행
  사용하지 않는 library 는 imports.dart 로 주석하여 이동

- Use interpolation to compose strings and values. 에 대한 리펙토링 진행
  String interpolation 문맥으로 교체

- Constructors for public widgets should have a named 'key' parameter. 에 대한 리펙토링 진행
  key 삽입

- Invalid use of a private type in a public API. 에 대한 리펙토링 진행
  createState() 메소드 자료형 및 return 값 수정
  리펙토리용 스니펫
  @override
  State<mkr> createState() =>  mkr2();

- An uninitialized field should have an explicit type annotation. 에 대한 리펙토리 진행
  자료형 변경 ex) var -> Color

- Unnecessary 'null' comparison before assigning a value. 에 대한 리펙토리 진행
  ex before) if (widget.borderRadius == null) {
  widget.borderRadius = BorderRadius.circular(5);
  }를
  ex after) widget.borderRadius ??= BorderRadius.circular(5); 로 변경



- 묘사용 주석은 /**/(여러줄 주석용 주석) 로 일부 변경
  종종 보이면 추가 작업 계획
  추후 묘사용 주석 작성 //대신에 /**/(여러줄 주석용 주석) 로 작업약속선언.

# 작업약속
  추후 print() 를 사용하는 상황이 왔을 때는 print() 대신에 printWithoutErrorOrPrintWithError() 를 사용하도록 작업약속선언.
  추후 묘사용 주석 작성 //대신에 /**/(여러줄 주석용 주석) 로 작업약속선언.

# 작업개인회고
  dart의 코드 작성 스타일을 지금보다 더 숙련되지 않은 상태에서 만든 코드들에 대한 리펙토링이 필요했고 수행했다.
  작은 problems 가 쌓여서 엄청 많아졌지만 IDE 의 도움으로 꽤 빠르게 처리할 수 있었다.
  그럼에도 노란색 지그재그 밑줄은 만들지 중간 중간 미리 리펙토링 해두는 것이 좋겠다 생각을 했고 앞으로 중간중간 리펙토링 할 것이다.

# 추후할일
  The value of the field '_imageSliderCurrentPage' isn't used. 에 대한 리펙토링
  아니 분명히 필드가 참조되는데도 불구하고 이 에러가 왜 나타나는지 모르겠다.  

  An uninitialized field should have an explicit type annotation. 에 대한 리펙토링
  방법을 찾아야 한다.
    
  This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: CircleBoxMaker.item  에 대한 리펙토링
  방법을 찾아야 한다.

  Field overrides a field inherited from 'Coach'.  에 대한 리펙토링
  방법을 찾아야 한다.

  Use an initializing formal to assign a parameter to a field. 에 대한 리펙토링
  방법을 찾아야 한다.

  