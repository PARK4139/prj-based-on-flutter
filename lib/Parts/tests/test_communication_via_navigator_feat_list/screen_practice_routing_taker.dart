import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

class ScreenPracticeRoutingTaker extends StatefulWidget {
  const ScreenPracticeRoutingTaker({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingTaker> createState() => _ScreenPracticeRoutingTakerState();
}

class _ScreenPracticeRoutingTakerState extends State<ScreenPracticeRoutingTaker> {
   var dataOfTaker = [2,2];
  @override
  Widget build(BuildContext context) {
  final dataOfSender = ModalRoute.of(context)!.settings.arguments;

    debugSomething(dataOfSender);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.pinkAccent,
          child: TextButton(
            child: const Text('ScreenSender',style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop(dataOfTaker);
            },
          ),
        ),
      ),
    );
  }
}
