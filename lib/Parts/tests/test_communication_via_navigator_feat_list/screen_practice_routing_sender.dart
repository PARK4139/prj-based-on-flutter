import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

import 'screen_practice_routing_taker.dart';

class ScreenPracticeRoutingSender extends StatefulWidget {
  const ScreenPracticeRoutingSender({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingSender> createState() => _ScreenPracticeRoutingSenderState();
}

class _ScreenPracticeRoutingSenderState extends State<ScreenPracticeRoutingSender> {
  var dataOfSender = [1,1];


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
              var dataOfTaker = await Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(arguments: dataOfSender),
                  builder: (context) => const ScreenPracticeRoutingTaker(),
                ),
              );
              debugSomething(dataOfTaker);

            },
          ),
        ),
      ),
    );
  }
}
