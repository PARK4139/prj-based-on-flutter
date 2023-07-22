import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/screen_index_colorful.dart';

class MyRoutes {
  static String indexRoute = "/";
  static String testRoute = "/test";
  static String fooRoute = "/foo";
  static String mainRoute = "/main";
  static String errorRoute = "/error";
  static String notReadyYetRoute = "/not-ready-yet";
}

// Map <String,dynamic> MySetting = {
//   "isDarkMode":true
//
// };

class MyWigetTreeSetting {
  static bool isDarkMode = true;
}

void main() {
  runApp(MaterialApp(
    initialRoute: MyRoutes.indexRoute,
    routes: {
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(isDarkMode: MyWigetTreeSetting.isDarkMode),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(isDarkMode: MyWigetTreeSetting.isDarkMode),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(isDarkMode: MyWigetTreeSetting.isDarkMode),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(isDarkMode: MyWigetTreeSetting.isDarkMode),
    },
  ));
}

class ScreenPracticeRoutingSender extends StatefulWidget {
  const ScreenPracticeRoutingSender({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingSender> createState() => _ScreenPracticeRoutingSenderState();
}

class _ScreenPracticeRoutingSenderState extends State<ScreenPracticeRoutingSender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenSecond', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.indexRoute, arguments:MyWigetTreeSetting );
        },
      ),
    );
  }
}
