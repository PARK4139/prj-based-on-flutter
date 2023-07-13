import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Parts/in_operating/rainbow_icon.dart';
import 'Parts/in_operating/screen_index_blue.dart';
import 'Parts/in_operating/screen_index_colorful.dart';

//apk 빌드 시 파일명은 grammer.dart 여야한다?.
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

  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;
  int Counter = 0;
  List<int> inputs = [];
  bool show_decision = true;
  dynamic foo = 0;
  String app_head_title = '안녕하세요 개발 지원 서비스입니다';

  late Widget ghost_wiget;
  late Platforms? platform;
  late bool isAndroid;
  late bool isWeb;

  // Color Scaffold_background_color = Colors.white54;
  // Color color_for_scaffold_background = Colors.lightGreen.shade300;
  Color color_for_scaffold_background = Colors.white;

  @override
  void initState() {
    super.initState();
    print('_______________________________________________________________________ s');
    init_host_platform_info();
    initAppModes();
    if (isDarkMode == false) {
    } else {
      print('_______________________________________________________________________ auth check s');
      if (isAndroid == true) {
        check_permission_for_android();
      }
      print('_______________________________________________________________________ auth check e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: isDarkMode ? true : false,
        title: '나의 플러터 베이스 앱',
        theme: ThemeData(
          primaryColor: Colors.pinkAccent.shade200,
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Color(0xFF232b55), fontSize: 18),
          ),
          cardColor: const Color(0xfff4eddb),
        ),
        home: Scaffold(
          backgroundColor: isDarkMode ? Colors.black.withOpacity(0.9) : color_for_scaffold_background,
          appBar: AppBar(
            title: Center(
              child: Column(
                children: [
                  IconButton(onPressed: toogleDevelopingMode, icon: isDarkMode ? Icon(Icons.change_circle_outlined) : Icon(Icons.change_circle_outlined, color: Colors.lightBlue.shade50)),
                ],
              ),
            ),
            backgroundColor: isDarkMode ? Colors.blueAccent.withOpacity(0.2) : color_for_scaffold_background,
            foregroundColor: isDarkMode ? Colors.blueAccent : color_for_scaffold_background,
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
                    ghost_wiget = Center(child: null);
                  } else {
                    ghost_wiget = NavigationDestination(label: 'INDEX COLORFUL', selectedIcon: Rainbow_icon(iconData: Icons.folder), icon: Icon(Icons.folder));
                  }
                  return ghost_wiget;
                },
              ),
              Builder(
                builder: (context) {
                  if (isDarkMode == false) {
                    ghost_wiget = Center(child: null);
                  } else {
                    ghost_wiget = NavigationDestination(label: 'INDEX BLUE', selectedIcon: Icon(Icons.folder, color: Colors.blueAccent), icon: Icon(Icons.folder, color: Colors.black));
                  }
                  return ghost_wiget;
                },
              ),
            ],
          ),
          body: <Widget>[
            Builder(
              builder: (context) {
                if (isDarkMode == false) {
                  ghost_wiget = Center(child: Container(color: Colors.black.withOpacity(0.5), child: Screen_index_colorful(isDarkMode: isDarkMode)));
                } else {
                  ghost_wiget = Center(child: Container(color: Colors.black.withOpacity(0.5), child: Screen_index_colorful(isDarkMode: isDarkMode)));
                }
                return ghost_wiget;
              },
            ),
            Builder(
              builder: (context) {
                if (isDarkMode == false) {
                  ghost_wiget = Center(child: null); //PRODUCTION
                } else {
                  ghost_wiget = Center(child: Container(color: Colors.black.withOpacity(0.5), alignment: Alignment.center, child: Screen_index_blue()));
                }
                return ghost_wiget;
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
    print("isDevelopingMode:" + isDarkMode.toString());
  }

  void init_host_platform_info() {
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
      platform = Platforms.Android;
      isAndroid = true;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = Platforms.iOS;
    } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      platform = Platforms.Fuchsia;
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      platform = Platforms.Linux;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      platform = Platforms.Windows;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      platform = Platforms.macOS;
    }
    return platform;
  }

  void onClicked() {
    setState(() {
      Counter = Counter + 1;
      inputs.add(Counter);
    });
  }

  Future<void> check_permission_for_android() async {
    print('_______________________________________________________________________ permission_handler works s');
    if (await Permission.location.isGranted) {
      print('권한이 부여되었습니다');
    }
    if (await Permission.location.isDenied) {
      print('권한 부여가 거부되었습니다');
    }
    if (await Permission.location.isPermanentlyDenied) {
      print('권한 부여가 영구적으로 거부되었습니다');
    }
    if (await Permission.location.isRestricted) {
      print('권한이 제한되었습니다.');
    }
    print('_______________________________________________________________________ permission_handler works e');
  }

  void toogleDevelopingMode() {
    setState(() {
      if (isDarkMode == true) {
        isDarkMode = false;
      } else {
        isDarkMode = true;
      }
      storage.setItem('isChecked', isDarkMode);
      print("isDevelopingMode:" + isDarkMode.toString());

      //debug mode 로 전환시 새로 Screen_first_take 로 라우팅하기 위함.
    });
  }
}

enum Platforms {
  web,
  Android,
  Fuchsia,
  iOS,
  Linux,
  macOS,
  Windows,
}
