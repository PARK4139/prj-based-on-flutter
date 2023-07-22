import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

class ScreenPracticeRoutingTaker extends StatefulWidget {
  const ScreenPracticeRoutingTaker({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingTaker> createState() => _ScreenPracticeRoutingTakerState();
}

class _ScreenPracticeRoutingTakerState extends State<ScreenPracticeRoutingTaker> {
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
            child: const Text('ScreenSender', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop(dataOfTaker);
            },
          ),
        ),
      ),
    );
  }
}
