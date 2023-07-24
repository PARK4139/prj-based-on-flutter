import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prj_app_feat_nomadcoder_class/screen_index_colorful.dart';

import 'Parts/helpers/rainbow_icon_maker.dart';
import 'Parts/helpers/super_helper.dart';
import 'screen_index_blue.dart';

//apk 빌드 시 파일명은 1.dart 여야한다?.
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
  LocalStorage storage = LocalStorage('foo.foo');
  late bool isDarkMode; //DEVELOPMENT
  late bool isCoolDownMode; //DEVELOPMENT
  late bool isChrismasMode; //DEVELOPMENT
  late bool isHappyBirthDayMode; //DEVELOPMENT
  late bool isDevelopmentConcentrationMode;

  int currentPageIndex = 0;


  /*네비게이션 labelBehavior 옵션*/
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  int counter = 0;
  List<int> inputs = [];
  bool showDecision = true;
  dynamic foo = 0;
  String appHeadTitle = '안녕하세요 개발 지원 서비스입니다';

  late Widget ghostWiget;
  late Platforms? platform;
  late bool isAndroid;
  late bool isWeb;


  Color colorForScaffoldBackground = Colors.white;

  @override
  void initState() {
    super.initState();
    printWithoutErrorOrPrintWithError('__________________________________________________________________________________________________________________________ s');
    initHostPlatformInfo();
    initAppModes();
    if (isDarkMode == false) {
    } else {
      printWithoutErrorOrPrintWithError('__________________________________________________________________________________________________________________________ auth check s');
      if (isAndroid == true) {
        checkPermissionForAndroid();
      }
      printWithoutErrorOrPrintWithError('__________________________________________________________________________________________________________________________ auth check e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: isDarkMode ? true : false,
        title: '나의 앱들',
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
    });
  }

  void initAppModes() {
    setState(() {
      initIsDevelopingMode();
      isCoolDownMode = false; //DEVELOPMENT
      isChrismasMode = false; //DEVELOPMENT
      isHappyBirthDayMode = false; //DEVELOPMENT
      isDevelopmentConcentrationMode = true; /*false*/ /*true*/
    });
  }

  void initIsDevelopingMode() {
    if (storage.getItem('isChecked') == null) {
      isDarkMode = false;
      storage.setItem('isChecked', isDarkMode);
    } else {
      isDarkMode = storage.getItem('isChecked');
    }
    printWithoutErrorOrPrintWithError("isDevelopingMode:$isDarkMode");
  }

  void initHostPlatformInfo() {
    isAndroid = false;
    platform = _getPlatformInfoUsingFlutterFoundation()!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
    printWithoutErrorOrPrintWithError('__________________________________________________________________________________________________________________________ permission_handler works s');
    if (await Permission.location.isGranted) {
      printWithoutErrorOrPrintWithError('권한이 부여되었습니다');
    }
    if (await Permission.location.isDenied) {
      printWithoutErrorOrPrintWithError('권한 부여가 거부되었습니다');
    }
    if (await Permission.location.isPermanentlyDenied) {
      printWithoutErrorOrPrintWithError('권한 부여가 영구적으로 거부되었습니다');
    }
    if (await Permission.location.isRestricted) {
      printWithoutErrorOrPrintWithError('권한이 제한되었습니다.');
    }
    printWithoutErrorOrPrintWithError('__________________________________________________________________________________________________________________________ permission_handler works e');
  }

  void toogleDevelopingMode() {
    setState(() {
      if (isDarkMode == true) {
        isDarkMode = false;
      } else {
        isDarkMode = true;
      }
      storage.setItem('isChecked', isDarkMode);
      printWithoutErrorOrPrintWithError("isDevelopingMode:$isDarkMode");

      //debug mode 로 전환시 새로 Screen_first_take 로 라우팅하기 위함.
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
