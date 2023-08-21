import 'package:flutter/material.dart';

import '../../../components/screens/screen_index_colorful.dart';
import '../../../utils/super_helper.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: MyRoutes.indexRoute,
    routes: {
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(),
      MyRoutes.indexRoute: (context) => ScreenIndexColorful(),
    },
  ));
}

class ScreenComunicator1 extends StatefulWidget {
  const ScreenComunicator1({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator1> createState() => _ScreenComunicator1State();
}

class _ScreenComunicator1State extends State<ScreenComunicator1> {
  ClassArguments classArguments = ClassArguments(argument1: true, argument2: true,argument3: "String");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenSecond', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.pushNamed(
            context,
            MyRoutes.indexRoute,
            arguments: classArguments,
          );
        },
      ),
    );
  }
}

class ClassArguments {
  bool argument1 = false;
  bool argument2 = false;
  String argument3 = "";
  ClassArguments({required this.argument1, required this.argument2, required this.argument3});
}
