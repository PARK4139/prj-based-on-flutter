import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/circle_box_maker.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/practice_screen2.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_text.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_area_calculator.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_carrot_market.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_digital_clock.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_pomodo.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_super_stamp.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/screen_webtoon_v2.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/screen_animated_position.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/screen_lateral_bars.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/screen_national_flag.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/screen_vertical_bars.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/samples/screen_zebra_stripe.dart';

import 'Parts/in_operating/ScreenJungHoonParkProfile.dart';
import 'Parts/in_operating/practice_screen1.dart';
import 'Parts/in_operating/screen_google.dart';
import 'Parts/in_operating/screen_hello_world.dart';
import 'Parts/in_operating/screen_netflix.dart';
import 'Parts/in_operating/screen_splash.dart';
import 'Parts/in_operating/striped_box_maker.dart';
import 'Parts/samples/screen_animated_align.dart';
import 'Parts/samples/screen_germany.dart';
import 'Parts/samples/screen_snack_bar.dart';
import 'Parts/samples/screen_weired_my_note.dart';

class Screen_index_colorful extends StatefulWidget {
  bool isDarkMode;

  Screen_index_colorful({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<Screen_index_colorful> createState() => _Screen_index_colorfulState();
}

class _Screen_index_colorfulState extends State<Screen_index_colorful> {
  late List<Widget> items_as_icon_only;


  String indexNameCutter(String indexName) {
    String result = '';
    if (indexName.length >= 10) {
      result = indexName.substring(0, 9) + "...";
    } else {
      result = indexName;
    }
    return result;
    // return indexName;
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
          for (var item in items_as_icon_only) item,
        ],
      ),
    );
  }

  void initItems() {
    items_as_icon_only = [
      /*helloWorld*/ _RefactoringModule202307152216(txt: 'helloWorld', destination: ScreenHelloWorld()),
      /*splash*/ _RefactoringModule202307152216(txt: 'splash', destination: ScreenSplash()),
      /*ZebraStripe*/ _RefactoringModule202307152216(txt: 'ZebraStripe', destination: ScreenZebraStripe()),
      /*NationalFlags*/ _RefactoringModule202307152216(txt: 'NationalFlags', destination: ScreenNationalFlag()),
      /*Germany*/ _RefactoringModule202307152216(txt: 'Germany', destination: ScreenGermany()),
      /*AnimatedAlign*/ _RefactoringModule202307152216(txt: 'AnimatedAlign', destination: ScreenAnimatedAlign()),
      /*PositionAndScale*/ _RefactoringModule202307152216(txt: 'PositionAndScale', destination: ScreenAnimatedPositionAndScale()),
      /*VerticalBars*/ _RefactoringModule202307152216(txt: 'VerticalBars', destination: ScreenVerticalBarSniffets()),
      /*LateralBars*/ _RefactoringModule202307152216(txt: 'LateralBars', destination: ScreenLateralBars()),
      /*SnackBar*/ _RefactoringModule202307152216(txt: 'SnackBar', destination: ScreenSnackBar()),
      /*practice1*/ _RefactoringModule202307152216(txt: 'practice1', destination: PracticeScreen1()),
      /*practice2*/ _RefactoringModule202307152216(txt: 'practice2', destination: PracticeScreen2()),

      /*계획집행기*/ /*개발자도우미*/ _RefactoringModule202307152217(
        txt: '개발자도우미',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.bug_report_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: ScreenDeveloperHelper(),
      ),

      _RefactoringModule202307152217(
        txt: '계획집행기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.rule_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: ScreenDeveloperHelper(),
      ),

      /*시계*/ _RefactoringModule202307152217(
        txt: '시계',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.watch_later_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: Screen_digital_clock(),
      ),

      /*평당 계산기*/ _RefactoringModule202307152217(
        txt: '평당 계산기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.calculate_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: Screen_area_calculator(),
      ),

      /*pomodoro*/ _RefactoringModule202307152217(
        txt: 'pomodoro',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.timer_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: Screen_pomodo(),
      ),

      /*참 펜시한 메모장*/ _RefactoringModule202307152217(
        txt: '참 펜시한 메모장',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(6.5, 0), child: Transform.scale(scale: 2,child: const Text("📋", style: TextStyle(fontSize: 16)))),
            Transform.translate(offset: const Offset(-5, 2), child: Transform.rotate(angle: 0.1, child: Transform.scale(scale: 3,child: Rainbow_text(text: "FANCY", font_size: 2)))),
          ],
        ),
        destination: ScreenWeiredMyNote(),
      ),

      // const SizedBox(height: 30, width: 30),
      /*오늘도 웹툰*/ _RefactoringModule202307152217(
        txt: '오늘도 웹툰',
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
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 9, child: Rainbow_text(text: 'Googoole', font_size: 1, isRainbowMode: false))),
          ],
        ),
        destination: ScreenGoogle(),
      ),
      /*내 프로필*/ _RefactoringModule202307152217(
        txt: '내 프로필',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
          ],
        ),
        destination: ScreenJungHoonParkProfile(),
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
            child: Container(
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
