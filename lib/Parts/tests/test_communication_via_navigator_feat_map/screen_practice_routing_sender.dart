import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

import 'screen_practice_routing_taker.dart';

class ScreenPracticeRoutingSender extends StatefulWidget {
  const ScreenPracticeRoutingSender({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingSender> createState() => _ScreenPracticeRoutingSenderState();
}

class _ScreenPracticeRoutingSenderState extends State<ScreenPracticeRoutingSender> {
  Map<String, Map<String, dynamic>> dataOfSender = {
    "header": {
      "1": 1,
      "2": 1,
      "3": 1,
    },
    "body": {
      "1": 1,
      "2": 1,
      "3": 1,
    },
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.pinkAccent,
          child: TextButton(
            child: const Text('ScreenTaker', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              Map<String, Map<String, dynamic>>  dataOfTaker = await Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(arguments: dataOfSender),
                  builder: (context) => const ScreenPracticeRoutingTaker(),
                ),
              );
              // debugSomething(dataOfTaker["header"]!["1"]);
              debugSomething(dataOfTaker);
            },
          ),
        ),
      ),
    );
  }
}
