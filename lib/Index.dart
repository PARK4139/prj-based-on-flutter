import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Parts/in_operating/My_functions.dart';
import 'Parts/in_operating/Screen_chat.dart';
import 'Parts/in_operating/Screen_colorful.dart';
import 'Parts/in_operating/Screen_indexes.dart';
import 'Parts/in_operating/Screen_to_control_text.dart';
import 'Parts/in_operating/Screen_to_debug.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  LocalStorage storage = LocalStorage('foo.foo');
  late bool isDevelopingMode; //DEVELOPMENT
  late bool isCoolDownMode; //DEVELOPMENT
  late bool isChrismasMode; //DEVELOPMENT
  late bool isHappyBirthDayMode; //DEVELOPMENT

  int currentPageIndex = 0;

  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  // NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;

  int Counter = 0;
  List<int> inputs = [];
  bool show_decision = true;
  var myTools = MyFunctions();

  var myColors = MyColors();
  dynamic foo = 0;

  String app_head_title = '안녕하세요 개발 지원 서비스입니다';

  late Widget wierd_wiget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_______________________________________________________________________ s');
    initAppModes();
    if (isDevelopingMode == false) {
      print('_______________________________________________________________________ auth check s');
      check_permission_for_android();
      print('_______________________________________________________________________ auth check e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
      // 권한이 부여되었습니다.
      print('권한이 부여되었습니다');
    }
    if (await Permission.location.isDenied) {
      // 권한 부여가 거부되었습니다.
      print('권한 부여가 거부되었습니다');
    }
    if (await Permission.location.isPermanentlyDenied) {
      // 권한 부여가 영구적으로 거부되었습니다.
      print('권한 부여가 영구적으로 거부되었습니다');
    }
    if (await Permission.location.isRestricted) {
      // 권한이 제한되었습니다.
      print('권한이 제한되었습니다.');
    }
    print('_______________________________________________________________________ permission_handler works e');
  }

  void toogleDevelopingMode() {
    setState(() {
      if (isDevelopingMode == true) {
        isDevelopingMode = false;
      } else {
        isDevelopingMode = true;
      }
      storage.setItem('isChecked', isDevelopingMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pinkAccent.shade200,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF232b55),
            fontSize: 18,
          ),
        ),
        cardColor: const Color(0xfff4eddb),
      ),
      debugShowCheckedModeBanner: isDevelopingMode ? true : false,
      home: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        appBar: AppBar(
          title: Center(
            child: Column(
              children: [
                IconButton(onPressed: toogleDevelopingMode, icon: Icon(Icons.change_circle_outlined)),
                // Rainbow_text_maker(text: app_head_title, color: MyColors.grey_clear /*Colors.grey.withOpacity(0.9)*/, font_size: 8, font_weight: FontWeight.w200, isRainbowMode: true),
              ],
            ),
          ),
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          foregroundColor: Colors.blueAccent,
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
                if (isDevelopingMode == true) {
                  wierd_wiget = NavigationDestination(
                    selectedIcon: Icon(Icons.folder_open),
                    icon: Icon(Icons.folder),
                    label: 'FIRST TAKE',
                    // label: 'DEBUG IN',
                  );
                } else {
                  wierd_wiget = NavigationDestination(
                    selectedIcon: Icon(Icons.folder_open),
                    icon: Icon(Icons.folder),
                    label: 'INDEX',
                  );
                }
                return wierd_wiget;
              },
            ),
            NavigationDestination(selectedIcon: Icon(Icons.folder_open), icon: Icon(Icons.folder), label: 'COLORFUL'),
            // NavigationDestination(selectedIcon: Icon(Icons.folder_open), icon: Icon(Icons.folder), label: 'FLUTTER'),
          ],
        ),
        body: <Widget>[
          Builder(
            builder: (context) {
              if (isDevelopingMode == true) {
                wierd_wiget = Center(
                  child: Container(color: Colors.black.withOpacity(0.5), alignment: Alignment.center, child: Screen_to_first_take()), //TEST FOR SPEEDY
                );
              } else {
                wierd_wiget = Center(
                  child: Container(color: Colors.black.withOpacity(0.5), alignment: Alignment.center, child: Screen_indexes()),
                );
              }
              return wierd_wiget;
            },
          ),
          Center(
            child: Container(
              // color: Colors.grey,
              color: Colors.black.withOpacity(0.5),
              child: Screen_colorful(),
            ),
          ),
          Container(
            color: MyColors.black_undefined, //DEVELOPMENT
            alignment: Alignment.center, //DEVELOPMENT
            child: Placeholder(), //DEVELOPMENT
          ),
        ][isDevelopingMode ? currentPageIndex : currentPageIndex],
      ),
    );
  }

  void initAppModes() {
    setState(() {
      initDevelopingMode();
      isCoolDownMode = false; //DEVELOPMENT
      isChrismasMode = false; //DEVELOPMENT
      isHappyBirthDayMode = false; //DEVELOPMENT
    });
  }

  void initDevelopingMode() {
    if (storage.getItem('isChecked') == null) {
      // isDevelopingMode = false; //PRODUCTION
      isDevelopingMode = true; //DEVELOPMENT
      storage.setItem('isChecked', isDevelopingMode);
    } else {
      isDevelopingMode = storage.getItem('isChecked');
    }
  }
}
