import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_bloc_with_qubit/ScreenBlocWithQubitTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_getx/ScreenGetxTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_navigator_push_feat_map/screen_comunicator1.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

import '../../tmp/ScreenTableTest.dart';
import '../../tmp/tmp.dart';
import 'ScreenEarthMap.dart';
import 'ScreenTodayCommutationNew.dart';
import 'screen___________.dart';
import 'screen_american_stock.dart';
import 'screen_animated_align.dart';
import 'screen_animated_position.dart';
import 'screen_area_calculator.dart';
import 'screen_by_arbor_day.dart';
import 'screen_by_drontal_supply_date.dart';
import 'screen_by_next_parasiticide_supply_date.dart';
import 'screen_by_now_from_day_that_we_meet.dart';
import 'screen_calculator_biological_age.dart';
import 'screen_carrot_market.dart';
import 'screen_checklist.dart';
import 'screen_developer_helper.dart';
import 'screen_diff_months.dart';
import 'screen_digital_clock.dart';
import 'screen_digital_photo_frame.dart';
import 'screen_future_builder.dart';
import 'screen_hello_world.dart';
import 'screen_image_network_test.dart';
import 'screen_jung_hoon_park_profile.dart';
import 'screen_left_days_by_2024.dart';
import 'screen_netflix.dart';
import 'screen_page_view.dart';
import 'screen_particular_matter.dart';
import 'screen_pomodoro.dart';
import 'screen_practice_api_connection.dart';
import 'screen_practice_flutter_life_cycle.dart';
import 'screen_practice_webview.dart';
import 'screen_random_number.dart';
import 'screen_splash123.dart';
import 'screen_stream_builder.dart';
import 'screen_video_player.dart';
import 'screen_web_view.dart';
import 'screen_webtoon.dart';
import 'screen_weired_my_note.dart';

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
      _RefactoringModule202307152216(txt: '\nUI \ntest', destination: const Screen___________()),
      _RefactoringModule202307152216(txt: '\nHello World \ntest', destination: const ScreenPracticeHelloWorld()),
      _RefactoringModule202307152216(txt: '\nSplash \ntest', destination: const ScreenSplash123()),

      _RefactoringModule202307152216(txt: '\nAlign animation \ntest', destination: const ScreenPracticeAnimatedAlign()),
      _RefactoringModule202307152216(txt: '\nPosition & Scale \ntest', destination: const ScreenAnimatedPositionAndScale()),
      _RefactoringModule202307152216(txt: '\nstful wiget\nlife cycle test', destination: ScreenPracticeFlutterStfulWigetLifeCycle()),
      _RefactoringModule202307152216(txt: '\nweb view \ntest', destination: const ScreenPracticeWebview()),
      _RefactoringModule202307152216(txt: '\npage view \ntest', destination: const ScreenPracticePageView()),
      _RefactoringModule202307152216(txt: '\nwebtoon API \ntest', destination: const ScreenWebtoonAPI()),
      _RefactoringModule202307152216(txt: 'communication \ntest', destination: const ScreenComunicator1()),
      _RefactoringModule202307152216(txt: '\nImage network \ntest', destination: const ScreenImageNetworkTest()),
      _RefactoringModule202307152216(txt: '\nFuture Builder test', destination: const ScreenFutureBuilder()),
      _RefactoringModule202307152216(txt: '\nStream Builder test', destination: const ScreenStreamBuilder()),
      _RefactoringModule202307152216(txt: '\nGetX \ntest', destination: const ScreenGetxTest()),
      _RefactoringModule202307152216(txt: '\nBloC/cubit \ntest', destination: ScreenBlocWithQubitTest()),
      _RefactoringModule202307152216(txt: '\n개발자도우미\n', destination: const ScreenDeveloperHelper()),
      _RefactoringModule202307152216(txt: '\n계획실행도우미', destination: const ScreenPlanExcuter()),
      // _RefactoringModule202307152216(txt: '\ntable \ntest', destination: const ScreenTableTest()),

      _RefactoringModule202307152216(txt: '\n시계\n', destination: const ScreenClock()),
      _RefactoringModule202307152216(txt: '\n계산기\n(평당)', destination: const ScreenAreaCalculator()),
      _RefactoringModule202307152216(txt: '\n계산기\n(생물학적나이)', destination: const ScreenCalculatorBiologicalAge()),
      _RefactoringModule202307152216(txt: '\n난수생성기\n', destination: const ScreenRandomNumber()),
      _RefactoringModule202307152216(txt: '\n2024년디데이\n', destination: const ScreenLeftDaysBy2024()),
      _RefactoringModule202307152216(txt: '\n식목일\n', destination: const ScreenArborDay()),
      _RefactoringModule202307152216(txt: '\n넥스가드급여일\n', destination: const ScreenByNextNexguardSupplyDate()),
      _RefactoringModule202307152216(txt: '\n드론탈급여일\n', destination: const ScreenByNextDrontalSupplyDate()),
      _RefactoringModule202307152216(txt: '\n개발자년차\n', destination: ScreenDiffMonths(startingDateTime: DateTime(2022, 10, 26), endingDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))),

      _RefactoringModule202307152216(txt: '\n포모도로\n', destination: const ScreenPomodoro()),

      _RefactoringModule202307152216(txt: '\n참 펜시한 메모장\n', destination: const ScreenWeiredMyNote()),
      _RefactoringModule202307152216(txt: '\n당근마껫\n', destination: const ScreenCarrotMarket()),
      _RefactoringModule202307152216(txt: '\n넷플릿쓰\n', destination: const ScreenNetFlix()),
      _RefactoringModule202307152216(txt: '\n구글\n', destination: ScreenWebView(startingUrl: MyUrls.google)),
      _RefactoringModule202307152216(txt: '\n네이버\n', destination: ScreenWebView(startingUrl: MyUrls.naver)),
      _RefactoringModule202307152216(txt: '\n네이버날씨\n', destination: ScreenWebView(startingUrl: MyUrls.naverWeather)),
      _RefactoringModule202307152216(txt: '\n유튜브\n', destination: ScreenWebView(startingUrl: MyUrls.youtube)),
      _RefactoringModule202307152216(txt: '\n내프로필\n', destination: const ScreenJungHoonParkProfile()),
      _RefactoringModule202307152216(txt: '\n하늘이디지털액자\n', destination: const ScreenDigitalPhotoFrame()),
      _RefactoringModule202307152216(txt: '\n우리처음만난날\n', destination: const ScreenByNowFromDayThatWeMeet()),
      _RefactoringModule202307152216(txt: '\n비디오플레이어\n', destination: const ScreenVideoPlayer()),
      _RefactoringModule202307152216(txt: '\n웹툰\n', destination: const ScreenWebtoon()),
      _RefactoringModule202307152216(txt: '\n세계지도\n', destination: const ScreenEarthMap()),
      _RefactoringModule202307152216(txt: '\n근태관리\n', destination: const ScreenCommutationManagement()),
      _RefactoringModule202307152216(txt: '\n미세먼지\n', destination: const ScreenParticularMatter()),
      _RefactoringModule202307152216(txt: '\n미국주식\n', destination: const ScreenAmericanStock()),

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

      // /*우리강아지 보호 시스템*/ /*나의산책빌런*/ _RefactoringModule202307152216(txt: '\n나의산책빌런\n', destination: const Placeholder()),
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

      // /*다크플레이어*/

      // 🎀🎁🎂🎉🎊🐶🦴📅📆
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
