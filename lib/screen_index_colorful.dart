import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Parts/helpers/circle_box_maker.dart';
import 'Parts/helpers/rainbow_text_maker.dart';
import 'Parts/helpers/striped_box_maker.dart';

import 'Parts/in_developing/ScreenPracticeApiConnection2.dart';
import 'Parts/screens/screen_digital_photo_frame.dart';
import 'Parts/screens/screen_practice_row_and_column.dart';
import 'Parts/screens/screen_practice_webview.dart';
import 'Parts/screens/screen_practice_flutter_life_cycle.dart';
import 'Parts/screens/screen_ui_component_samples.dart';
import 'Parts/screens/screen_animated_align.dart';
import 'Parts/screens/screen_animated_position.dart';
import 'Parts/screens/screen_area_calculator.dart';
import 'Parts/screens/screen_carrot_market.dart';
import 'Parts/screens/screen_developer_helper.dart';
import 'Parts/screens/screen_digital_clock.dart';
import 'Parts/screens/screen_germany.dart';
import 'Parts/screens/screen_google.dart';
import 'Parts/screens/screen_hello_world.dart';
import 'Parts/screens/screen_jung_hoon_park_profile.dart';
import 'Parts/screens/screen_lateral_bars.dart';
import 'Parts/screens/screen_national_flag.dart';
import 'Parts/screens/screen_netflix.dart';
import 'Parts/screens/screen_page_view.dart';
import 'Parts/screens/screen_pomodoro.dart';
import 'Parts/screens/screen_splash.dart';
import 'Parts/screens/screen_vertical_bars.dart';
import 'Parts/screens/ScreenPracticeApiConnection.dart';
import 'Parts/screens/screen_webtoon_v2.dart';
import 'Parts/screens/screen_weired_my_note.dart';
import 'Parts/screens/screen_zebra_stripe.dart';

class ScreenIndexColorful extends StatefulWidget {
  bool isDarkMode;

  ScreenIndexColorful({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<ScreenIndexColorful> createState() => _ScreenIndexColorfulState();
}

class _ScreenIndexColorfulState extends State<ScreenIndexColorful> {
  late List<Widget> itemsAsIconOnly;

  String nameCutter(String indexName) {
    String result = '';
    if (indexName.length >= 10) {
      result = "${indexName.substring(0, 9)}...";
    } else {
      result = indexName;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    initItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black87 : Colors.white,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
        children: <Widget>[
          for (var item in itemsAsIconOnly) item,
        ],
      ),
    );
  }

  void initItems() {
    itemsAsIconOnly = [
      /*\nHello World*/ _RefactoringModule202307152216(txt: '\nHello World', destination: const ScreenHelloWorld()),
      /*\nsplash*/ _RefactoringModule202307152216(txt: '\nsplash', destination: ScreenSplash()),
      /*\nVertical Bars*/ _RefactoringModule202307152216(txt: '\nVertical Bars', destination: const ScreenVerticalBarSniffets()),
      /*\nLateral Bars*/ _RefactoringModule202307152216(txt: '\nLateral Bars', destination: const ScreenLateralBars()),
      /*\nRow and Column*/ _RefactoringModule202307152216(txt: '\nRow and Column', destination: const ScreenPracticeRowAndColumn()),
      /*\nZebra Stripe*/ _RefactoringModule202307152216(txt: '\nZebra Stripe', destination: const ScreenZebraStripe()),
      /*\nNational Flags*/ _RefactoringModule202307152216(txt: '\nNational Flags', destination: const ScreenNationalFlag()),
      /*\nGermany screen*/ _RefactoringModule202307152216(txt: '\nGermany screen', destination: const ScreenGermany()),
      /*\nAlign animation*/ _RefactoringModule202307152216(txt: '\nAlign animation', destination: ScreenAnimatedAlign()),
      /*\nPosition & Scale*/ _RefactoringModule202307152216(txt: '\nPosition & Scale', destination: const ScreenAnimatedPositionAndScale()),
      /*\nUI samples*/ _RefactoringModule202307152216(txt: '\nUI samples', destination: const ScreenUiComponentSamples()),
      /*\nstful wiget\nlife cycle*/ _RefactoringModule202307152216(txt: '\nstful wiget\nlife cycle', destination: ScreenPracticeFlutterStfulWigetLifeCycle()),
      /*\nweb view*/ _RefactoringModule202307152216(txt: '\nweb view', destination: const ScreenPracticeWebview()),
      /*\npage view*/ _RefactoringModule202307152216(txt: '\npage view', destination: const screen_page_view()),
      /*\nAPI connection*/ _RefactoringModule202307152216(txt: '\nAPI connection', destination: const ScreenPracticeApiConnection()),
      /*\nAPI connection2*/ _RefactoringModule202307152216(txt: '\nAPI connection2', destination: ScreenPracticeApiConnection2()),

      /*계획집행기*/ /*개발자도우미*/ _RefactoringModule202307152217(
        txt: '개발자도우미',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.bug_report_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenDeveloperHelper(),
      ),

      _RefactoringModule202307152217(
        txt: '계획집행기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.rule_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenDeveloperHelper(),
      ),

      /*시계*/ _RefactoringModule202307152217(
        txt: '시계',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.watch_later_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const Screen_digital_clock(),
      ),

      /*평당 계산기*/ _RefactoringModule202307152217(
        txt: '평당 계산기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.calculate_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const Screen_area_calculator(),
      ),

      /*포모도로*/ _RefactoringModule202307152217(
        txt: '포모도로',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.timer_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenPomodoro(),
      ),
      /*참 펜시한 메모장*/ _RefactoringModule202307152217(
        txt: '참 펜시한 메모장',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(6.5, 0), child: Transform.scale(scale: 2, child: const Text("📋", style: TextStyle(fontSize: 16)))),
            Transform.translate(offset: const Offset(-5, 2), child: Transform.rotate(angle: 0.1, child: Transform.scale(scale: 3, child: RainbowTextMaker(text: "FANCY", font_size: 2)))),
          ],
        ),
        destination: const ScreenWeiredMyNote(),
      ),





