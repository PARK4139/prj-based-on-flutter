import 'package:flutter/material.dart';

class CircleBoxMaker extends StatefulWidget {
  late Widget item;


  CircleBoxMaker({required this.item});

  @override
  State<CircleBoxMaker> createState() => _StripedBoxMakerState();
}

class _StripedBoxMakerState extends State<CircleBoxMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        // borderRadius: BorderRadius.circular(100),
        shape: BoxShape.circle,
      ),
      child: widget.item,
    );
  }
}