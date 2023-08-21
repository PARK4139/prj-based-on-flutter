import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prj_app_mvp/components/screens/screen_index_colorful.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_bloc_with_qubit/ScreenBlocWithQubitTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_getx/ScreenGetxTest.dart';
import 'package:prj_app_mvp/tests/test_communication_between_wigets/via_navigator_push_feat_list/screen_comunicator1.dart';
import 'package:prj_app_mvp/utils/rainbow_icon_maker.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

import 'components/screens/screen___________.dart';
import 'components/screens/screen_animated_align.dart';
import 'components/screens/screen_animated_position.dart';
import 'components/screens/screen_area_calculator.dart';
import 'components/screens/screen_by_arbor_day.dart';
import 'components/screens/screen_by_drontal_supply_date.dart';
import 'components/screens/screen_by_next_parasiticide_supply_date.dart';
import 'components/screens/screen_calculator_biological_age.dart';
import 'components/screens/screen_developer_helper.dart';
import 'components/screens/screen_diff_months.dart';
import 'components/screens/screen_digital_clock.dart';
import 'components/screens/screen_focus_node_moving.dart';
import 'components/screens/screen_future_builder.dart';
import 'components/screens/screen_hello_world.dart';
import 'components/screens/screen_image_network_test.dart';
import 'components/screens/screen_index_blue.dart';
import 'components/screens/screen_left_days_by_2024.dart';
import 'components/screens/screen_page_view.dart';
import 'components/screens/screen_practice_api_connection.dart';
import 'components/screens/screen_practice_flutter_life_cycle.dart';
import 'components/screens/screen_practice_webview.dart';
import 'components/screens/screen_random_number.dart';
import 'components/screens/screen_scroll_postion_control_test.dart';
import 'components/screens/screen_splash123.dart';
import 'components/screens/screen_stream_builder.dart';
import 'data/source/remote/carrot_markket_api_helper.dart';
import 'data/source/remote/netflixx_api_helper.dart';

//apk 빌드 시 파일명은 main.dart 여야한다?.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseApp.initializeApp();
  // final database = FirebaseDatabase.instance;
  // final ref = database.ref('users/me');
  // ref.set({
  //   'name': 'John Doe',
  //   'email': 'johndoe@example.com',
  // });
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MyAppStateCubit(), child: AppStateSub());
  }
}

class AppStateSub extends StatefulWidget {
  const AppStateSub({super.key});

  @override
  State<AppStateSub> createState() => _AppStateSubState();
}

class _AppStateSubState extends State<AppStateSub> {
  late LocalStorage localStorage;
  late bool isDarkMode;
  late bool isCoolDownMode;
  late bool isChrismasMode;
  late bool isHappyBirthDayMode;
  late bool isDevelopmentConcentrationMode;

  int selectedPageIndex = 0;

  /*네비게이션 labelBehavior 옵션*/
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  int counter = 0;
  List<int> inputs = [];

  late Widget ghostWiget;
  late MyPlatforms? platform;

  // late bool isAndroid;
  late bool? isAndroid;
  late bool isWeb;

  Color colorForScaffoldBackground = Colors.white;

  late List<dynamic> experimentsDrawerItems;
  late List<dynamic> toDoDrawerItems;

  late bool isShowToDoDrawer;

