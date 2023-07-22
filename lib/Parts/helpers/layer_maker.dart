import 'package:flutter/material.dart';

class StackLayerMaker extends StatefulWidget {
  const StackLayerMaker({super.key});

  @override
  State<StackLayerMaker> createState() => _StackLayerMakerState();
}

class _StackLayerMakerState extends State<StackLayerMaker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.translate(
          offset: const Offset(-0, -10),
          child: Container(
            color: Colors.red,
            height: 40,
            width: 40,
          ),
        ),
        Transform.translate(
          offset: const Offset(-0, -20),
          child: Container(
            color: Colors.blue,
            height: 40,
            width: 40,
          ),
        ),
        Transform.translate(
          offset: const Offset(-0, -30),
          child: Container(
            color: Colors.green,
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
