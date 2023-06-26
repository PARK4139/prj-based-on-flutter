import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/Screen_area_calculation_ver_orange_android.dart';

import 'Rainbow_icon.dart';
import 'Screen_area_calculator.dart';
import 'Screen_colorful.dart';

class Screen_to_first_take extends StatefulWidget {
  const Screen_to_first_take({Key? key}) : super(key: key);

  @override
  State<Screen_to_first_take> createState() => _Screen_to_first_takeState();
}

class _Screen_to_first_takeState extends State<Screen_to_first_take> {

  @override
  Widget build(BuildContext context) {
    // return Screen_colorful();
    // return Screen_area_calculation_ver_orange_android();
    return Scaffold(body: Rainbow_icon(iconData: Icons.adb));
  }
}
