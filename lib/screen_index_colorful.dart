import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/helpers/super_helper.dart';
import 'components/in_developing/ScreenImageNetworkTest.dart';
import 'components/in_developing/screen___________.dart';
import 'components/in_developing/screen_calculator_biological_age.dart';
import 'components/in_developing/screen_diff_months.dart';
import 'components/in_developing/screen_practice_api_connection2.dart';
import 'components/in_developing/screen_video_player.dart';
import 'components/screens/ScreenWebView.dart';
import 'components/screens/screen_animated_align.dart';
import 'components/screens/screen_animated_position.dart';
import 'components/screens/screen_area_calculator.dart';
import 'components/screens/screen_by_arbor_day.dart';
import 'components/screens/screen_by_drontal_supply_date.dart';
import 'components/screens/screen_by_next_parasiticide_supply_date.dart';
import 'components/screens/screen_by_now_from_day_that_we_meet.dart';
import 'components/screens/screen_carrot_market.dart';
import 'components/screens/screen_developer_helper.dart';
import 'components/screens/screen_digital_clock.dart';
import 'components/screens/screen_digital_photo_frame.dart';
import 'components/screens/screen_germany.dart';
import 'components/screens/screen_hello_world.dart';
import 'components/screens/screen_jung_hoon_park_profile.dart';
import 'components/screens/screen_lateral_bars.dart';
import 'components/screens/screen_left_days_by_2024.dart';
import 'components/screens/screen_national_flag.dart';
import 'components/screens/screen_netflix.dart';
import 'components/screens/screen_page_view.dart';
import 'components/screens/screen_particular_matter.dart';
import 'components/screens/screen_pomodoro.dart';
import 'components/screens/screen_practice_api_connection.dart';
import 'components/screens/screen_practice_flutter_life_cycle.dart';
import 'components/screens/screen_practice_row_and_column.dart';
import 'components/screens/screen_practice_webview.dart';
import 'components/screens/screen_random_number.dart';
import 'components/screens/screen_splash.dart';
import 'components/screens/screen_vertical_bars.dart';
import 'components/screens/screen_webtoon.dart';
import 'components/screens/screen_weired_my_note.dart';
import 'components/screens/screen_zebra_stripe.dart';
import 'components/tests/test_communication_between_wigets/via_navigator_push_feat_set/screen_comunicator1.dart';

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
      /*\nHello World*/ _RefactoringModule202307152216(txt: '\nHello World \ntest', destination: const ScreenPracticeHelloWorld()),
      /*\nVertical Bars*/ _RefactoringModule202307152216(txt: '\nVertical Bars \ntest', destination: const ScreenPracticeVerticalBar()),
      /*\nLateral Bars*/ _RefactoringModule202307152216(txt: '\nLateral Bars \ntest', destination: const ScreenPracticeLateralBars()),
      /*\nRow and Column*/ _RefactoringModule202307152216(txt: '\nRow and Column \ntest', destination: const ScreenPracticeRowAndColumn()),
      /*\nSplash*/ _RefactoringModule202307152216(txt: '\nSplash \ntest', destination: const ScreenPracticeSplash()),
      /*\nZebra Stripe*/ _RefactoringModule202307152216(txt: '\nZebra Stripe \ntest', destination: const ScreenPracticeZebraStripe()),
      /*\nNational Flags*/ _RefactoringModule202307152216(txt: '\nNational Flags \ntest', destination: const ScreenPracticeNationalFlag()),
      /*\nGermany screen*/ _RefactoringModule202307152216(txt: '\nGermany screen \ntest', destination: const ScreenPracticeGermany()),
      /*\nAlign animation*/ _RefactoringModule202307152216(txt: '\nAlign animation \ntest', destination: const ScreenPracticeAnimatedAlign()),
      /*\nPosition & Scale*/ _RefactoringModule202307152216(txt: '\nPosition & Scale \ntest', destination: const ScreenAnimatedPositionAndScale()),
      /*\nUI Starter*/ _RefactoringModule202307152216(txt: '\nUI components \ntest', destination: const Screen___________()),
      /*\nstful wiget\nlife cycle*/ _RefactoringModule202307152216(txt: '\nstful wiget\nlife cycle test', destination: ScreenPracticeFlutterStfulWigetLifeCycle()),
      /*\nweb view*/ _RefactoringModule202307152216(txt: '\nweb view \ntest', destination: const ScreenPracticeWebview()),
      /*\npage view*/ _RefactoringModule202307152216(txt: '\npage view \ntest', destination: const ScreenPracticePageView()),
      /*\n webtoon API*/ _RefactoringModule202307152216(txt: '\nwebtoon API \ntest', destination: const ScreenWebtoonAPI()),
      /*\nwebtoon API2*/ _RefactoringModule202307152216(txt: '\nwebtoon API \ntest2', destination: const ScreenWebtoonAPI2()),
      /*\ncommunication*/ _RefactoringModule202307152216(txt: 'communication \ntest', destination: const ScreenComunicator1()),
      /*\nImage network \ntest*/ _RefactoringModule202307152216(txt: '\nImage network \ntest', destination: const ScreenImageNetworkTest()),

      /*\n개발자도우미, 계획집행기*/ _RefactoringModule202307152216(txt: '\n개발자도우미\n', destination: const ScreenDeveloperHelper()),
      /*\n시계*/ _RefactoringModule202307152216(txt: '\n시계\n', destination: const ScreenClock()),
      /*\n계산기(평당)*/ _RefactoringModule202307152216(txt: '\n계산기\n(평당)', destination: const ScreenAreaCalculator()),
      /*\n계산기\n(생물학적나이)*/ _RefactoringModule202307152216(txt: '\n계산기\n(생물학적나이)', destination: const ScreenCalculatorBiologicalAge()),
      /*\n난수생성기*/ _RefactoringModule202307152216(txt: '\n난수생성기\n', destination: const ScreenRandomNumber()),
      /*\n2024년디데이*/ _RefactoringModule202307152216(txt: '\n2024년디데이\n', destination: const ScreenLeftDaysBy2024()),
      /*\n식목일*/ _RefactoringModule202307152216(txt: '\n식목일\n', destination: const ScreenArborDay()),
      /*\n넥스가드급여일*/ _RefactoringModule202307152216(txt: '\n넥스가드급여일\n', destination: const ScreenByNextNexguardSupplyDate()),
      /*\n드론탈급여일*/ _RefactoringModule202307152216(txt: '\n드론탈급여일\n', destination: const ScreenByNextDrontalSupplyDate()),
      /*\n개발자년차*/ _RefactoringModule202307152216(txt: '\n개발자년차\n', destination: ScreenDiffMonths(startingDateTime: DateTime(2022, 10, 26), endingDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))),

      /*\n포모도로*/ _RefactoringModule202307152216(txt: '\n포모도로\n', destination: const ScreenPomodoro()),

      /*\n참 펜시한 메모장*/ _RefactoringModule202307152216(txt: '\n참 펜시한 메모장\n', destination: const ScreenWeiredMyNote()),
      /*\n오늘도 웹툰*/ _RefactoringModule202307152216(txt: '\n오늘도 웹툰\n', destination: const ScreenWebtoon()),
      /*\n당근마껫*/ _RefactoringModule202307152216(txt: '\n당근마껫\n', destination: const ScreenCarrotMarket()),
      /*\n넷플릿쓰*/ _RefactoringModule202307152216(txt: '\n넷플릿쓰\n', destination: const ScreenNetFlix()),
      /*\n구글*/ _RefactoringModule202307152216(txt: '\n구글\n', destination: ScreenWebView(startingUrl: MyUrls.google)),
      /*\n네이버*/ _RefactoringModule202307152216(txt: '\n네이버\n', destination: ScreenWebView(startingUrl: MyUrls.naver)),
      /*\n네이버날씨*/ _RefactoringModule202307152216(txt: '\n네이버날씨\n', destination: ScreenWebView(startingUrl: MyUrls.naverWeather)),
      /*\n유튜브*/ _RefactoringModule202307152216(txt: '\n유튜브\n', destination: ScreenWebView(startingUrl: MyUrls.youtube)),
      /*\n내프로필*/ _RefactoringModule202307152216(txt: '\n내프로필\n', destination: const ScreenJungHoonParkProfile()),
      /*\n하늘이디지털액자*/ _RefactoringModule202307152216(txt: '\n하늘이디지털액자\n', destination: const ScreenDigitalPhotoFrame()),

      /*\n우리처음만난날*/ _RefactoringModule202307152216(txt: '\n우리처음만난날\n', destination: const ScreenByNowFromDayThatWeMeet()),


      /*\n다크플레이어*/ _RefactoringModule202307152216(txt: '\n비디오플레이어\n', destination: const ScreenVideoPlayer()),
      /*\n미세먼지 연동 API 연습*/ _RefactoringModule202307152216(txt: '\n미세먼지 오픈 API\n', destination: const ScreenParticularMatter()),

      // /*\n아이보호 시스템*/ _RefactoringModule202307152216(txt: '\n우리아이 횡단보도 지킴이\n', destination: const Placeholder()),
      //   1. splash 화면
      //   2. 회원가입
      //   3. 로그인
      //   4. 위치 기반 서비스
      //   4.1. 현재좌표를 얻기,
      //   4.1. 신호등위치를 얻기,
      //   4.1. 횡단보도좌표 얻기,
      //   자녀보호시스템
      //   5. flutter 로 어플 출시

      // /*우리강아지 보호 시스템*/ /*우리산책빌런*/ _RefactoringModule202307152216(txt: '\n우리산책빌런\n', destination: const Placeholder()),
      // /*상대방은 알수가 없다.*/
      // /*응가봉투 위치서비스*/
      // 우리 아이가 싫어하는 강아지들을 등록, 가까이 오면 알람.
      // 우리는 우리아이를 지키기 위해서, 서로의 위치를 공유합니다.


      // /*\n실시간 채팅형 서비스*/ _RefactoringModule202307152216(txt: '\n실시간 채팅 서비스\n', destination: const Placeholder()),
      //   1. splash 화면
      //   2. 회원가입
      //   3. 로그인
      //   4. 실시간 질의응답 서비스를 만들어 보자
      //   5. flutter 로 어플 출시

      // /*참 펜시한 메모장*/ _RefactoringModule202307152217(
      //   txt: '참 펜시한 메모장',
      //   item: Row(
      //     children: [
      //       Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.grey.shade200], ratioX: 0.01, ratioY: 0.01)))),
      //       Transform.translate(offset: const Offset(6.5, 0), child: Transform.scale(scale: 2, child: const Text("📋", style: TextStyle(fontSize: 16)))),
      //       Transform.translate(offset: const Offset(-5, 2), child: Transform.rotate(angle: 0.1, child: Transform.scale(scale: 3, child: RainbowTextMaker(text: "FANCY", fontSize: 2)))),
      //     ],
      //   ),
      //   destination: const ScreenWeiredMyNote(),
      // ),

      // /*우리 처음 만난날*/ _RefactoringModule202307152217(
      //   txt: '우리 처음 만난날',
      //   item: Row(
      //     children: [
      //       Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.pinkAccent.shade100], ratioX: 0.01, ratioY: 0.01)))),
      //       Transform.translate(offset: const Offset(17 + 10, -5), child: Transform.scale(scale: 30, child: RainbowTextMaker(text: '❤️‍', color: Colors.pink.shade50, fontSize: 1, isRainbowMode: false))),
      //     ],
      //   ),
      //   destination: const ScreenDayThatWeMeet(),
      // ),


      // /*다크플레이어*/ _RefactoringModule202307152217(
      //   txt: '비디오플레이어',
      //   item: Row(
      //     children: [
      //       Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 5000, child: CircleBoxHelper(item: StripedBoxHelper(colors: [Colors.blue.shade900], ratioX: 0.01, ratioY: 0.01)))),
      //       /*리니어그라데이션 컨테이너*/ Transform.translate(
      //         offset: const Offset(15, 0),
      //         child: Transform.scale(
      //           scale: 1800,
      //           child: Container(
      //             height: 0.01,
      //             width: 0.01,
      //             decoration: const BoxDecoration(
      //               gradient: LinearGradient(
      //                 colors: [Colors.red, Colors.orange, Colors.yellow],
      //                 begin: Alignment.centerLeft,
      //                 end: Alignment.centerRight,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Transform.translate(offset: const Offset(-3, 20), child: Transform.scale(scale: 4000, child: const Icon(Icons.play_circle, color: Colors.white, size: 0.01)))
      //     ],
      //   ),
      //   destination: const ScreenVideoPlayer(),
      // ),

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
        Text(
          widget.txt,
          style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 9, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
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
