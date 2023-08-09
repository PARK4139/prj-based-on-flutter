import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prj_app_mvp/components/screens/screen_index_colorful.dart';
import 'package:prj_app_mvp/utils/rainbow_icon_maker.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

import 'components/screens/screen_index_blue.dart';
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

  int currentPageIndex = 0;

  /*네비게이션 labelBehavior 옵션*/
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  int counter = 0;
  List<int> inputs = [];

  late Widget ghostWiget;
  late Platforms? platform;

  // late bool isAndroid;
  late bool? isAndroid;
  late bool isWeb;

  Color colorForScaffoldBackground = Colors.white;

  @override
  void initState() {
    super.initState();
    printWithoutError('__________________________________________________________________________________________________________________________ s');
    initHostPlatformInfo();
    initAppModes();
    //   printWithoutError('__________________________________________________________________________________________________________________________ auth check s');
    //   if (isAndroid == true) {
    //     checkPermissionForAndroid();
    //   }
    //   printWithoutError('__________________________________________________________________________________________________________________________ auth check e');

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
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: toogleDevelopingMode, icon: isDarkMode ? const Icon(Icons.change_circle_outlined) : Icon(Icons.change_circle_outlined, color: Colors.lightBlue.shade50)),
              ],
            ),
          ),
          toolbarHeight: 45,
          backgroundColor: isDarkMode ? Colors.blueAccent.withOpacity(0.2) : colorForScaffoldBackground,
          foregroundColor: isDarkMode ? Colors.blueAccent : colorForScaffoldBackground,
          elevation: 1,
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          labelBehavior: labelBehavior,
          destinations: <Widget>[
            Builder(
              builder: (context) {
                if (isDarkMode == false) {
                  ghostWiget = const Center(child: null);
                } else {
                  ghostWiget = NavigationDestination(label: 'INDEX COLORFUL', selectedIcon: RainbowIconMaker(iconData: Icons.folder), icon: const Icon(Icons.folder));
                }
                return ghostWiget;
              },
            ),
            Builder(
              builder: (context) {
                if (isDarkMode == false) {
                  ghostWiget = const Center(child: null);
                } else {
                  ghostWiget = const NavigationDestination(label: 'INDEX BLUE', selectedIcon: Icon(Icons.folder, color: Colors.blueAccent), icon: Icon(Icons.folder, color: Colors.black));
                }
                return ghostWiget;
              },
            ),
          ],
        ),
        body: <Widget>[
          Builder(
            builder: (context) {
              if (isDarkMode == false) {
                ghostWiget = Center(child: Container(color: Colors.black.withOpacity(0.5), child: ScreenIndexColorful(isDarkMode: isDarkMode)));
              } else {
                ghostWiget = Center(child: Container(color: Colors.black.withOpacity(0.5), child: ScreenIndexColorful(isDarkMode: isDarkMode)));
              }
              return ghostWiget;
            },
          ),
          Builder(
            builder: (context) {
              if (isDarkMode == false) {
                ghostWiget = const Center(child: null); //PRODUCTION
              } else {
                ghostWiget = Center(child: Container(color: Colors.black.withOpacity(0.5), alignment: Alignment.center, child: const ScreenIndexBlue()));
              }
              return ghostWiget;
            },
          ),
        ][isDarkMode ? currentPageIndex : currentPageIndex],
      ),
    );
  }

  void initAppModes()   {
    // initIsDevelopingModeIntoLocalStorage();

    /*isDarkMode 를 false 로 저장*/
    isDarkMode = false;
    BlocProvider.of<MyAppStateCubit>(context).saveMyAppState(isDarkMode: isDarkMode); //isDarkMode false 로 저장
    /*bring isDarkMode,  isDarkMode 변수에 저장*/ //원래는 이렇게 쓰고 싶지 않으나 이미 isDarkMode 변수를 너무 많이 쓰고 있어 손이 많이가서 이렇게 하기로..결정
    BlocProvider.of<MyAppStateCubit>(context).resetMyAppState();//isDarkMode false 로 초기화되도록 작성되어 있음

    BlocProvider.of<MyAppStateCubit>(context).toogleMyAppStateIsDarkMode();//isDarkMode false 로 초기화되도록 작성되어 있음


    // Bloc cubit 사용해서 상태 Read
    // MyAppStateCubit cubit = MyAppStateCubit();
    // isDarkMode = cubit.state.isDarkMode;

    // Bloc cubit 사용해서 상태 Update
    // MyAppState newState = cubit.state;
    // cubit.emit(newState);



    BlocBuilder<MyAppStateCubit, MyAppState>(
      builder: (context, MyAppState state) {
        // isDarkMode = state.isDarkMode;
        debugSomething(state.isDarkMode, troubleShootingId: "202308071939");
        return const Placeholder();
      },
    );

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
    // isAndroid = false;
    platform = _getPlatformInfoUsingFlutterFoundation()!;
  }

  Platforms? _getPlatformInfoUsingFlutterFoundation() {
    if (kIsWeb) {
      platform = Platforms.web;
      isWeb = true;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      platform = Platforms.android;
      isAndroid = true;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = Platforms.iOS;
    } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      platform = Platforms.fuchsia;
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      platform = Platforms.linux;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      platform = Platforms.windows;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      platform = Platforms.macOS;
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
    printWithoutError('__________________________________________________________________________________________________________________________ permission_handler works s');
    if (await Permission.location.isGranted) {
      printWithoutError('권한이 부여되었습니다');
    }
    if (await Permission.location.isDenied) {
      printWithoutError('권한 부여가 거부되었습니다');
    }
    if (await Permission.location.isPermanentlyDenied) {
      printWithoutError('권한 부여가 영구적으로 거부되었습니다');
    }
    if (await Permission.location.isRestricted) {
      printWithoutError('권한이 제한되었습니다.');
    }
    printWithoutError('__________________________________________________________________________________________________________________________ permission_handler works e');
  }

  void toogleDevelopingMode() {
    setState(() {
      if (isDarkMode == true) {
        isDarkMode = false;
      } else {
        isDarkMode = true;
      }
      // localStorage.setItem('isDarkMode', isDarkMode);
      BlocProvider.of<MyAppStateCubit>(context).toogleMyAppStateIsDarkMode();
      // printWithoutError("isDarkMode:$isDarkMode");
    });
  }
}

enum Platforms {
  web,
  android,
  fuchsia,
  iOS,
  linux,
  macOS,
  windows,
}



// State
class MyAppState {
  bool isDarkMode;
  List<Movie>? movies;
    List<Movie> moviesDummy = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'kind': '사랑/로맨스/판타지',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '보헤미안 랩소디',
      'kind': '음악/드라마/인물',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '안녕, 모니카',
      'kind': '가슴 뭉클/로맨스/코미디/금지된 사랑/정반대 캐릭터',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '포레스트 검프',
      'kind': '드라마/외국',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '쇼생크 탈출',
      'kind': '추리/반전/서스펜스',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '라이언 일병 구하기',
      'kind': '드라마/전쟁/역사',
      'imgUrl': 'asset/images/app_netflix_movie_poster_1.png',
      'like': false,
    }),
  ];



  MyAppState({this.isDarkMode = false , this.movies});
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
    debugSomething(state.isDarkMode,troubleShootingId: "toogleMyAppStateIsDarkMode()");
    emit(newState);
  }

  void resetMyAppState() {
    final newState = MyAppState(isDarkMode: false);
    debugSomething(state.isDarkMode,troubleShootingId: "resetMyAppState()");
    emit(newState);
  }
}
