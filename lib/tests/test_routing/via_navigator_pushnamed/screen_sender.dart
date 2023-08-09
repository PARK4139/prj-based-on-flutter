import 'package:flutter/material.dart';

import '../../../components/screens/screen_index_colorful.dart';


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

class ScreenComunicator1 extends StatefulWidget {
  const ScreenComunicator1({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator1> createState() => _ScreenComunicator1State();
}

class _ScreenComunicator1State extends State<ScreenComunicator1> {
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
