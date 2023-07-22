import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

import 'screen_practice_routing_taker.dart';

class ScreenPracticeRoutingSender extends StatefulWidget {
  const ScreenPracticeRoutingSender({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingSender> createState() => _ScreenPracticeRoutingSenderState();
}

class _ScreenPracticeRoutingSenderState extends State<ScreenPracticeRoutingSender> {
  Set<Map<String,dynamic>> dataOfSender = {//set 으로 데이터를 처리할 필요가 있는지 모르겠다. 중복처리할때 혹시 유용할 수도...
    {
      "1":'test',
      "2":1,
    }
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
