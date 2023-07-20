import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_worker.dart';

import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/toggle_maker.dart';

import '../../main.dart';
import '../../screen_index_colorful.dart';
import '../helpers/CheckBoxMaker.dart';
import '../helpers/planed_schedule_management_helper.dart';
import '../helpers/main_content_maker.dart';
import '../helpers/rainbow_icon_maker.dart';
import '../helpers/rainbow_text_maker.dart';




class ScreenWeiredMyNote extends StatefulWidget {
  const ScreenWeiredMyNote({super.key});

 

  @override
  State<ScreenWeiredMyNote> createState() => _ScreenWeiredMyNoteState();


}

class _ScreenWeiredMyNoteState extends State<ScreenWeiredMyNote> {
  TextStyle textStyle1 = const TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w900);
  TextStyle textStyle2 = const TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.w900);
  TextStyle textStyle2underLine = const TextStyle(
    fontSize: 27,
    color: Colors.black,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.underline,
    decorationColor: Colors.red,
    decorationThickness: 2,
  );
  TextStyle textStyle2CanceledLine = const TextStyle(
    fontSize: 27,
    color: Colors.white,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.red,
    decorationThickness: 2,
  );
  TextStyle textStyle3 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w100);
  TextStyle textStyle4 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100);
  TextStyle textStyle5 = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);

  late bool isDarkMode;

  bool isMainTextContentBoxClicked = false;

  bool isMainContentClicked = false;

  // List<dynamic> SampleWeiredItems = [];
  // List<Widget> SampleWeiredWiget  = [];

  @override
  void initState() {
    super.initState();
    isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;
    // SampleWeiredItems = [];
    // SampleWeiredWiget= <Widget>[
    //   for (var item in SampleWeiredItems) Text('${SampleWeiredItems.indexOf(item)}'),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.9),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Column(
              children: [
                /*닫기 버튼*/ SizedBox(
                  height: 60,
                  // width:  60,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 1,
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: const Offset(300, 30),
                                child: Transform.rotate(
                                  angle: 40.05,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: IconButton(
                                      icon: Icon(Icons.add_circle_outlined, color: Colors.white.withOpacity(0.9)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      tooltip: "",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                for (int i = 1; i < 7; i++) const SizedBox(height: 3),
                /*참 펜시한 메모장 : 타이틀*/ Center(
                  child: InkWell(
                    onTap: () {
                      printWithoutErrorOrPrintWithError("참 펜시한 메모장:");
                    },
                    child: Column(
                      children: [
                        /*메인타이틀*/ Transform.translate(
                            offset: const Offset(80 - 50, 0 + 20),
                            child: Row(
                              children: [
                                Text('참 ', style: textStyle2),
                                Text('이상한 ', style: textStyle2CanceledLine),
                                RainbowTextMaker(text: '펜시', color: Colors.white, fontSize: 27, fontWeight: FontWeight.w900),
                                Text('한 ', style: textStyle2),
                                Container(color: Colors.yellowAccent, child: Text('메모장', style: textStyle2underLine)),
                              ],
                            )),
                        /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(80 + 20 + 10 + 10 + 10 + 6, -60 + 10 + 10 + 10 + 10), child: Transform.rotate(angle: -0.11, child: TextButton(onPressed: () {}, child: Text('📋', style: textStyle1)))),
                      ],
                    ),
                  ),
                ),
                for (int i = 1; i < 2; i++) const SizedBox(height: 3),
                MainContentMaker(level1widget: Text('📋', style: textStyle5), level1text: '오늘의 스케쥴', level2items: const [
                  """
DONE
- 프로모도 앱
- 참 펜시한 메모장
- 오늘도 웹툰
- 당근마껫
- 넷플릿쓰
- 구굴
- 내 프로필

""",
                  """
ING

플러터를 공부합니다!
""",
                  """
TO DO

움직이는 벌레 만들기
	현재 디바이스의 좌표를 가져온다.
	좌측 상단 0,0 을 기준으로 얼마나 움직여도 되는지 허용범위를 알아낸 다음
	offset 을 사용하면 될것 같다.
	기어가는 방향에 따라서 회전을 하도록 한다.

UI 업데이트


flutter 로 만들어야 할 기능들. 
    동네별/주제별 게시판(글, 댓글, 대댓글)
    1:1 유저 친구 매칭
    1:1 채팅
    GPS 기반 유저 인증
    소셜/이메일 로그인
    게시판 내 검색 기능 등. 
    앱 내 인증 및 등급 제도 등

[기존 기능] vs [개발 예정 신규 기능]


""",
                ]),
                MainContentMaker(level1widget: const Icon(Icons.phone_android, color: Colors.grey), level1text: 'App 요약정리', level2items: [
                  /*Flutter 핵심 요약:타이틀*/ InkWell(
                    onTap: () {
                      printWithoutErrorOrPrintWithError("/*Flutter 핵심 요약:타이틀*/");
                    },
                    child: Column(
                      children: [
                        /*메인타이틀*/ Transform.translate(offset: const Offset(10, 0 + 20), child: Text('Flutter 핵심 요약', style: textStyle2)),
                        /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(-80 - 5, -40 - 5), child: Transform.rotate(angle: 0.22, child: Text('위젯 ?', style: textStyle1))),
                        /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(100 + 4, -60 - 8), child: Transform.rotate(angle: -0.11, child: Text('상태관리 ?', style: textStyle1))),
                      ],
                    ),
                  ),
                  """
멀티플랫폼?

React Native 는 JavaScript 기반 mobile framework 이다. 
React Native 는 native 가 아니었다. native app 을 추구하는 것 뿐 native app 을 만드는 framework 가 아니다 
""",
                  """
플러터?

dart 기반 mobile framework 이다. 
매우 많은 개발 비중을 차지하는 부분이 위젯이다. 
flutter 기반의 앱에서 UI 컴포넌트를 담당하는 개념이다
""",
                  """
WHY? 플러터👍 
  
WHY? 플러터 bad
성능이 native app 에 비해 떨어진다...
많은 트래픽을 처리하는 데에는 문제가 있어 보인다.
그래서 고객이 적은 스타트업에서 많이 사용하는 분위기 이다 
""",
                  """
플러터 UI 컴포넌트?
플러터에서는 아주 중요한 UI 컴포넌트 개념이 있다.
위젯이라는 UI component 컨셉이 매우 중요하다.
""",
                  """
플러터 화면?

Flutter에서 route 로 불립니다.
   screen == page == route 요런 느낌으로 의사소통이 됩니다.  
   Flutter앱의 route vs Android앱의 Activity vs iOS앱의 ViewController 요렇게 대등한 느낌
""",
                  """      
stful wiget vs stless wiget
    stless wiget life cycle 
        constructor 실행
          build() 실행 //특히 build()는 stless wiget life cycle 내 에서 단 한번만 실행 된다.
                     

    stful wiget life cycle (basic)
        constructor 실행
          createState 실행// 아마 부모의 메소드로 생각된다. // 이것도 단 한번만 샐행이 되는 것으로 상상이 되는데 맞는지는 모르겠다.
            initState() //stful wiget life cycle 내에서 단 한번만 실행이 된다. //stless wiget life cycle 에서 build() 처럼 1 번만이다.
              didChangeDependencies()
                dirty//didChangeDependencies() 가 호출이 된 상태도 dirty 상태이다.
                  build() //화면을 그려주는 메소드 # 이 게 호출 된 상태를 clean 상태라고 부른다. 
                   clean//현재의 clean 상태에서는 4가지 루트가 있다.
                    1. clean 상태로 가만히 있는다.
                    2. didUpdateWiget 실행 (파라미터가 바뀌었을 때)//변수가 초기화 되었을 때? 위젯의 필드가?
                    3. setState() 실행(setState를 실행헀을 때)
                      // UI 상의 값이 변경 시 UI 를 refresh 하기 위해서 사용되는 method 이다.
                      // framework.dart 에 있는 abstract class 이다. 
                      // 경험적으로, build 된 이래로 즉 clean 상태 이래로 화면이 갱신이 되는 경우에 override 를 해서 사용했던 것 같다.
                      // 사용하지 않으면. 함수를 바인딩해서 호출해도 값이 바뀌지 않았다.
                      // 앱 시스템에서 Flutter에게 UI refresh 를 요청하기 위해서 필요한 method 처럼 느껴졌다. 
                    4. deactivate 실행
                       deactivate 실행 이  진행된다면 
                         dispose 실행 // 경험적으로 Timer, TextEditController 를 사용한 경우에 override 를 해서 사용했던 것 같다.
        ............
       stful wiget life cycle (파라미터가 바뀌었을 때)
          constructor 실행// constructor 실행 이후의 상태가 clean 상태이면 진행이 된다고 한다. 
            didUpdateWiget 실행
              dirty//didUpdateWiget 가 실행된 후의 상태는 dirty  상태라고 부른다.
                  build() //화면을 그려주는 메소드 
                      clean  //# build()가 호출 된 상태를 clean 상태라고 부른다.
        ............
        stful wiget life cycle (setState를 실행헀을 때)
          setState()
            dirty
              build()
                clean
                
        stful wiget 의 repeatable 라이프 사이클 총정리
          1. wiget constructer 호출//[wiget 존재 상태]
            if(find_previous_state()==false) { //[wiget==신생위젯]
               wiget.createState()//[state 존재 상태]
               wigetState.initState()
               didChangeDependencies() //  clean -> dirty
               build() //  dirty -> clean
               
               if(event==clean 상태로 가만히 있는다먼){
               
               }else if(event==파라미터가 바뀌었다면){
                  didUpdateWiget();//  clean -> dirty 
               }else if(event==setState()를 호출했다면){
                  setState()//  clean -> dirty
               }else if(event==deactivate()를 호출했다면){
                  dispose()
               }else if(event==dispose()를 호출했다면){
               
               }
               
                       
                    
               
               
            }else{ //[wiget==기존위젯]
            
            }
            
               
          
          
          
           
          3. dirty 상태가 되면 clean 상태로 만든다.
          5. clean 상태 
           
           
           
        
""",
                  """          
build() 메소드
    all wiget havs build().
        build() 의 BuildContext context
            context parameter 는 아 중요한 기능이 있다.
                wiget tree 내에서 wiget 간 데이터 접근 이다.
                    wiget tree 내에서 wiget 간 데이터 접근하는 방법
                        //! 로 확실하게 다른 wiget 의 데이터 접근하도록
                        Text(
                            'foo',
                            style: TextStyle(
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Theme.of(context).textTheme.titleLarge!.color,
                            ),
                        ),
                        //? 로 optional 하게 다른 wiget 의 데이터 접근하도록
                        Text(
                            'foo',
                            style: TextStyle(
                                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, 
                                color: Theme.of(context).textTheme.titleLarge?.color,
                            ),
                        ),                  
""",
                  """                     
플러터 위젯의 상태관리?

플러터 기반 앱에서는 상태관리 기법이 여러 방법으로 해결된다.
  GetX
  bloc
  flutter_provider  
""",
                  """
플러터 라이브러리 요약정리                  
  flutter_tts 3.6.3
      TTS 라이브러리
  
  path_provider 
      mobile local system access 돕는 라이브러리
      모바일 플랫폼이 뭔지 파악하여 개발자에게 local path를 제공할 수 있다.
            
  flutter_provider
     구글에서 제공하는 상태관리 라이브러리이다
     그럼에도 불구하고 2023년 현재 기준 다른 회사에서는 
     상태관리 라이브러리를 GetX라 BloC 이라던지 다른 것을 많이 쓰는 것 같아 보인다.
     이유가 있겠지...  
          
""",
                  """
플러터 앱 최적화?              
const 를 많이 붙여야 동작하는 속도가 빨라질 것이다.
const 는 build time 에서 값을 const 변수 자리에 값을 미리 할당을 하기 때문에
const 를 많이 붙이면 앱동작속도향상에 많은 도움이된다고 한다

안드로이드 스튜디오에서 플러터 앱의 const 최적화        
  flutter app optimization
      memory optimization
          const variable
              android studio
                  alt enter
                      add 'const' modifiers everywhere in file
                          enter
              
""",
                  """
Firebase 연동?

Firebase 는 serverless 의 실제 서비스 중의 구현체 중의 하나이다.
""",
                  """
웹 앱?

저확히 앱이 아니고 웹이다.
앱 스토어, 플레이 스토어의 심사도 필요없는 장점
크로스 플랫폼 프레임워크 필요 없음.
개발비용 저렴
기본적으로 웹 앱은 브라우저를 연 다음 필요한 앱 주소를 입력해서 접속
그 자체로 서비스되기보다는 하이브리드 앱 또는 PWA의 형태로 보완되어 제공됩니다.


""",
                  """
웹앱 으로는 구현이 불가능하거나 어려운 기능.

높은 사양이 요구되는 작업 불능
스마트폰 내부의 파일들을 다루는 기능
각종 하드웨어 장치를 다루는 기능
""",
                  """
하이브리드 앱?
대다수 콘텐츠를 웹 사이트로 제공하면서 추가로 네이티브 앱에서 사용 가능한 기능까지 제공하는 앱

원리? 
네이티브 또는 크로스 플랫폼 방식으로 앱을 만들되 화면 안에 요소를 직접 만들지 않고, 
브라우저 역할을 하는 웹 뷰라는 요소를 만들어 대신 웹 화면을 띄웁니다. 
그러면 웹 뷰는 지정된 주소로 접속해서 웹 앱 형태로 만들어진 웹사이트를 화면에 보여줍니다. 
사용자는 이 웹 뷰를 통해 웹사이트로 만들어진 기능을 앱 기능처럼 사용합니다.
그리고 웹사이트에서 제공할 수 없는 하드웨어 기능인 카메라나 푸시 알림 같은 기능은 네이티브 단에서 자체적으로 수행하도록 하는 것입니다.

앱을 하이브리드 형태로 만들면 네이티브 앱과 웹 앱의 장단점을 활용해서 제품을 유연하게 운영할 수 있습니다.
웹사이트로 구현이 불가능한 필수 기능들만 네이티브 앱으로 개발하고, 나머지 기능은 모두 웹 뷰 안에 들어갈 웹사이트로 만들면 되기 때문에 비교적 개발 부담이 적습니다.
앱 기능을 업데이트할 때를 제외하고 앱 마켓의 심사 없이 언제든지 앱의 내용을 수정할 수 있다는 장점도 있죠.
또한 앱의 특성에 따라 네이티브로 제작할 부분과 웹 뷰로 제공할 부분을 다양하게 구성할 수 있습니다.

  
""",
                  """
프로그레시브 웹 앱(PWA)?
쇼핑몰 같이 사용자의 방문이 많을 수 있고 웹과 모바일 둘 다 되는 앱을 구상 중인 경우: 

앱의 성능이나 실행될 장치의 하드웨어 방면 기능이 매우 필요한 경우: 네이티브 앱(Native App) 선택
쇼핑몰 같이 사용자의 방문이 많을 수 있고 웹과 모바일 둘 다 되는 앱을 구상 중인 경우: 프로그레시브 웹 앱(PWA)을 선택
웹 개발에 익숙하고 빠른 기간 내에 앱을 구축하고 싶은 경우: 하이브리드 앱(Hybrid App) 선택

  
""",
                  """
BaaS 연동?  

""",
                  """
JSON Serialization?
""",
                  """
Serverless ?
서버리스는 실제로 서버가 없는 게 아니라.
일반적인 개발자 단에서 DB를 실제 구축할 장소, 
장치와 같은 하드웨어에 대한 리소스적인 부분을 서버를 호스팅 해주는 서비스를 받아 시스템을 구축하는 컨셉을 일컫는 것으로 생각이된다.
DB 는 업체에 맡기고 DB 설정만 개발자가 프로젝트 소스 상에서 하면 되는 것으로 보인다.

고객 데이터 소실에 대한 책임은 누가?
고객 데이터 소실에 대한 책임에 대한 문제는 있어보인다.
""",
                ]),
                MainContentMaker(level1widget: Text('📑', style: textStyle5), level1text: '잡동사니', level2items: [
/*움직이는 벌레 버튼*/ Stack(
                    children: [
                      Opacity(
                        opacity: 1,
                        child: SizedBox(
                          height: 30,
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: Stack(
                              children: [
                                Transform.translate(
                                  offset: const Offset(300, -55 + 50 - 50 - 50),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Stack(
                                      children: [
                                        Transform.scale(
                                          scale: 1.3,
                                          child: Transform.translate(
                                            offset: const Offset(6, 6),
                                            child: RainbowIconMaker(iconData: Icons.bug_report),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.bug_report,
                                            // color: Colors.yellowAccent,
                                            color: Colors.blueAccent,
                                            shadows: [],
                                            semanticLabel: "이건 뭐다냐",
                                          ),
                                          onPressed: () {
                                            // Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ScreenIndexColorful(isDarkMode: isDarkMode),
                                              ),
                                            );
                                          },
                                          tooltip: "디버깅용 벌레입니다~",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MainContentMaker(level1widget: Text('📂', style: textStyle5), level1text: '아이콘텍스트 모음', level2items: const [
                    """
✔️ CORRECT  
❌ INCORRECT
💻💼🖱🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤🕥🕦🕧
🔅🔆
🔈🔉🔊 
📁📂
📃📄📅📆📇📈📉📊📋
📎📏📐
📑
📒📒📓
📔📕📖📗📘📙
📚📛📜📝📵
😀😁😂😂😂😃😄😄😅😆😇😈😉😊😋😌😍😍😎😎😏
😐😑😒😓😔😕😖😗😘😙😚😛😛😜😝😞😞😟😠😠😡
😢😣😤😥😦😧😨😩😪😫
😬
😭😮😮‍💨😯😰😱😲😳😴😴😵😵‍💫
😶🙁🙂🙃
🙈🙈🙉🙊
🙋🙋
🙌🏻🙌🏼🙌🏽🙌🏾🙌🏿
🙏🏻🙏🏼🙏🏽🙏🏾🙏🏿
🥴🤐🤡🤢🤣🤤🤪🤫🤬🤮
🛠
⌚⌚⌚⌚⏱⏲☑⏰
♥
⌛⏳
⌨
☀☁☂️☂☃☔⛄⛅⛈
☄
☎
☑️

☕☕
☠
☢
☣
☦
☪️
☪
☮
☯
☸

✔
✝
✡
✨
✳
✴
❄
❇ 
❓❔
❕❗  
🐀🐀🐁🐂🐃🐄🐅🐆🐇🐈🐉🐊🐋🐌🐍🐍🐎🐏🐐🐑🐒🐓🐓🐔🐕🐕‍
🦺
🐖🐗🐘
🐚
🐛🐛🐜🐝🐞
🐟🐟🐠🐡🐢🐙
🐣
🐤🐥🐦🐧
🐨🐩🐪🐫🐬🐭🐮🐯🐰🐱🐲🐳🐴🐵🐵🐵🐶🐷🐸🐸🐹🐺🐻🐼🐽🐾
👙 
👞👟👠👡👢
👣👣
👤👥
👄👅
👫👫🏻👫🏼👫🏽👫🏾👫🏿👬👬🏻👬🏼👬🏽👬🏾👬🏿👭👭🏻👭🏼👭🏽👭🏾
👭🏿 💋💋‍💋‍💋‍‍💋‍💋‍🧑🏻‍‍🧑🏾🔥🔒🔓📍
💌💍💎💏💏🏻💏🏼💏🏽💏🏾💏🏿💐💑💑🏻💑🏼💑🏽💑🏾💑🏿
❤️‍❤️‍❤️💓💔💕💖💗💘💙💚💛💜💝🤍🖤
💞
💣💩💩💪💪🏻💪🏼💪🏽💪🏾💪🏿📌📞🔇🔏🔏🔐🔑🔕🔞️
👍
♈♈♉♊♋♌♍♎♏♐♑♒♓
♟
♠♣♥♦
♨
♻
♾
♿
⚒
⚓
⚔
⚕
⚖
⚗
⚙
⚛
⚜
⚠️♀♂♀️
⚪️
⚪
⚫
⚽⚽⚽
⚾
⛎
⛏️⛏
⛑
⛓
⛔
⛩
⛪
⛪
⛰
⛱
⛲
⛲
⛳
⛴
⛵
⛷
⛸
⛹
⛽
✂️
✈️
✉️
✋✋🏻✋🏼✋🏽✋🏾✋🏿
✍️✏️
✏
✒
⬛
⬜
⭐
⭕
🀄
🃏
🌀
🌁
🌂
🌃
🌄
🌅
🌆
🌇
🌈
🌉
🌊
🌋
🌋
🌌
🌍🌍🌎🌏
🌐
🌑🌒🌓🌔🌕🌖🌗🌘🌙🌚
🌝🌞
🌟
🌠
🌭
🌮
🌯
🌰
🌱🌲🌳🌴🌴🌵
🌶
🌷🌸🌹🌹🌺🌻🌼
🌽🌾
🌿
🍀
🍁🍂🍃
🍄
🍅🍅🍆🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🍓🍓🍔🍕🍕
🍖🍗
🍘🍙
🍚🍚
🍛🍜🍝
🍞
🍟
🍠
🍡
🍢
🍣🍤🍥🍦🍦🍧🍨🍩
🍪
🍫
🍬
🍭
🍮
🍯
🍰
🍱
🍲
🍳
🍴
🍴
🍵🍶🍷🍸🍹🍺🍻
🍼🍽🍾🍿🎀🎁🎂
🎃🎄🎅🎅🎅🏻🎅🏼🎅🏽🎅🏾🎅🏿
🎆🎇
🎈🎈
🎉🎊
🎋
🎌
🎍
🎎
🎏
🎐
🎑
🎒
🎓 
🎠
🎡
🎢
🎣
🎤
🎥
🎦
🎧
🎨
🎨
🎩
🎪
🎫
🎬
🎭
🎮
🎯
🎯
🎰
🎱
🎲
🎳
🎴
🎵
🎵
🎶
🎷
🎸
🎹
🎹
🎺
🎻
🎼
🎽
🎾
🎿
🏀 
🏂🏿
🏃 
🏄🏽 
🏍
🏎
🏏
🏐
🏑
🏒
🏓 
🏗️ 
🏭
🏮
🏯
🏰
🏳️🏳️ 
🏴🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿  
👳🏽 
👳🏾 
👳🏿 
👹 
👻 
👽
👾
👿
💀 
💃
💃🏻
💃🏼
💃🏽
💃🏾
💃🏿
💄
💅
💅🏻
💅🏼
💅🏽
💅🏾
💅🏿 
💈
💉
💊
💊
💒
💠
💡
💡
💢
💤
💥
💦
💧
💨
💫
💬
💭
💮
💯
💰
💱
💲
💲
💲
💳
💴
💵
💶
💷
💸
💹
💺 
📟
📠
📡
📢
📢
📣
📤
📥
📦
📧
📨
📩
📪
📫
📬
📭
📮
📯
📰
📱
📲
📳
📴
📶
📷📸
📹
📺
📻
📼
📽
📿 

🔋
🔌
🔍
🔎
🔔
🔖
🔗
🔘 
🔦
🔧
🔨
🔩
🔪
🔫
🔬
🔭
🔭
🔮
🔯
🔰
🔱 
🕋
🕌
🕍
🕎
🖕🖕🏻🖕🏼🖕🏽🖕🏾🖕🏿
🖖
🖖🏻
🖖🏼
🖖🏽
🖖🏾
🖖🏿 
🗻
🗼
🗽
🗾
🗿 
🤏
🤏🏻
🤏🏼
🤏🏽
🤏🏾
🤏🏿 
🤘
🤘🏻
🤘🏼
🤘🏽
🤘🏾
🤘🏿
🤙
🤙🏻
🤙🏼
🤙🏽
🤙🏾
🤙🏿
🤚
🤚🏻
🤚🏼
🤚🏽
🤚🏾
🤚🏿
🤛
🤛🏻
🤛🏼
🤛🏽
🤛🏾
🤛🏿
🤜
🤜🏻
🤜🏼
🤜🏽
🤜🏾
🤜🏿
🤝
🤝
🤝🏻
🤝🏼
🤝🏽
🤝🏾
🤝🏿
🤞
🤞🏻
🤞🏼
🤞🏽
🤞🏾
🤞🏿
🤟
🤟🏻
🤟🏼
🤟🏽
🤟🏾
🤟🏿
🤲
🤲🏻
🤲🏼
🤲🏽
🤲🏾
🤲🏿
🤳
🤳🏻
🤳🏼
🤳🏽
🤳🏾
🤳🏿
🤵 
🤶
🤶🏻
🤶🏼
🤶🏽
🤶🏾
🤶🏿
🤷 
🤹 
🤺
🤼 
🤿
🥀
🥁
🥂
🥃
🥄
🥅
🥇
🥈
🥉
🥊
🥋
🥌
🥍
🥎
🥏
🥐
🥑
🥒
🥓
🥔🥕🥖🥗🥘🥙🥚🥛🥜🥝🥞🥟
🥠
🥡🥢🥣🥤
🥥🥦🥧🥨🥩🥪🥫🥬🥬🥭🥮🥯
🥵🥶🥺
🥻
🥼
🥽
🥾
🥿
🦀🦀
🦁🦂🦄🦅🦃🦆🦇
🦈🦉🦊🦋🦌🦍🦎🦏🦐🦑🦒🦓🦔🦕🦖🦗🦘🦙🦚🦛🦜🦝🦞🦟
🦠
🦡🦢
🦥🦦🦧🦨🦩🦪🦮🦯
🦴
🦵
🦵🏻
🦵🏼
🦵🏽
🦵🏾
🦵🏿
🦶
🦶🏻
🦶🏼
🦶🏽
🦶🏾
🦶🏿
🦷 
🦺
🦻
🦻🏻
🦻🏼
🦻🏽
🦻🏾
🦻🏿
🦼
🦽
🦾
🦿
🧀
🧁
🧂
🧃
🧄
🧅
🧆
🧇
🧈
🧉
🧊 
🧐
🧑 
🧓
🧓🏻
🧓🏼
🧓🏽
🧓🏾
🧓🏿
🧔
🧔🏻
🧔🏼
🧔🏽 
🧟 
🧠 
🧢
🧣
🧤
🧥
🧦
🧧
🧨
🧩
🧪
🧫
🧬
🧭
🧮
🧯
🧰
🧱
🧲
🧳
🧴
🧵
🧶
🧷
🧸
🧹
🧺
🧻
🧼
🧽
🧾
🧿
🩰
🩱
🩲
🩳
🩸
🩹
🩺
🪀
🪁
🪂
🪐
🪑
🪒
🪓
🪔
🪕 
🚀
🚁
🚂
🚃
🚄
🚅
🚆
🚇
🚈
🚉
🚊
🚋
🚌
🚌
🚌
🚍
🚎
🚏
🚐
🚑
🚒
🚓
🚔
🚕
🚖
🚗
🚘
🚙
🚚
🚛
🚜
🚝
🚞
🚟
🚠
🚡
🚢
🚢
🚣
🚤
🚥
🚦
🚧
🚨
🚩
🚩
🚪
🚫
🚬
🚬
🚭
🚮
🚯
🚰
🚱
🚲
🚳
🚴 
🚴🏽 
🚷
🚸
🚹🚺🚻🚻🚼🚽🚽🚿🛀🛀🏻🛀🏼🛀🏽🛀🏾🛀🏿🛁
🛌🛌🛌🏻🛌🏼🛌🏽🛌🏾🛌🏿
🛍
🛎️
🛎
🛏
🛐
🛑🛑🛑
🛒
🛕 
🛣🛤
🛥🛩
🛫🛬
🛰
🛳
🛴🛵
🛶
🛷
🛸
🛹
🛺
🟠
🟡
🟢
🟣
🟤
🟥🟦🟧🟨🟩🟪🟫
""",
                  ]),



                  MainContentMaker(level1widget: Text('🥴🤐🤡🤢', style: textStyle5), level1text: '웃자', level2items: [
                    """
오늘도 수고했어!

언젠가 빛을 보리라.
이번에 좀 슬펐지만 다음에 더 잘하면 되지. 
""",
                    MainContentMaker(level1widget: const Text('☘', style: TextStyle(color: Colors.green)), level1text: '행운이 그대에게 가득하기를', level2items: const []),
                  ]),
                ]),
                MainContentMaker(
                    level1widget: const Icon(
                      Icons.code,
                      color: Colors.lightBlueAccent,
                    ),
                    level1text: '플러터 샘플 위젯 모음',
                    level2items: [
                      /*플러터문법스탬프*/ PlanedScheduleManagementHelper(text: "플러터문법스탬프", items: const [
                        "/*컬렉션포문법(collection for)코드샘플*/for (String element in <String>['String1','String2','String3']) Text(element),",
                        "/*컬렉션포문법(collection for)코드샘플*/for (int i=1;i<=3;i++) Text(i),",
                        '/*상위위젯테마컬러참조코드샘플*/color: Theme.of(context).cardColor,',
                        '/*빈박스코드샘플*/const SizedBox(height: 50),',
                        '/*빈박스코드샘플*/Container(),',
                        '/*빈박스코드샘플*/PloaceHolder(),',
                      ]),
                      /*토글버튼*/ ToggleMaker(),
                      /*체크박스*/ const CheckBoxMaker(),
                      /*버튼*/ FloatingActionButton(
                        mini: false,
                        backgroundColor: Colors.blue.shade900,
                        splashColor: Colors.black,
                        onPressed: () {},
                        hoverElevation: 1.5,
                        shape: const StadiumBorder(side: BorderSide(color: Colors.blue, width: 4)),
                        elevation: 1.5,
                        child: const Icon(
                          Icons.message,
                          color: Colors.red,
                        ),
                      ),
                      /*버튼*/ Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 4),
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 56,
                          icon: const Icon(Icons.message),
                          onPressed: () {},
                        ),
                      ),
                      /*버튼*/ Material(
                        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigoAccent, width: 4.0),
                            color: Colors.indigo[900],
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            //This keeps the splash effect within the circle
                            borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.message,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                MainContentMaker(level1widget: Text('📂', style: textStyle5), level1text: '아이콘텍스트 모음', level2items: const [
                  """
💻💼🖱🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤🕥🕦🕧
🔅🔆
🔈🔉🔊 
📁📂
📃📄📅📆📇📈📉📊📋
📎📏📐
📑
📒📒📓
📔📕📖📗📘📙
📚📛📜📝📵
😀😁😂😂😂😃😄😄😅😆😇😈😉😊😋😌😍😍😎😎😏
😐😑😒😓😔😕😖😗😘😙😚😛😛😜😝😞😞😟😠😠😡
😢😣😤😥😦😧😨😩😪😫
😬
😭😮😮‍💨😯😰😱😲😳😴😴😵😵‍💫
😶🙁🙂🙃
🙈🙈🙉🙊
🙋🙋
🙌🏻🙌🏼🙌🏽🙌🏾🙌🏿
🙏🏻🙏🏼🙏🏽🙏🏾🙏🏿
🥴🤐🤡🤢🤣🤤🤪🤫🤬🤮
🛠
⌚⌚⌚⌚⏱⏲☑⏰
♥
⌛⏳
⌨
☀☁☂️☂☃☔⛄⛅⛈
☄
☎
☑️

☕☕
☠
☢
☣
☦
☪️
☪
☮
☯
☸

✔
✝
✡
✨
✳
✴
❄
❇ 
❓❔❕❗  
🐀🐀🐁🐂🐃🐄🐅🐆🐇🐈🐉🐊🐋🐌🐍🐍🐎🐏🐐🐑🐒🐓🐓🐔🐕🐕‍
🦺
🐖🐗🐘
🐚
🐛🐛🐜🐝🐞
🐟🐟🐠🐡🐢🐙
🐣
🐤🐥🐦🐧
🐨🐩🐪🐫🐬🐭🐮🐯🐰🐱🐲🐳🐴🐵🐵🐵🐶🐷🐸🐸🐹🐺🐻🐼🐽🐾
👙 
👞👟👠👡👢
👣👣
👤👥
👄👅
👫👫🏻👫🏼👫🏽👫🏾👫🏿👬👬🏻👬🏼👬🏽👬🏾👬🏿👭👭🏻👭🏼👭🏽👭🏾
👭🏿 💋💋‍💋‍💋‍‍💋‍💋‍🧑🏻‍‍🧑🏾🔥🔒🔓📍
💌💍💎💏💏🏻💏🏼💏🏽💏🏾💏🏿💐💑💑🏻💑🏼💑🏽💑🏾💑🏿
❤️‍❤️‍❤️💓💔💕💖💗💘💙💚💛💜💝🤍🖤
💞
💣💩💩💪💪🏻💪🏼💪🏽💪🏾💪🏿📌📞🔇🔏🔏🔐🔑🔕🔞️
👍
♈♈♉♊♋♌♍♎♏♐♑♒♓
♟
♠♣♥♦
♨
♻
♾
♿
⚒
⚓
⚔
⚕
⚖
⚗
⚙
⚛
⚜
⚠️♀♂♀️
⚪️
⚪
⚫
⚽⚽⚽
⚾
⛎
⛏️⛏
⛑
⛓
⛔
⛩
⛪
⛪
⛰
⛱
⛲
⛲
⛳
⛴
⛵
⛷
⛸
⛹
⛽
✂️
✈️
✉️
✋✋🏻✋🏼✋🏽✋🏾✋🏿
✍️✏️
✏
✒
⬛
⬜
⭐
⭕
🀄
🃏
🌀
🌁
🌂
🌃
🌄
🌅
🌆
🌇
🌈
🌉
🌊
🌋
🌋
🌌
🌍🌍🌎🌏
🌐
🌑🌒🌓🌔🌕🌖🌗🌘🌙🌚
🌛🌜
🌝🌞
🌟
🌠
🌭
🌮
🌯
🌰
🌱
🌲
🌳
🌴
🌴
🌵
🌶
🌷
🌸
🌹
🌹
🌺
🌻
🌼
🌽
🌾
🌿
🍀
🍁
🍂
🍃
🍄
🍅🍅🍆🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🍓🍓🍔🍕🍕
🍖🍗
🍘🍙
🍚🍚
🍛🍜🍝
🍞
🍟
🍠
🍡
🍢
🍣🍤🍥🍦🍦🍧🍨🍩
🍪
🍫
🍬
🍭
🍮
🍯
🍰
🍱
🍲
🍳
🍴
🍴
🍵🍶🍷🍸🍹🍺🍻
🍼🍽🍾🍿🎀🎁🎂
🎃🎄🎅🎅🎅🏻🎅🏼🎅🏽🎅🏾🎅🏿
🎆🎇
🎈🎈
🎉🎊
🎋
🎌
🎍
🎎
🎏
🎐
🎑
🎒
🎓 
🎠
🎡
🎢
🎣
🎤
🎥
🎦
🎧
🎨
🎨
🎩
🎪
🎫
🎬
🎭
🎮
🎯
🎯
🎰
🎱
🎲
🎳
🎴
🎵
🎵
🎶
🎷
🎸
🎹
🎹
🎺
🎻
🎼
🎽
🎾
🎿
🏀 
🏂🏿
🏃 
🏄🏽 
🏍
🏎
🏏
🏐
🏑
🏒
🏓 
🏗️ 
🏭
🏮
🏯
🏰
🏳️🏳️ 
🏴🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿  
👳🏽 
👳🏾 
👳🏿 
👹 
👻 
👽
👾
👿
💀 
💃
💃🏻
💃🏼
💃🏽
💃🏾
💃🏿
💄
💅
💅🏻
💅🏼
💅🏽
💅🏾
💅🏿 
💈
💉
💊
💊
💒
💠
💡
💡
💢
💤
💥
💦
💧
💨
💫
💬
💭
💮
💯
💰
💱
💲
💲
💲
💳
💴
💵
💶
💷
💸
💹
💺 
📟
📠
📡
📢
📢
📣
📤
📥
📦
📧
📨
📩
📪
📫
📬
📭
📮
📯
📰
📱
📲
📳
📴
📶
📷📸
📹
📺
📻
📼
📽
📿 

🔋
🔌
🔍
🔎
🔔
🔖
🔗
🔘 
🔦
🔧
🔨
🔩
🔪
🔫
🔬
🔭
🔭
🔮
🔯
🔰
🔱 
🕋
🕌
🕍
🕎
🕺
🕺🏻
🕺🏼
🕺🏽
🕺🏾
🕺🏿 
🖕
🖕🏻
🖕🏼
🖕🏽
🖕🏾
🖕🏿
🖖
🖖🏻
🖖🏼
🖖🏽
🖖🏾
🖖🏿 
🗻
🗼
🗽
🗾
🗿 
🤏
🤏🏻
🤏🏼
🤏🏽
🤏🏾
🤏🏿 
🤘
🤘🏻
🤘🏼
🤘🏽
🤘🏾
🤘🏿
🤙
🤙🏻
🤙🏼
🤙🏽
🤙🏾
🤙🏿
🤚
🤚🏻
🤚🏼
🤚🏽
🤚🏾
🤚🏿
🤛
🤛🏻
🤛🏼
🤛🏽
🤛🏾
🤛🏿
🤜
🤜🏻
🤜🏼
🤜🏽
🤜🏾
🤜🏿
🤝
🤝
🤝🏻
🤝🏼
🤝🏽
🤝🏾
🤝🏿
🤞
🤞🏻
🤞🏼
🤞🏽
🤞🏾
🤞🏿
🤟
🤟🏻
🤟🏼
🤟🏽
🤟🏾
🤟🏿
🤰
🤰🏻
🤰🏼
🤰🏽
🤰🏾
🤰🏿
🤱
🤱🏻
🤱🏼
🤱🏽
🤱🏾
🤱🏿
🤲
🤲🏻
🤲🏼
🤲🏽
🤲🏾
🤲🏿
🤳
🤳🏻
🤳🏼
🤳🏽
🤳🏾
🤳🏿
🤴
🤴🏻
🤴🏼
🤴🏽
🤴🏾
🤴🏿
🤵 
🤶
🤶🏻
🤶🏼
🤶🏽
🤶🏾
🤶🏿
🤷 
🤹 
🤺
🤼 
🤿
🥀
🥁
🥂
🥃
🥄
🥅
🥇
🥈
🥉
🥊
🥋
🥌
🥍
🥎
🥏
🥐
🥑
🥒
🥓
🥔🥕🥖🥗🥘🥙🥚🥛🥜🥝🥞🥟
🥠
🥡🥢🥣🥤
🥥🥦🥧🥨🥩🥪🥫🥬🥬🥭🥮🥯
🥵🥶🥺
🥻
🥼
🥽
🥾
🥿
🦀🦀
🦁🦂🦄🦅🦃🦆🦇
🦈🦉🦊🦋🦌🦍🦎🦏🦐🦑🦒🦓🦔🦕🦖🦗🦘🦙🦚🦛🦜🦝🦞🦟
🦠
🦡🦢
🦥🦦🦧🦨🦩🦪🦮🦯
🦴
🦵
🦵🏻
🦵🏼
🦵🏽
🦵🏾
🦵🏿
🦶
🦶🏻
🦶🏼
🦶🏽
🦶🏾
🦶🏿
🦷 
🦺
🦻
🦻🏻
🦻🏼
🦻🏽
🦻🏾
🦻🏿
🦼
🦽
🦾
🦿
🧀
🧁
🧂
🧃
🧄
🧅
🧆
🧇
🧈
🧉
🧊 
🧐
🧑 
🧓
🧓🏻
🧓🏼
🧓🏽
🧓🏾
🧓🏿
🧔
🧔🏻
🧔🏼
🧔🏽 
🧟 
🧠 
🧢
🧣
🧤
🧥
🧦
🧧
🧨
🧩
🧪
🧫
🧬
🧭
🧮
🧯
🧰
🧱
🧲
🧳
🧴
🧵
🧶
🧷
🧸
🧹
🧺
🧻
🧼
🧽
🧾
🧿
🩰
🩱
🩲
🩳
🩸
🩹
🩺
🪀
🪁
🪂
🪐
🪑
🪒
🪓
🪔
🪕 

🚀
🚁
🚂
🚃
🚄
🚅
🚆
🚇
🚈
🚉
🚊
🚋
🚌
🚌
🚌
🚍
🚎
🚏
🚐
🚑
🚒
🚓
🚔
🚕
🚖
🚗
🚘
🚙
🚚
🚛
🚜
🚝
🚞
🚟
🚠
🚡
🚢
🚢
🚣
🚤
🚥
🚦
🚧
🚨
🚩
🚩
🚪
🚫
🚬
🚬
🚭
🚮
🚯
🚰
🚱
🚲
🚳
🚴 
🚴🏽 
🚷
🚸
🚹🚺🚻🚻🚼🚽🚽🚿🛀🛀🏻🛀🏼🛀🏽🛀🏾🛀🏿🛁
🛌🛌🛌🏻🛌🏼🛌🏽🛌🏾🛌🏿
🛍
🛎️
🛎
🛏
🛐
🛑🛑🛑
🛒
🛕 
🛣🛤
🛥🛩
🛫🛬
🛰
🛳
🛴🛵
🛶
🛷
🛸
🛹
🛺
🟠
🟡
🟢
🟣
🟤
🟥🟦🟧🟨🟩🟪🟫
""",
                ]),
                for (int i = 1; i < 2; i++) const SizedBox(height: 3),
              ],
            ),
            /*움직이는 벌레 버튼*/ Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: SizedBox(
                    height: 30,
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: const Offset(300, -55 + 50 - 50 - 50),
                            child: IconButton(
                              onPressed: () {},
                              icon: Stack(
                                children: [
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Transform.translate(
                                      offset: const Offset(6, 6),
                                      child: RainbowIconMaker(iconData: Icons.bug_report),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.bug_report,
                                      // color: Colors.yellowAccent,
                                      color: Colors.blueAccent,
                                      shadows: [],
                                      semanticLabel: "이건 뭐다냐",
                                    ),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ScreenIndexColorful(isDarkMode: isDarkMode),
                                        ),
                                      );
                                    },
                                    tooltip: "디버깅용 벌레입니다~",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toogleMainTextContentState() {
    setState(() {
      if (isMainTextContentBoxClicked == true) {
        isMainTextContentBoxClicked = false;
      } else {
        isMainTextContentBoxClicked = true;
      }
    });
  }

  void toogleMainContentState() {
    setState(() {
      if (isMainContentClicked == true) {
        isMainContentClicked = false;
      } else {
        isMainContentClicked = true;
      }
    });
  }
}
