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

class screen_sender extends StatefulWidget {
  const screen_sender({Key? key}) : super(key: key);

  @override
  State<screen_sender> createState() => _screen_senderState();
}

class _screen_senderState extends State<screen_sender> {
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
