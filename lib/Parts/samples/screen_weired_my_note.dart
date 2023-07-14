import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_icon.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_text.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_button_general.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_check_box_local_storage.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_pop_up_alert.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_pop_up_form.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/sample_toggle.dart';

import '../../main.dart';
import '../in_operating/my_superworkers.dart';
import '../in_operating/screen_index_colorful.dart';
import 'sample_main_content.dart';

class ScreenWeiredMyNote extends StatefulWidget {
  const ScreenWeiredMyNote({super.key});

  @override
  _ScreenWeiredMyNoteState createState() => _ScreenWeiredMyNoteState();
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
  TextStyle textStyle4 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100, fontFamily: 'NanumSquareRegular');
  TextStyle textStyle5 = const TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w100);

  late var isDarkMode;

  bool isMainTextContentBoxClicked = false;

  bool isMainContentClicked = false;

  // List<dynamic> SampleWeiredItems = [];
  // List<Widget> SampleWeiredWiget  = [];

  @override
  void initState() {
    // TODO: implement initState
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
                /*닫기 버튼*/ Container(
                  height: 60,
                  // width:  60,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
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
                                      tooltip: "GO TO HOME",
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
                    onTap: (){print("참 펜시한 메모장:");},
                    child: Container(
                      child: Column(
                        children: [
                          /*메인타이틀*/ Transform.translate(
                              offset: const Offset(80 - 50, 0 + 20),
                              child: Row(
                                children: [
                                  Text('참 ', style: textStyle2),
                                  Text('이상한 ', style: textStyle2CanceledLine),
                                  Rainbow_text(text: '펜시', color: Colors.white, font_size: 27, font_weight: FontWeight.w900),
                                  Text('한 ', style: textStyle2),
                                  Container(color: Colors.yellowAccent, child: Text('메모장', style: textStyle2underLine)),
                                ],
                              )),
                          /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(80 + 20 + 10 + 10 + 10 + 6, -60 + 10 + 10 + 10 + 10), child: Transform.rotate(angle: -0.11, child: TextButton(onPressed: () {}, child: Text('📋', style: textStyle1)))),
                        ],
                      ),
                    ),
                  ),
                ),
                for (int i = 1; i < 2; i++) const SizedBox(height: 3),
                SampleMainContent(level1widget: Text('📋', style: textStyle5), level1text: '오늘의 스케쥴', level2items: const [
                  """
DONE
""",
                  """
ING
""",
                  """
TO DO

움직이는 벌레 만들기
	현재 디바이스의 좌표를 가져온다.
	좌측 상단 0,0 을 기준으로 얼마나 움직여도 되는지 허용범위를 알아낸 다음
	offset 을 사용하면 될것 같다.
	기어가는 방향에 따라서 회전을 하도록 한다.
""",
                ]),
                SampleMainContent(level1widget: const Icon(Icons.phone_android, color: Colors.grey), level1text: 'App 요약정리', level2items: [
                  /*Flutter 핵심 요약:타이틀*/ InkWell(
                    onTap: (){print("/*Flutter 핵심 요약:타이틀*/");},
                    child: Column(
                      children: [
                        /*메인타이틀*/ Container(child: Transform.translate(offset: const Offset(10, 0 + 20), child: Text('Flutter 핵심 요약', style: textStyle2))),
                        /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(-80 - 5, -40 - 5), child: Transform.rotate(angle: 0.22, child: Text('위젯 ?', style: textStyle1))),
                        /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(100 + 4, -60 - 8), child: Transform.rotate(angle: -0.11, child: Text('상태관리 ?', style: textStyle1))),
                      ],
                    ),
                  ),
                  """
React Native?

호호 이것은 native 가 아니었다. native app 을 추구하는 것 뿐
JavaScript 기반 mobile framework 
""",
                  """
플러터?

dart 기반 mobile framework.

why 👍 
  
why bad
  성능이 native app 에 비해 떨어진다...
""",
                  """
플러터 위젯?
""",
                  """
플러터 위젯의 상태관리?

상태관리 기법
  GetX
  bloc  
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

웹앱 으로는 구현이 불가능하거나 어려운 기능.

높은 사양이 요구되는 작업 불능
스마트폰 내부의 파일들을 다루는 기능
각종 하드웨어 장치를 다루는 기능
""",
                  """
하이브리드 앱?
대다수 콘텐츠를 웹 사이트로 제공하면서 추가로 네이티브 앱에서 사용 가능한 기능까지 제공하는 앱

하이브리드 앱의 원리는 간단합니다. 
네이티브 또는 크로스 플랫폼 방식으로 앱을 만들되 화면 안에 요소를 직접 만들지 않고, 
브라우저 역할을 하는 웹 뷰라는 요소를 만들어 대신 웹 화면을 띄웁니다. 
그러면 웹 뷰는 지정된 주소로 접속해서 웹 앱 형태로 만들어진 웹사이트를 화면에 보여줍니다. 
사용자는 이 웹 뷰를 통해 웹사이트로 만들어진 기능을 앱 기능처럼 사용합니다.
그리고 웹사이트에서 제공할 수 없는 하드웨어 기능인 카메라나 푸시 알림 같은 기능은 네이티브 단에서 자체적으로 수행하도록 하는 것입니다.

앱을 하이브리드 형태로 만들면 네이티브 앱과 웹 앱의 장단점을 활용해서 제품을 유연하게 운영할 수 있습니다.
웹사이트로 구현이 불가능한 필수 기능들만 네이티브 앱으로 개발하고, 나머지 기능은 모두 웹 뷰 안에 들어갈 웹사이트로 만들면 되기 때문에 비교적 개발 부담이 적습니다.
앱 기능을 업데이트할 때를 제외하고 앱 마켓의 심사 없이 언제든지 앱의 내용을 수정할 수 있다는 장점도 있죠.
또한 앱의 특성에 따라 네이티브로 제작할 부분과 웹 뷰로 제공할 부분을 다양하게 구성할 수 있습니다.

 
?
""",
                  """
?

혼자
공부하는
얄팍한
코딩 지식
""",
                  """
프로그레시브 웹 앱(PWA)?
쇼핑몰 같이 사용자의 방문이 많을 수 있고 웹과 모바일 둘 다 되는 앱을 구상 중인 경우: 

앱의 성능이나 실행될 장치의 하드웨어 방면 기능이 매우 필요한 경우: 네이티브 앱(Native App) 선택
쇼핑몰 같이 사용자의 방문이 많을 수 있고 웹과 모바일 둘 다 되는 앱을 구상 중인 경우: 프로그레시브 웹 앱(PWA)을 선택
웹 개발에 익숙하고 빠른 기간 내에 앱을 구축하고 싶은 경우: 하이브리드 앱(Hybrid App) 선택

?
""",
                  """
?

?
""",
                  """
?

?
""",
                  """
?

?
""",
                  """
?

?
""",
                ]),
                SampleMainContent(level1widget: Text('📑', style: textStyle5), level1text: '잡동사니 메모장', level2items: const [
                  """
BaaS 연동?  

JSON Serialization?

Serverless ?
서버리스는 실제로 서버가 없는 게 아니라.
일반적인 개발자 단에서 DB를 실제 구축할 장소, 
장치와 같은 하드웨어에 대한 리소스적인 부분을 서버를 호스팅 해주는 서비스를 받아 시스템을 구축하는 컨셉을 일컫는 것으로 생각이된다.
DB 는 업체에 맡기고 DB 설정만 개발자가 프로젝트 소스 상에서 하면 되는 것으로 보인다.

고객 데이터 소실에 대한 책임은 누가?
고객 데이터 소실에 대한 책임에 대한 문제는 있어보인다.
""",
                ]),
                SampleMainContent(level1widget: Text('🥴🤐🤡🤢', style: textStyle5), level1text: '웃자', level2items: const [
                  """
오늘도 수고했어!

언젠가 빛을 보리라.
이번에 좀 슬펐지만 다음에 더 잘하면 되지. 
""",
                ]),
                SampleMainContent(level1widget: const Text('☘', style: TextStyle(color: Colors.green)), level1text: '행운이 그대에게 가득하기를', level2items: const []),
                SampleMainContent(level1widget: const Icon(Icons.code,color: Colors.lightBlueAccent,
                ), level1text: '플러터 샘플 모음', level2items: [
                  SampleToggle(),
                  SampleCheckBox(),
                  SamplePopUpAlert(text: 'SamplePopUpAlert', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
                  SamplePopUpForm(text: 'SamplePopUpForm', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
                  SampleButtonGeneral(text: "SampleButtonGeneral", color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, background_color: MyColors.black_background, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
                ]),
                SampleMainContent(level1widget: Text('📂', style: textStyle5), level1text: '아이콘텍스트 모음', level2items: const [
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
🥔
🥕
🥖
🥗
🥘
🥙
🥚
🥛
🥜
🥝
🥞
🥟
🥠
🥡
🥢
🥣
🥤
🥥
🥦
🥧
🥨
🥩
🥪
🥫
🥬
🥬
🥭
🥮
🥯
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
                SampleMainContent(level1widget: Text('?', style: textStyle5), level1text: '?', level2items: const [
                  """
?
""",
                ]),
                for (int i = 1; i < 2; i++) const SizedBox(height: 3),
                // SampleAccodionMenu(),
                // SampleButtonSamples(),
              ],
            ),
            /*움직이는 벌레 버튼*/ Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: Container(
                    height: 30,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: const Offset(300, -55+50-50-50),
                            child: IconButton(
                              onPressed: () {},
                              icon: Stack(
                                children: [
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Transform.translate(
                                      offset: const Offset(6, 6),
                                      child: Rainbow_icon(iconData: Icons.bug_report),
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
                                          builder: (context) => Screen_index_colorful(isDarkMode: isDarkMode),
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
