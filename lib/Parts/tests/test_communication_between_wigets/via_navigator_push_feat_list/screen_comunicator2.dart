import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

class screen_comunicator2 extends StatefulWidget {
  const screen_comunicator2({Key? key}) : super(key: key);

  @override
  State<screen_comunicator2> createState() => _screen_comunicator2State();
}

class _screen_comunicator2State extends State<screen_comunicator2> {
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
            child: const Text('ScreenComunicator1',style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop(dataOfTaker);
            },
          ),
        ),
      ),
    );
  }
}
