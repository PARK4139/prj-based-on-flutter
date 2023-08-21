import 'package:flutter/material.dart';
import 'package:prj_app_mvp/tests/test_routing/via_navigator_pushnamed/screen_sender.dart';

import '../../../utils/super_helper.dart';



class ScreenComunicator2 extends StatefulWidget {
  const ScreenComunicator2({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator2> createState() => _ScreenComunicator2State();
}

class _ScreenComunicator2State extends State<ScreenComunicator2> {
  @override
  Widget build(BuildContext context) {

    final classArguments = ModalRoute.of(context)!.settings.arguments as ClassArguments;
    debugSomething(classArguments);
    debugSomething(classArguments.toString());
    debugSomething(classArguments.argument1);
    debugSomething(classArguments.argument2);
    debugSomething(classArguments.argument3);

    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenFirst'),
        onPressed: () {
          Navigator.of(context).pop(classArguments.toString());
        },
      ),
    );
  }
}
