import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Groups/MyFavoriteThings/MyFunctions.dart';
import 'Groups/MyFavoriteThings/Screen_Index.dart';
import 'Groups/MyFavoriteThings/Screen_development.dart';
import 'Groups/MyFavoriteThings/Screen_promodo.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('_______________________________________________________________________ s');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        appBar: AppBar(
          title: Center(
            child: Column(
              children: [
                Text(
                  // 'MY ASSISTANCE',
                  '',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
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
          // indicatorColor: MyFavoriteColors().darkColor1,
          destinations: const <Widget>[

            NavigationDestination(
              selectedIcon: Icon(Icons.folder_open),
              icon: Icon(Icons.folder),
              label: 'INDEX',
            ),
            // NavigationDestination(
            //   selectedIcon: Icon(Icons.folder_open),
            //   icon: Icon(Icons.folder),
            //   label: 'ALGENT',
            // ),
            NavigationDestination(
              // selectedIcon: Icon(Icons.folder_copy_outlined),
              selectedIcon: Icon(Icons.folder_open),
              icon: Icon(Icons.folder),
              label: 'POMODORO',
            ),


            NavigationDestination(
              selectedIcon: Icon(Icons.folder_open),
              icon: Icon(Icons.folder),
              label: 'DEVELOPMENT',
            ),
          ],
        ),


        body: <Widget>[

          Center(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              alignment: Alignment.center,
              child: Screen_index(),
            ),
          ),

          // Container(
          //   color: Colors.black.withOpacity(0.5),
          //   alignment: Alignment.center,
          //   child: Screen_algent_collector(),
          // ),
          Center(
            child: Container(
              // color: Colors.grey,
              color: Colors.black.withOpacity(0.5),
              child: Screen_promodo(),
            ),
          ),
          Container(
            color: MyColors.black_undefined, //DEVELOPMENT
            alignment: Alignment.center, //DEVELOPMENT
            child: Screen_development(), //DEVELOPMENT
          ),

        ][currentPageIndex],
      ),
    );
  }

  void onClicked() {
    setState(() {
      Counter = Counter + 1;
      inputs.add(Counter);
    });
  }
}

Future<void> check_permission() async {
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