  @override
  void initState() {
    super.initState();
    printWithoutWarning('__________________________________________________________________________________________________________________________ s');
    initHostPlatformInfo();
    initAppModes();
    //   printWithoutError('__________________________________________________________________________________________________________________________ auth check s');
    //   if (isAndroid == true) {
    //     checkPermissionForAndroid();
    //   }
    //   printWithoutError('__________________________________________________________________________________________________________________________ auth check e');
    experimentsDrawerItems = [
      RefactoringModule202307152216(txt: '\nUI \ntest', destination: const Screen___________()),
      RefactoringModule202307152216(txt: '\nstful wiget\nlife cycle test', destination: ScreenPracticeFlutterStfulWigetLifeCycle()),
      RefactoringModule202307152216(txt: '\nweb view \ntest', destination: const ScreenPracticeWebview()),
      RefactoringModule202307152216(txt: '\npage view \ntest', destination: const ScreenPracticePageView()),
      RefactoringModule202307152216(txt: '\nwebtoon API \ntest', destination: const ScreenWebtoonAPI()),
      RefactoringModule202307152216(txt: '\ncommunication \ntest', destination: const ScreenComunicator1()),
      RefactoringModule202307152216(txt: '\nImage network \ntest', destination: const ScreenImageNetworkTest()),
      RefactoringModule202307152216(txt: '\nFuture Builder \ntest', destination: const ScreenFutureBuilder()),
      RefactoringModule202307152216(txt: '\nStream Builder \ntest', destination: const ScreenStreamBuilder()),
      RefactoringModule202307152216(txt: '\nGetX \ntest', destination: const ScreenGetxTest()),
      RefactoringModule202307152216(txt: '\nBloC/cubit \ntest', destination: ScreenBlocWithQubitTest()),
      RefactoringModule202307152216(txt: '${MyMents.helloWorld} \ntest\n', destination: const ScreenPracticeHelloWorld()),
      RefactoringModule202307152216(txt: '\nSplash \ntest\n', destination: const ScreenSplash123()),
      RefactoringModule202307152216(txt: '\nAlign \n animation \ntest', destination: const ScreenPracticeAnimatedAlign()),
      RefactoringModule202307152216(txt: '\nPosition\n & Scale \ntest', destination: const ScreenAnimatedPositionAndScale()),
      RefactoringModule202307152216(txt: '\nscroll position \ntest', destination:   ScreenScrollPositionControl()),
      RefactoringModule202307152216(txt: '\nfocus node \ntest', destination:   const ScreenFocusNodeMovingTest()),
    ];
    toDoDrawerItems = [
      RefactoringModule202307152216(txt: '\n시계\n', destination: const ScreenClock()),
      RefactoringModule202307152216(txt: '\n계산기\n(평당)', destination: const ScreenAreaCalculator()),
      RefactoringModule202307152216(txt: '\n계산기\n(생물학적나이)', destination: const ScreenCalculatorBiologicalAge()),
      RefactoringModule202307152216(txt: '\n난수생성기\n', destination: const ScreenRandomNumber()),
      RefactoringModule202307152216(txt: '\n2024년디데이\n', destination: const ScreenLeftDaysBy2024()),
      RefactoringModule202307152216(txt: '\n식목일\n', destination: const ScreenArborDay()),
      RefactoringModule202307152216(txt: '\n넥스가드급여일\n', destination: const ScreenByNextNexguardSupplyDate()),
      RefactoringModule202307152216(txt: '\n드론탈급여일\n', destination: const ScreenByNextDrontalSupplyDate()),
      RefactoringModule202307152216(txt: '\n개발자년차\n', destination: ScreenDiffMonths(startingDateTime: DateTime(2022, 10, 26), endingDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))),
    ];
    isShowToDoDrawer = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: isDarkMode ? true : false,
      title: 'app_for_mvp',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent.shade200,
        // textTheme: const TextTheme(
        //   titleLarge: TextStyle(color: Color(0xFF232b55), fontSize: 18),
        // ),
        // cardColor: const Color(0xfff4eddb),
      ),
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.black.withOpacity(0.9) : colorForScaffoldBackground,
        appBar: /*제어바*/ AppBar(
          automaticallyImplyLeading: false,
          //automaticallyImplyLeading: false, 플러터 앱바에서 자동생성 버튼 숨김 : false
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*왼쪽서랍(실험)*/ Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.didOpenLeftDrawer)));
                      },
                      icon: Icon(Icons.menu, color: MyColors.lightBlueShade50),
                      tooltip: "왼쪽서랍(실험)",
                    );
                  },
                ),
                IconButton(onPressed: toogleDevelopingMode, icon: isDarkMode ? const Icon(Icons.change_circle_outlined) : Icon(Icons.change_circle_outlined, color: MyColors.lightBlueShade50)),
                /*오른쪽서랍*/ Builder(
                  builder: (context) {
                    return IconButton(
                      // key: ,
                      onPressed: () {
                        setState(() {
                          isShowToDoDrawer = !isShowToDoDrawer;
                          if (isShowToDoDrawer == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text(MyMents.didOpenRightDrawer)));
                          }
                        });
                      },
                      icon: Icon(Icons.menu, color: MyColors.lightBlueShade50),
                      tooltip: "오른쪽서랍",
                    );
                  },
                ),
              ],
            ),
          ),
          toolbarHeight: 45,
          backgroundColor: isDarkMode ? Colors.blueAccent.withOpacity(0.2) : colorForScaffoldBackground,
          foregroundColor: isDarkMode ? Colors.blueAccent : colorForScaffoldBackground,
          elevation: 1,
        ),
        body: Stack(
          children: [
            // if (isDarkMode == true) Center(child: Container(color: MyColors.blackWithOpacity50Percent, alignment: Alignment.center, child: const ScreenIndexBlue())),
            if (isDarkMode == true) Center(child: Container(color: MyColors.blackWithOpacity50Percent, child: const ScreenIndexColorful())),
            if (isDarkMode == false) Center(child: Container(color: MyColors.blackWithOpacity50Percent, child: const ScreenIndexColorful())),
            Builder(builder: (context) {
              Widget toDoDrawer;
              if (isShowToDoDrawer == true) {
                toDoDrawer = _ToDoDrawer(
                  rightDrawerItems: toDoDrawerItems,
                );
              } else {
                toDoDrawer = Container();
              }
              return toDoDrawer;
            }),
          ],
        ),
        drawer: _ExperimentsDrawer(leftDrawerItems: experimentsDrawerItems),
      ),
    );
  }

  void initAppModes() {
    /*isDarkMode 를 false 로 저장*/
    isDarkMode = true;
    BlocProvider.of<MyAppStateCubit>(context).saveMyAppState(isDarkMode: isDarkMode); //isDarkMode false 로 저장
    /*bring isDarkMode,  isDarkMode 변수에 저장*/ //원래는 이렇게 쓰고 싶지 않으나 이미 isDarkMode 변수를 너무 많이 쓰고 있어 손이 많이가서 이렇게 하기로..결정
    BlocProvider.of<MyAppStateCubit>(context).resetMyAppState(); //isDarkMode false 로 초기화되도록 작성되어 있음
    BlocProvider.of<MyAppStateCubit>(context).toogleMyAppStateIsDarkMode(); //isDarkMode false 로 초기화되도록 작성되어 있음

    //deprecated
    // BlocBuilder<MyAppStateCubit, MyAppState>(
    //   builder: (context, MyAppState state) {
    //     // isDarkMode = state.isDarkMode;
    //     debugSomething(state.isDarkMode, troubleShootingId: "202308071939");
    //     return const Placeholder();
    //   },
    // );

    isCoolDownMode = false; //DEVELOPMENT
    isChrismasMode = false; //DEVELOPMENT
    isHappyBirthDayMode = false; //DEVELOPMENT
    isDevelopmentConcentrationMode = true; /*false*/ /*true*/
  }

  // void initIsDevelopingModeIntoLocalStorage() {
  // localStorage = LocalStorage('foo.foo');
  // if (localStorage.getItem('isDarkMode') == null) {
  //   isDarkMode = false;
  //   localStorage.setItem('isDarkMode', isDarkMode);
  // } else {
  //   isDarkMode = localStorage.getItem('isDarkMode');
  // }
  // debugSomething("isDevelopingMode:$isDarkMode");
  // }

  void initHostPlatformInfo() {
    platform = _getPlatformInfoUsingFlutterFoundation()!;
    debugSomething(platform.toString(), troubleShootingId: "20230811184727");
  }

  MyPlatforms? _getPlatformInfoUsingFlutterFoundation() {
    if (kIsWeb) {
      platform = MyPlatforms.web;
      isWeb = true;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      platform = MyPlatforms.android;
      isAndroid = true;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = MyPlatforms.iOS;
    } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      platform = MyPlatforms.fuchsia;
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      platform = MyPlatforms.linux;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      platform = MyPlatforms.windows;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      platform = MyPlatforms.macOS;
    }
    return platform;
  }

  void onClicked() {
    setState(() {
      counter = counter + 1;
      inputs.add(counter);
    });
  }

  Future<void> checkPermissionForAndroid() async {
    printWithoutWarning('__________________________________________________________________________________________________________________________ device permission s');
    if (await Permission.location.isGranted) {
      printWithoutWarning('권한이 부여되었습니다');
    }
    if (await Permission.location.isDenied) {
      printWithoutWarning('권한 부여가 거부되었습니다');
    }
    if (await Permission.location.isPermanentlyDenied) {
      printWithoutWarning('권한 부여가 영구적으로 거부되었습니다');
    }
    if (await Permission.location.isRestricted) {
      printWithoutWarning('권한이 제한되었습니다.');
    }
    printWithoutWarning('__________________________________________________________________________________________________________________________ device permission e');
  }

  void toogleDevelopingMode() {
    setState(() {
      isDarkMode = !isDarkMode;

      // localStorage.setItem('isDarkMode', isDarkMode);
      BlocProvider.of<MyAppStateCubit>(context).toogleMyAppStateIsDarkMode();
      // printWithoutError("isDarkMode:$isDarkMode");
    });
  }
}

