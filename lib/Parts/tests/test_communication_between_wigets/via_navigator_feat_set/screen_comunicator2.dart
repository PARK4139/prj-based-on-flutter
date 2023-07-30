import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

class ScreenComunicator2 extends StatefulWidget {
  const ScreenComunicator2({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator2> createState() => _ScreenComunicator2State();
}

class _ScreenComunicator2State extends State<ScreenComunicator2> {
  // var dataOfScreenComunicator2 = [2,2];
  List<dynamic> dataOfScreenComunicator2 = [2, 2];

  @override
  Widget build(BuildContext context) {
    final dataOfScreenComunicator1 = ModalRoute.of(context)!.settings.arguments;

    debugSomething(dataOfScreenComunicator1);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.pinkAccent,
          child: TextButton(
            child: const Text('ScreenComunicator1', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop(dataOfScreenComunicator2);
            },
          ),
        ),
      ),
    );
  }
}
