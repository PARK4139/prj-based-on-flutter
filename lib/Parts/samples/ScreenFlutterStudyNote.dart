import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_icon.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_text.dart';

import '../../main.dart';
import '../in_operating/screen_index_colorful.dart';
import 'SampleMainContent.dart';

class ScreenFlutterStudyNote extends StatefulWidget {
  const ScreenFlutterStudyNote({super.key});

  @override
  _ScreenFlutterStudyNoteState createState() => _ScreenFlutterStudyNoteState();
}

class _ScreenFlutterStudyNoteState extends State<ScreenFlutterStudyNote> {

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
                for (int i = 1; i < 7; i++) const SizedBox(height: 3),
                /*타이틀*/ Column(
                  children: [
                    /*메인타이틀*/ Transform.translate(
                        offset: const Offset(80-50, 0 + 20),
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text('참 ', style: textStyle2),
                                Text('이상', style: textStyle2CanceledLine),
                                Text('한', style: textStyle2),
                                Transform.scale(
                                  scale: 0.9,
                                  child: Transform.rotate(
                                    angle: 0.15,
                                      child: Text('팬', style: textStyle2CanceledLine)),
                                ),
                                Rainbow_text(text: '펜시', color: Colors.white, font_size: 27, font_weight: FontWeight.w900),
                                Text('한 ', style: textStyle2),
                                Container(
                                    color: Colors.yellowAccent,
                                    child: Text('메모장', style: textStyle2underLine)),
                              ],
                            ))),
                    /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(80+20+10 , -60+10+10+10), child: Transform.rotate(angle: -0.11, child: TextButton(onPressed: () {}, child: Text('📋', style: textStyle1)))),
                  ],
                ),

                /*타이틀*/ Column(
                  children: [
                    /*메인타이틀*/ Transform.translate(offset: const Offset(10, 0 + 20), child: TextButton(onPressed: () {}, child: Text('Flutter 핵심 요약', style: textStyle2))),
                    /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(-80 - 5, -40 - 5), child: Transform.rotate(angle: 0.22, child: TextButton(onPressed: () {}, child: Text('위젯 ?', style: textStyle1)))),
                    /*메인타이틀꾸미기*/ Transform.translate(offset: const Offset(100 + 4, -60 - 8), child: Transform.rotate(angle: -0.11, child: TextButton(onPressed: () {}, child: Text('상태관리 ?', style: textStyle1)))),
                  ],
                ),
                for (int i = 1; i < 2; i++) const SizedBox(height: 3),
                SampleMainContent(level1widget: Text('📋', style: textStyle5), level1text: '오늘의 스케쥴', level2texts: const [
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
                SampleMainContent(level1widget: Text('🥴🤐🤡🤢', style: textStyle5), level1text: '웃자', level2texts: const [
                  """
오늘도 수고했어!

언젠가 빛을 보리라.
이번에 좀 슬펐지만 다음에 더 잘하면 되지. 
""",
                ]),
                SampleMainContent(level1widget:  const Text('☘', style: TextStyle(color: Colors.green)), level1text: '행운이 그대에게 가득하기를', level2texts: const []),
                SampleMainContent(
                    level1widget: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    level1text: 'App 요약정리',
                    level2texts: const [
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
                    ]),

                SampleMainContent(level1widget: Text('📑', style: textStyle5), level1text: '메모장', level2texts: const [
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
                SampleMainContent(level1widget: Text('📂', style: textStyle5), level1text: '아이콘텍스트 모음', level2texts: const [
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
🍵
🍶
🍷
🍸
🍹
🍺
🍻
🍼
🍽
🍾
🍿
🎀
🎁
🎂
🎃🎄🎅🎅🎅🏻🎅🏼🎅🏽🎅🏾🎅🏿
🎆
🎇
🎈
🎈
🎉
🎊
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
                SampleMainContent(level1widget: Text('?', style: textStyle5), level1text: '?', level2texts: const [
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(333, -55),
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
