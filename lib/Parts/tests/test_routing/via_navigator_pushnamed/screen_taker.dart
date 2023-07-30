import 'package:flutter/material.dart';

import '../../../helpers/super_helper.dart';


class screen_taker extends StatefulWidget {
  const screen_taker({Key? key}) : super(key: key);

  @override
  State<screen_taker> createState() => _screen_takerState();
}

class _screen_takerState extends State<screen_taker> {
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
