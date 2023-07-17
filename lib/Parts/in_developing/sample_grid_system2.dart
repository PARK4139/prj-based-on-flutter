import 'package:flutter/material.dart';

class SampleGridSystem2 extends StatefulWidget {
  const SampleGridSystem2({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleGridSystem2> createState() => _SampleGridSystem2State();
}

class _SampleGridSystem2State extends State<SampleGridSystem2> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.purple,
        ),
      ],
    );
  }
}