      /*오늘도 웹툰_v2*/ _RefactoringModule202307152217(
        txt: '오늘도 웹툰_v2',
        item: Row(children: [
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: Image.asset('assets/app_webtoon_logo.jpg', height: 0.1))),
        ]),
        destination: Screen_webtoon_v2(),
      ),

      /*당근마껫*/ _RefactoringModule202307152217(
        txt: '당근마껫',
        item: Row(children: [
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
          Transform.translate(offset: const Offset(10, 0), child: Transform.scale(scale: 2, child: const Text('🥕', style: TextStyle(fontSize: 16)))),
        ]),
        destination: ScreenCarrotMarket(),
      ),
      /*넷플릿쓰*/ _RefactoringModule202307152217(
        txt: '넷플릿쓰',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 500, child: Image.asset('assets/app_netflix_logo.png', width: 0.1))),
          ],
        ),
        destination: ScreenNetFlix(),
      ),
      /*구굴*/ _RefactoringModule202307152217(
        txt: '구굴',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 9, child: RainbowTextMaker(text: 'Googoole', font_size: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenGoogoole(),
      ),
      /*내 프로필*/ _RefactoringModule202307152217(
        txt: '내 프로필',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: Image.asset('assets/my_lovely_dog_sky.jpg', height: 0.1))),
          ],
        ),
        destination: const ScreenJungHoonParkProfile(),
      ),

      /*디지털포토프레임*/ _RefactoringModule202307152217(
        txt: '디지털포토프레임',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: Image.asset('assets/my_lovely_dog_sky.jpg', height: 0.1))),
          ],
        ),
        destination: const ScreenDigitalPhotoFrame(),
      ),
    ];
  }
}

class _RefactoringModule202307152216 extends StatefulWidget {
  late String txt;

  late Widget destination;

  _RefactoringModule202307152216({required this.txt, required this.destination});

  @override
  State<_RefactoringModule202307152216> createState() => _RefactoringModule202307152216State();
}

class _RefactoringModule202307152216State extends State<_RefactoringModule202307152216> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => widget.destination));
          },
          child: Container(
            height: 50 - 17,
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 0 + 5),
                  // child: const FlutterLogo(size: 30),
                  child: const FlutterLogo(size: 30),
                ),
              ],
            ),
          ),
        ),
        Text(widget.txt, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _RefactoringModule202307152217 extends StatefulWidget {
  late String txt;

  late Widget destination;

  var item;

  _RefactoringModule202307152217({required this.txt, required this.destination, required this.item});

  @override
  State<_RefactoringModule202307152217> createState() => _RefactoringModule202307152217State();
}

class _RefactoringModule202307152217State extends State<_RefactoringModule202307152217> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => widget.destination));
            },
            child: SizedBox(
              height: 50 - 17,
              child: widget.item,
            ),
          ),
          tooltip: '',
          splashColor: Colors.white,
          // hoverColor: Colors.red,
          focusColor: Colors.orange,
          color: Colors.blueAccent,
          disabledColor: Colors.purpleAccent,
        ),
        Text(widget.txt, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
