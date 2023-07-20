import 'dart:async';

import 'package:flutter/material.dart';


class RainbowIconMaker extends StatefulWidget {
  IconData iconData;
  final Color? color;
  final FontWeight? fontWeight;
  TextAlign? textAlign;
  var textDecoration;
  var textDirection;
  var fontStyle;
  final double? iconSize;
  var iconWeight;
  bool? isRainbowMode;
  bool? isUpperCaseMode;

  RainbowIconMaker({
    Key? key,
    required this.iconData,
    this.color = Colors.lightGreenAccent,
    this.iconSize,
    this.fontWeight,
    this.isRainbowMode,
    this.isUpperCaseMode = true,
    this.textAlign,
    this.textDecoration,
    this.textDirection,
    this.fontStyle,
  }) : super(key: key);

  @override
  State<RainbowIconMaker> createState() => _RainbowIconMakerState();
}

class _RainbowIconMakerState extends State<RainbowIconMaker> {
  int buildMethodCounter = 0;
  late Color color;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer? timer;
  late bool isUpperCaseMode;

  late int RainbowdimmingMilliSeconds;

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
    RainbowdimmingMilliSeconds = 100;
    if (widget.isRainbowMode == false) {
      timer = null;

    } else {
      timer = Timer.periodic(Duration(milliseconds: RainbowdimmingMilliSeconds), changeTextColor);
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
