import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prj_app_mvp/components/screens/screen_road_cctv.dart';
import 'package:prj_app_mvp/components/screens/screen_web_socket_client.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_bloc_with_qubit/ScreenBlocWithQubitTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_getx/ScreenGetxTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_navigator_push_feat_map/screen_comunicator1.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

import '../../main.dart';
import '../../tmp/ScreenTableTest.dart';
import '../../tmp/tmp.dart';
import 'screen_earth_map.dart';
import 'screen_commutation_management.dart';
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
  const ScreenIndexColorful({Key? key}) : super(key: key);

  @override
  State<ScreenIndexColorful> createState() => _ScreenIndexColorfulState();
}

class _ScreenIndexColorfulState extends State<ScreenIndexColorful> {
  late List<Widget> itemsAsIconOnly;

  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    initScreenSetting();
  }

  @override
  Widget build(BuildContext context) {
    final Object? myWigetTreeSetting;
    if (ModalRoute.of(context)?.settings.arguments == null) {
      //null safty 가 적용된 dart 코드는 null 인 경우 반드시 신경써서 null이 아닌 특정값으로 초기화 처리가 필요하다.
      // debugSomething(ModalRoute.of(context)?.settings.arguments,troubleShootingId: "20230811184027");
    } else {
      myWigetTreeSetting = ModalRoute.of(context)!.settings.arguments;
      debugSomething(myWigetTreeSetting, troubleShootingId: "20230811184050");
    }

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black87 : Colors.white,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 10),
        children: <Widget>[
          for (var item in itemsAsIconOnly) item,
        ],
      ),
    );
  }

  void initScreenSetting() {
    itemsAsIconOnly = [
      RefactoringModule202307152216(txt: '\n계획실행도우미\n', destination: const ScreenDeveloperHelper()),
      /*개발자도우미*/
      // _RefactoringModule202307152216(txt: '\ntable \ntest', destination: const ScreenTableTest()),
      RefactoringModule202307152216(txt: '\n포모도로\n', destination: const ScreenPomodoro()),
      RefactoringModule202307152216(txt: '\n참 펜시한 메모장\n', destination: const ScreenWeiredMyNote()),
      RefactoringModule202307152216(txt: '\n당근마껫\n', destination: const ScreenCarrotMarket()),
      RefactoringModule202307152216(txt: '\n넷플릿쓰\n', destination: const ScreenNetFlix()),
      RefactoringModule202307152216(txt: '\n구글\n', destination: ScreenWebView(startingUrl: MyUrls.google)),
      RefactoringModule202307152216(txt: '\n네이버\n', destination: ScreenWebView(startingUrl: MyUrls.naver)),
      RefactoringModule202307152216(txt: '\n네이버날씨\n', destination: ScreenWebView(startingUrl: MyUrls.naverWeather)),
      RefactoringModule202307152216(txt: '\n유튜브\n', destination: ScreenWebView(startingUrl: MyUrls.youtube)),
      RefactoringModule202307152216(txt: '\n내프로필\n', destination: const ScreenJungHoonParkProfile()),
      RefactoringModule202307152216(txt: '\n하늘이디지털액자\n', destination: const ScreenDigitalPhotoFrame()),
      RefactoringModule202307152216(txt: '\n우리처음만난날\n', destination: const ScreenByNowFromDayThatWeMeet()),
      RefactoringModule202307152216(txt: '\n비디오플레이어\n', destination: const ScreenVideoPlayer()),
      RefactoringModule202307152216(txt: '\n웹툰\n', destination: const ScreenWebtoon()),
      RefactoringModule202307152216(txt: '\n세계지도\n', destination: const ScreenEarthMap()),
      RefactoringModule202307152216(txt: '\n근태관리\n', destination: const ScreenCommutationManagement()),
      RefactoringModule202307152216(txt: '\n미세먼지\n', destination: const ScreenParticularMatter()),
      RefactoringModule202307152216(txt: '\n미국주식\n', destination: const ScreenAmericanStock()),
      RefactoringModule202307152216(txt: '\n웹소켓통신\n', destination: ScreenWebSocketClient()),
      RefactoringModule202307152216(txt: '\n도로CCTV\n', destination: const ScreenRoadCctv()),

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

    /*Bloc cubit 사용해서 상태 Read*/
    MyAppStateCubit cubit = MyAppStateCubit();
    isDarkMode = cubit.state.isDarkMode;
  }
}
