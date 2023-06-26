import 'dart:async';
import 'package:flutter/material.dart';

//내가 수집한 텍스트들
class Rainbow_text extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  TextAlign? text_align;
  var text_decoration;
  var font_family;
  var font_style;
  final double? font_size;

  bool? isRainbowMode;
  bool? isUpperCaseMode;

  Rainbow_text({
    Key? key,
    required this.text,
    required this.color,
    required this.font_size,
    required this.font_weight,
    this.isRainbowMode,
    // this.isUpperCaseMode = false,
    this.isUpperCaseMode = true,
    this.text_align = null,
    this.text_decoration,
    this.font_family,
    this.font_style,
  }) : super(key: key);

  @override
  State<Rainbow_text> createState() => _Rainbow_textState();
}

class _Rainbow_textState extends State<Rainbow_text> {
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
    // TODO: implement initState
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
    if (widget.isUpperCaseMode == true) {
      isUpperCaseMode =true;
    }else{
      isUpperCaseMode =false;
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
    return Text(
      isUpperCaseMode ? widget.text.toUpperCase() : widget.text,
      style: TextStyle(color: color, fontSize: widget.font_size, fontWeight: widget.font_weight, decoration: widget.text_decoration, fontFamily: widget.font_family, fontStyle: widget.font_style),
      textAlign: widget.text_align,
    );
  }
}
