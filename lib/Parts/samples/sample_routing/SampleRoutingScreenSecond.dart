import 'package:flutter/material.dart';

class SampleRoutingScreenSecond extends StatefulWidget {
  const SampleRoutingScreenSecond({Key? key}) : super(key: key);

  @override
  State<SampleRoutingScreenSecond> createState() => _SampleRoutingScreenSecondState();
}

class _SampleRoutingScreenSecondState extends State<SampleRoutingScreenSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('GO TO SCREEN_FIRST'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