// State
class MyAppState {
  bool isDarkMode;
  List<Movie>? movies;

  AutoManagerableIdMaker autoIds=AutoManagerableIdMaker();

  // DUMMY DATA
  List<CarrotUserCardInfos> carrotUserCardInfosDummy = [
    for (var naturalNumber in naturalNumbersMaker(0, 10))
      CarrotUserCardInfos.fromMap({
        'userItemImgUrl': MyUrls.networkImageTest,
        'itemCategory': ['반려식물', '반려동물', '가구'][Random().nextInt(['반려식물', '반려동물', '가구'].length   )],
        'userLocation': ['안양시 동안구 석수동', '서울특별시', '군포시 산본동'][Random().nextInt( ['안양시 동안구 석수동', '서울특별시', '군포시 산본동'].length)],
        'userUploadingTime': naturalNumbersMaker(0, 59).map((e) => '$e분 전').toList()[Random().nextInt(naturalNumbersMaker(0, 59).length)],
        'itemPrice': Random().nextInt(180000),
        'heartCount': Random().nextInt(12),
        'chattingRequestCount': Random().nextInt(12),
      }),
  ];

  // DUMMY DATA
  List<Movie> moviesDummy = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'kind': '사랑/로맨스/판타지',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
    Movie.fromMap({
      'title': '보헤미안 랩소디',
      'kind': '음악/드라마/인물',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
    Movie.fromMap({
      'title': '안녕, 모니카',
      'kind': '가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
    Movie.fromMap({
      'title': '포레스트 검프',
      'kind': '드라마/외국',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
    Movie.fromMap({
      'title': '쇼생크 탈출',
      'kind': '추리/반전/서스펜스',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
    Movie.fromMap({
      'title': '라이언 일병 구하기',
      'kind': '드라마/전쟁/역사',
      'imgUrl': MyUrls.networkImageTest,
      'like': [false,true][Random().nextInt(1)],
    }),
  ];

  Map<String, dynamic> multiCaseMakerState= {};

  MyAppState({this.isDarkMode = true, this.movies});
}

// Cubit
class MyAppStateCubit extends Cubit<MyAppState> {
  MyAppStateCubit() : super(MyAppState());

  void saveMyAppState({required bool isDarkMode}) {
    final MyAppState cityState = MyAppState(isDarkMode: isDarkMode);
    emit(cityState);
  }

  void toogleMyAppStateIsDarkMode() {
    final currentState = state;
    final newState = MyAppState(isDarkMode: !currentState.isDarkMode);
    debugSomething(state.isDarkMode, troubleShootingId: "toogleMyAppStateIsDarkMode()");
    emit(newState);
  }

  void resetMyAppState() {
    final newState = MyAppState(isDarkMode: false);
    debugSomething(state.isDarkMode, troubleShootingId: "resetMyAppState()");
    emit(newState);
  }
}

class _ExperimentsDrawer extends StatefulWidget {
  List<dynamic> leftDrawerItems;

  _ExperimentsDrawer({required this.leftDrawerItems});

  @override
  State<_ExperimentsDrawer> createState() => _ExperimentsDrawerState();
}

class _ExperimentsDrawerState extends State<_ExperimentsDrawer> {
  late Regions selectedRegion;
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    selectedRegion = Regions.seoul;
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.8, //이렇게 하고 싶은데...안됬음...
      decoration: BoxDecoration(
        color: MyColors.lightBlueShade50,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            // backgroundColor: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: const BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(4.0)),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                "Experimental Screens",
                style: OurTextStyles.titleTextStyle.copyWith(fontSize: 16.0, color: MyColors.black12),
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(4.0)),
            ),
            height: MediaQuery.of(context).size.height * 0.725,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 10),
                itemCount: widget.leftDrawerItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                    },
                    title: widget.leftDrawerItems[index],
                    tileColor: OurColors.greenShade400,
                    focusColor: OurColors.lightGreenAccent,
                    hoverColor: OurColors.lightGreenAccent,
                    /*타일 셀렉트 상태*/
                    selected: isSelected ? true : false,
                    // selected: true,
                    selectedTileColor: OurColors.greenShade400,
                    selectedColor: OurColors.black,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _ToDoDrawer extends StatefulWidget {
  List<dynamic> rightDrawerItems;

  _ToDoDrawer({required this.rightDrawerItems});

  @override
  State<_ToDoDrawer> createState() => _ToDoDrawerState();
}

class _ToDoDrawerState extends State<_ToDoDrawer> {
  late Regions selectedRegion;
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    selectedRegion = Regions.seoul;
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      // top: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: MyColors.lightBlueShade50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // clipBehavior: Clip.hardEdge,
              // backgroundColor: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: const BoxDecoration(
                color: MyColors.black0xff181818,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "TO DO(손볼것)",
                  style: OurTextStyles.titleTextStyle.copyWith(fontSize: 16.0, color: MyColors.lightBlueShade50),
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              height: MediaQuery.of(context).size.height * 0.725,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 10),
                  itemCount: widget.rightDrawerItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                      },
                      title: widget.rightDrawerItems[index],
                      tileColor: OurColors.greenShade400,
                      focusColor: OurColors.lightGreenAccent,
                      hoverColor: OurColors.lightGreenAccent,
                      /*타일 셀렉트 상태*/
                      selected: isSelected ? true : false,
                      // selected: true,
                      selectedTileColor: OurColors.greenShade400,
                      selectedColor: OurColors.black,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
