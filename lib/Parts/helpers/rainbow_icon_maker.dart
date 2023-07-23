import 'dart:async';

import 'package:flutter/material.dart';


class RainbowIconMaker extends StatefulWidget {
  IconData iconData;
  final Color? color;
  final FontWeight? fontWeight;
  TextAlign? textAlign;
  TextDirection textDirection;
  final double? iconSize;
  double iconWeight;
  bool? isRainbowMode;
  bool? isUpperCaseMode;

  @override
  State<RainbowIconMaker> createState() => _RainbowIconMakerState();

  RainbowIconMaker({
    Key? key,
    required this.iconData,
    this.color = Colors.lightGreenAccent,
    this.iconSize,
    this.fontWeight,
    this.isRainbowMode,
    this.isUpperCaseMode = true,
    this.textAlign,
    this.iconWeight=5.0,
    // this.textDecoration,
    this.textDirection=TextDirection.ltr,
    // this.fontStyle,
  }) : super(key: key);
}

class _RainbowIconMakerState extends State<RainbowIconMaker> {
  int buildMethodCounter = 0;
  late Color color;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer? timer;
  late bool isUpperCaseMode;

  late int rainbowdimmingMilliSeconds;

  // Future<void> changeTextColor (Timer timer) async {
  void changeTextColor(Timer timer) {
    if (buildMethodCounter == colors.length) {
      buildMethodCounter = 0;
    }
    color = colors[buildMethodCounter];
    buildMethodCounter = buildMethodCounter + 1;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    color = widget.color!;
    // RainbowdimmingMilliSeconds = 1000;
    // RainbowdimmingMilliSeconds = 500;
    // RainbowdimmingMilliSeconds = 250;
    rainbowdimmingMilliSeconds = 100;
    if (widget.isRainbowMode == false) {
      timer = null;

    } else {
      timer = Timer.periodic(Duration(milliseconds: rainbowdimmingMilliSeconds), changeTextColor);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.iconData,
      color: color,
      size: widget.iconSize,
      weight: widget.iconWeight,
      textDirection: widget.textDirection,

    );
  }
}
