import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/components/helpers/super_helper.dart';

import 'screen_comunicator2.dart';

class ScreenComunicator1 extends StatefulWidget {
  const ScreenComunicator1({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator1> createState() => _ScreenComunicator1State();
}

class _ScreenComunicator1State extends State<ScreenComunicator1> {
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
                  builder: (context) => const ScreenComunicator2(),
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
