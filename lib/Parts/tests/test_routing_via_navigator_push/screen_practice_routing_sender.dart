import 'package:flutter/material.dart';

import 'screen_practice_routing_taker.dart';

class ScreenPracticeRoutingSender extends StatefulWidget {
  const ScreenPracticeRoutingSender({Key? key}) : super(key: key);

  @override
  State<ScreenPracticeRoutingSender> createState() => _ScreenPracticeRoutingSenderState();
}

class _ScreenPracticeRoutingSenderState extends State<ScreenPracticeRoutingSender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('ScreenSecond', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenPracticeRoutingTaker()));
        },
      ),
    );
  }
}
