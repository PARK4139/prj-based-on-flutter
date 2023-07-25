import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Parts/helpers/circle_box_maker.dart';
import 'Parts/helpers/rainbow_text_maker.dart';
import 'Parts/helpers/striped_box_maker.dart';
import 'Parts/helpers/super_helper.dart';
import 'Parts/in_developing/screen_video_player.dart';
import 'Parts/in_developing/screen___________.dart';
import 'Parts/in_developing/screen_diff_months.dart';
import 'Parts/in_developing/screen_practice_api_connection2.dart';
import 'Parts/screens/screen_random_number.dart';
import 'Parts/screens/screen_animated_align.dart';
import 'Parts/screens/screen_animated_position.dart';
import 'Parts/screens/screen_arbor_day.dart';
import 'Parts/screens/screen_area_calculator.dart';
import 'Parts/screens/screen_carrot_market.dart';
import 'Parts/screens/screen_day_that_we_meet.dart';
import 'Parts/screens/screen_developer_helper.dart';
import 'Parts/screens/screen_digital_clock.dart';
import 'Parts/screens/screen_digital_photo_frame.dart';
import 'Parts/screens/screen_drontal_supply_date.dart';
import 'Parts/screens/screen_germany.dart';
import 'Parts/screens/screen_google.dart';
import 'Parts/screens/screen_hello_world.dart';
import 'Parts/screens/screen_jung_hoon_park_profile.dart';
import 'Parts/screens/screen_lateral_bars.dart';
import 'Parts/screens/screen_left_days_by_2024.dart';
import 'Parts/screens/screen_national_flag.dart';
import 'Parts/screens/screen_netflix.dart';
import 'Parts/screens/screen_next_parasiticide_supply_date.dart';
import 'Parts/screens/screen_page_view.dart';
import 'Parts/screens/screen_pomodoro.dart';
import 'Parts/screens/screen_practice_api_connection.dart';
import 'Parts/screens/screen_practice_flutter_life_cycle.dart';
import 'Parts/screens/screen_practice_row_and_column.dart';
import 'Parts/screens/screen_practice_webview.dart';
import 'Parts/screens/screen_splash.dart';
import 'Parts/screens/screen_vertical_bars.dart';
import 'Parts/screens/screen_webtoon_v2.dart';
import 'Parts/screens/screen_weired_my_note.dart';
import 'Parts/screens/screen_zebra_stripe.dart';
import 'Parts/tests/test_communication_via_navigator_feat_map/screen_practice_routing_sender.dart';

class ScreenIndexColorful extends StatefulWidget {
  bool isDarkMode;

