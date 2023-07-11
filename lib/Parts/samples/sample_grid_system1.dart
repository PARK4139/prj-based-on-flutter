import 'package:flutter/material.dart';

class SampleGridSystem1 extends StatefulWidget {
  const SampleGridSystem1({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleGridSystem1> createState() => _SampleGridSystem1State();
}

class _SampleGridSystem1State extends State<SampleGridSystem1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
