import 'package:flutter/material.dart';



import '../Samples/SampleButtonPopUp.dart';
import '../Samples/SampleButtonToDropDown.dart';
import 'Button_to_multi_case.dart';
import 'MyFunctions.dart';
import 'Screen_code_sniffets.dart';

class Screen_development extends StatefulWidget {
  const Screen_development({Key? key}) : super(key: key);

  @override
  State<Screen_development> createState() => _Screen_developmentState();
}

class _Screen_developmentState extends State<Screen_development> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black_undefined,
      body:  Screen_code_sniffets(),
    );
  }
}
