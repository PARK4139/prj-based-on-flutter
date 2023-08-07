import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/components/helpers/super_helper.dart';

class ScreenComunicator2 extends StatefulWidget {
  const ScreenComunicator2({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator2> createState() => _ScreenComunicator2State();
}

class _ScreenComunicator2State extends State<ScreenComunicator2> {
  Map<String, Map<String, dynamic>> dataOfTaker = {
    "header": {
      "1": 2,
      "2": 2,
      "3": 2,
    },
    "body": {
      "1": 2,
      "2": 2,
      "3": 2,
    },
  };

  @override
  Widget build(BuildContext context) {
    // Map<String, Map<String, dynamic>>  dataOfSender = ModalRoute.of(context)!.settings.arguments;
    Map<String, Map<String, dynamic>> dataOfSender = ModalRoute.of(context)!.settings.arguments as Map<String, Map<String, dynamic>>;
    // debugSomething(dataOfSender["header"]!["1"]);
    debugSomething(dataOfSender);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.pinkAccent,
          child: TextButton(
            child: const Text('ScreenComunicator1', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop(dataOfTaker);
            },
          ),
        ),
      ),
    );
  }
}
