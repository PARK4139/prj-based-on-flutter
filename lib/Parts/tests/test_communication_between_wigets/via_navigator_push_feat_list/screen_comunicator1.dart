import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

import 'screen_comunicator2.dart';

class screen_comunicator1 extends StatefulWidget {
  const screen_comunicator1({Key? key}) : super(key: key);

  @override
  State<screen_comunicator1> createState() => _screen_comunicator1State();
}

class _screen_comunicator1State extends State<screen_comunicator1> {
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
                  builder: (context) => const screen_comunicator2(),
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
