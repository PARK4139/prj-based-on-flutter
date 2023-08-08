import 'package:flutter/material.dart';

import '../../../utils/super_helper.dart';



class ScreenComunicator2 extends StatefulWidget {
  const ScreenComunicator2({Key? key}) : super(key: key);

  @override
  State<ScreenComunicator2> createState() => _ScreenComunicator2State();
}

class _ScreenComunicator2State extends State<ScreenComunicator2> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments ;
    debugSomething(args.toString());
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    // debugSomething(args.name);
    // debugSomething(args.title);

    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenFirst'),
        onPressed: () {
          Navigator.of(context).pop();
          // Navigator.of(context).pop(args.toString());
        },
      ),
    );
  }
}