  ScreenIndexColorful({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<ScreenIndexColorful> createState() => _ScreenIndexColorfulState();
}

class _ScreenIndexColorfulState extends State<ScreenIndexColorful> {
  late List<Widget> itemsAsIconOnly;

  @override
  void initState() {
    super.initState();
    initItems();
  }

  @override
  Widget build(BuildContext context) {
    final Object? myWigetTreeSetting;
    if (ModalRoute.of(context)?.settings.arguments == null) {
      //null safty 가 적용된 dart 코드는 null 인 경우 반드시 신경써서 null이 아닌 특정값으로 초기화 처리가 필요하다.
      debugSomething(ModalRoute.of(context)?.settings.arguments);
    } else {
      myWigetTreeSetting = ModalRoute.of(context)!.settings.arguments;
      debugSomething(myWigetTreeSetting);
    }

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
      /*\nHello World*/ _RefactoringModule202307152216(txt: '\nHello World', destination: const ScreenPracticeHelloWorld()),
      //__________________________________________________________________________________________________________________________ show items s
      /*\nVertical Bars*/ _RefactoringModule202307152216(txt: '\nVertical Bars', destination: const ScreenPracticeVerticalBar()),
      //__________________________________________________________________________________________________________________________ show items e
      /*\nLateral Bars*/ _RefactoringModule202307152216(txt: '\nLateral Bars', destination: const ScreenPracticeLateralBars()),
      /*\nRow and Column*/ _RefactoringModule202307152216(txt: '\nRow and Column', destination: const ScreenPracticeRowAndColumn()),
      /*\nsplash*/ _RefactoringModule202307152216(txt: '\nsplash', destination: const ScreenPracticeSplash()),
      /*\nZebra Stripe*/ _RefactoringModule202307152216(txt: '\nZebra Stripe', destination: const ScreenPracticeZebraStripe()),
      /*\nNational Flags*/ _RefactoringModule202307152216(txt: '\nNational Flags', destination: const ScreenPracticeNationalFlag()),
      /*\nGermany screen*/ _RefactoringModule202307152216(txt: '\nGermany screen', destination: const ScreenPracticeGermany()),
      /*\nAlign animation*/ _RefactoringModule202307152216(txt: '\nAlign animation', destination: const ScreenPracticeAnimatedAlign()),
      /*\nPosition & Scale*/ _RefactoringModule202307152216(txt: '\nPosition & Scale', destination: const ScreenAnimatedPositionAndScale()),
      /*\nUI Starter*/ _RefactoringModule202307152216(txt: '\nUI Starter', destination: const Screen___________()),
      /*\nstful wiget\nlife cycle*/ _RefactoringModule202307152216(txt: '\nstful wiget\nlife cycle', destination: ScreenPracticeFlutterStfulWigetLifeCycle()),
      /*\nweb view*/ _RefactoringModule202307152216(txt: '\nweb view', destination: const ScreenPracticeWebview()),
      /*\npage view*/ _RefactoringModule202307152216(txt: '\npage view', destination: const ScreenPracticePageView()),
      /*\nAPI connection*/ _RefactoringModule202307152216(txt: '\nAPI connection', destination: const ScreenPracticeApiConnection()),
      /*\nAPI connection2*/ _RefactoringModule202307152216(txt: '\nAPI connection2', destination: const ScreenPracticeApiConnection2()),
      /*\nNavigation communication*/ _RefactoringModule202307152216(txt: '\nNavigation communication', destination: const ScreenPracticeRoutingSender()),
      /*계획집행기*/ /*개발자도우미*/ _RefactoringModule202307152217(
        txt: '개발자도우미',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.bug_report_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenDeveloperHelper(),
      ),
      _RefactoringModule202307152217(
        txt: '계획집행기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.rule_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenDeveloperHelper(),
      ),
      /*시계*/ _RefactoringModule202307152217(
        txt: '시계',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.watch_later_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenDigitalClock(),
      ),
      /*평당 계산기*/ _RefactoringModule202307152217(
        txt: '평당 계산기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.calculate_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenAreaCalculator(),
      ),
      /*포모도로*/ _RefactoringModule202307152217(
        txt: '포모도로',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(5, 0), child: const Icon(Icons.timer_outlined, color: Colors.blueAccent)),
          ],
        ),
        destination: const ScreenPomodoro(),
      ),
      /*참 펜시한 메모장*/ _RefactoringModule202307152217(
        txt: '참 펜시한 메모장',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(6.5, 0), child: Transform.scale(scale: 2, child: const Text("📋", style: TextStyle(fontSize: 16)))),
            Transform.translate(offset: const Offset(-5, 2), child: Transform.rotate(angle: 0.1, child: Transform.scale(scale: 3, child: RainbowTextMaker(text: "FANCY", fontSize: 2)))),
          ],
        ),
        destination: const ScreenWeiredMyNote(),
      ),
      /*오늘도 웹툰*/ _RefactoringModule202307152217(
        txt: '오늘도 웹툰',
        item: Row(children: [
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.green], ratioX: 0.01, ratioY: 0.01)))),
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 9, child: RainbowTextMaker(text: '오늘도 웹툰', color: Colors.white, fontSize: 1, fontFamily: 'sunFlower', isRainbowMode: false))),
        ]),
        destination: const ScreenWebtoon(),
      ),
      /*당근마껫*/ _RefactoringModule202307152217(
        txt: '당근마껫',
        item: Row(children: [
          Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
          Transform.translate(offset: const Offset(10, 0), child: Transform.scale(scale: 2, child: const Text('🥕', style: TextStyle(fontSize: 16)))),
        ]),
        destination: const ScreenCarrotMarket(),
      ),
      /*넷플릿쓰*/ _RefactoringModule202307152217(
        txt: '넷플릿쓰',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: SizedBox(height: 0.1, width: 0.1, child: Transform.scale(scale: 500, child: Image.asset('asset/images/app_netflix_logo.png')))),
          ],
        ),
        destination: const ScreenNetFlix(),
      ),
      /*구굴*/ _RefactoringModule202307152217(
        txt: '구굴',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 9, child: RainbowTextMaker(text: 'Googoole', fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: ScreenGoogoole(startingUrl: MyUrls.google2),
      ),
      /*내 프로필*/ _RefactoringModule202307152217(
        txt: '내 프로필',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17 + 10, -5), child: Transform.scale(scale: 30, child: RainbowTextMaker(text: '😀‍', color: Colors.pink.shade50, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenJungHoonParkProfile(),
      ),
      /*하늘이디지털액자*/ _RefactoringModule202307152217(
        txt: '하늘이디지털액자',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: SizedBox(height: 0.1, width: 0.1, child: Image.asset('asset/images/my_lovely_dog_sky.jpg')))),
            // Transform.translate(offset: const Offset(17 + 10, -5), child: Transform.scale(scale: 30, child: RainbowTextMaker(text: '🐶‍', color: Colors.pink.shade50, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenDigitalPhotoFrame(),
      ),
      /*우리 처음 만난날*/ _RefactoringModule202307152217(
        txt: '우리 처음 만난날',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.pinkAccent.shade100], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17 + 10, -5), child: Transform.scale(scale: 30, child: RainbowTextMaker(text: '❤️‍', color: Colors.pink.shade50, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenDayThatWeMeet(),
      ),

      /*2024년 디데이*/ _RefactoringModule202307152217(
        txt: '2024년 디데이',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.pinkAccent.shade100], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17 + 2, -4), child: Transform.scale(scale: 10, child: RainbowTextMaker(text: 'New Year\n2024🌈', color: Colors.white, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenLeftDaysBy2024(),
      ),

      /*식목일*/ _RefactoringModule202307152217(
        txt: '식목일',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.green.shade200], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(13 + 13 - 2, -4), child: Transform.scale(scale: 20, child: RainbowTextMaker(text: '🌲', color: Colors.white, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenArborDay(),
      ),

      /*넥스가드급여일*/ _RefactoringModule202307152217(
        txt: '넥스가드급여일',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.brown.shade50], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(25, -6), child: Transform.scale(scale: 25, child: RainbowTextMaker(text: '📆', color: Colors.white, fontSize: 1, isRainbowMode: false))),
            Transform.translate(offset: const Offset(27 - 6 - 3, 16), child: Transform.scale(scale: 7, child: RainbowTextMaker(text: '넥스가드💊', color: Colors.grey.shade600, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenNextNexguardSupplyDate(),
      ),

      /*드론탈급여일*/ _RefactoringModule202307152217(
        txt: '드론탈급여일',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.brown.shade50], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(25, -5), child: Transform.scale(scale: 25, child: RainbowTextMaker(text: '📆', color: Colors.white, fontSize: 1, isRainbowMode: false))),
            Transform.translate(offset: const Offset(27 - 8, 16), child: Transform.scale(scale: 7, child: RainbowTextMaker(text: '드론탈💊', color: Colors.grey.shade600, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenDrontalSupplyDate(),
      ),

      /*개발자년차*/ _RefactoringModule202307152217(
        txt: '개발자년차', //추후 근무년수 하나더 만들고   개월수는 1년 미만의 어떤기간을 표현할때로 변경.삭제는 말기
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.brown.shade50], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(25, -5), child: Transform.scale(scale: 25, child: RainbowTextMaker(text: '📆', color: Colors.white, fontSize: 1, isRainbowMode: false))),
            Transform.translate(offset: const Offset(27 - 8 - 5, 16), child: Transform.scale(scale: 7, child: RainbowTextMaker(text: '개발자된지', color: Colors.grey.shade600, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: ScreenDiffMonths(startingDateTime: DateTime(2022, 10, 26), endingDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)),
      ),

      /*난수생성기*/ _RefactoringModule202307152217(
        txt: '난수생성기',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: const [Colors.black], ratioX: 0.01, ratioY: 0.01)))),
            Transform.translate(offset: const Offset(17+9, -5), child: Transform.scale(scale: 25, child: RainbowTextMaker(text: '❔', color: Colors.white, fontSize: 1, isRainbowMode: false))),
            Transform.translate(offset: const Offset(17-2, 16), child: Transform.scale(scale: 7, child: RainbowTextMaker(text: '정수', color: Colors.grey.shade500, fontSize: 1, isRainbowMode: false))),
          ],
        ),
        destination: const ScreenRandomNumber(),
      ),

      /*다크플레이어*/ _RefactoringModule202307152217(
        txt: '비디오플레이어',
        item: Row(
          children: [
            Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.blue.shade900], ratioX: 0.01, ratioY: 0.01)))),
            /*리니어그라데이션 컨테이너*/ Transform.translate(
              offset: const Offset(15, 0),
              child: Transform.scale(
                scale: 1800,
                child: Container(
                  height: 0.01,
                  width: 0.01,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange, Colors.yellow ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(offset: const Offset(-3, 20), child: Transform.scale(scale: 4000, child: const Icon(Icons.play_circle, color: Colors.white, size: 0.01)))
          ],
        ),
        destination: const ScreenVideoPlayer(),
      ),

      // 🦴  🎀🎁🎂🎉🎊🐶📅📆
      // /*하늘이관리*/ _RefactoringModule202307152217(
      //   txt: '하늘이관리',
      //   item: Row(
      //     children: [
      //       Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxMaker(item: StripedBoxMaker(colors: [Colors.pinkAccent.shade100], ratioX: 0.01, ratioY: 0.01)))),
      //       Transform.translate(offset: const Offset(17 + 10-8, -4), child: Transform.scale(scale: 10, child: RainbowTextMaker(text: 'New Year\n2024🌈', color: Colors.white, fontSize: 1, isRainbowMode: false))),
      //     ],
      //   ),
      //   destination: const ScreenNextParasiticideSupplyDate(),
      // ),
      //
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
          child: SizedBox(
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

  late Widget item;

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
