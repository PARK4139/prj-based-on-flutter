import 'package:flutter/material.dart';

class ScreenPracticeRoutingTaker extends StatefulWidget {
  const ScreenPracticeRoutingTaker({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingTaker> createState() => _ScreenPracticeRoutingTakerState();
}

class _ScreenPracticeRoutingTakerState extends State<ScreenPracticeRoutingTaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenFirst'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
