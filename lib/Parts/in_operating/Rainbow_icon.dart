import 'dart:async';

import 'package:flutter/material.dart';

//내가 수집한 텍스트들
class Rainbow_icon extends StatefulWidget {
  IconData iconData;
  final Color? color;
  final FontWeight? font_weight;
  TextAlign? text_align;
  var text_decoration;
  var icon_text_decoration;
  var font_style;
  final double? icon_size;
  var icon_weight;
  bool? isRainbowMode;
  bool? isUpperCaseMode;

  Rainbow_icon({
    Key? key,
    required this.iconData,
    this.color = Colors.lightGreenAccent,
    this.icon_size,
    this.font_weight,
    this.isRainbowMode,
    this.isUpperCaseMode = true,
    this.text_align = null,
    this.text_decoration,
    this.icon_text_decoration,
    this.font_style,
  }) : super(key: key);

  @override
  State<Rainbow_icon> createState() => _Rainbow_iconState();
}

class _Rainbow_iconState extends State<Rainbow_icon> {
  int buildMethodCounter = 0;
  late Color color;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer? timer;
  late bool isUpperCaseMode;

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
    if (widget.isRainbowMode == false) {
      timer = null;
    } else {
      // timer = Timer.periodic(Duration(milliseconds: 1000), changeTextColor);//답답한
      // timer = Timer.periodic(Duration(milliseconds: 100), changeTextColor); //느린
      // timer = Timer.periodic(Duration(milliseconds: 80), changeTextColor); //
      timer = Timer.periodic(Duration(milliseconds: 50), changeTextColor); //크리스마스
      // timer = Timer.periodic(Duration(milliseconds: 25), changeTextColor);  // 정신없는
      // timer = Timer.periodic(Duration(milliseconds: 20), changeTextColor);  // 광고용
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
      size: widget.icon_size,
      weight: widget.icon_weight,
      textDirection: widget.icon_text_decoration,
    );
  }
}
