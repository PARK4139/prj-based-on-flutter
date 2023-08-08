import 'package:flutter/material.dart';

import '../../../utils/super_helper.dart';



class ScreenComunicator2 extends StatefulWidget {
  const ScreenComunicator2({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator2> createState() => _ScreenComunicator2State();
}

class _ScreenComunicator2State extends State<ScreenComunicator2> {
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
