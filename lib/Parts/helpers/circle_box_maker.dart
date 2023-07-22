import 'package:flutter/material.dart';

class CircleBoxHelper extends StatefulWidget {
  late Widget item;


  CircleBoxHelper({super.key, required this.item});

  @override
  State<CircleBoxHelper> createState() => _StripedBoxMakerState();
}

class _StripedBoxMakerState extends State<CircleBoxHelper> {
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