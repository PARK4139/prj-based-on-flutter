import 'package:flutter/material.dart';

class SampleLayer extends StatefulWidget {
  const SampleLayer({super.key});

  @override
  State<SampleLayer> createState() => _SampleLayerState();
}

class _SampleLayerState extends State<SampleLayer> {
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
