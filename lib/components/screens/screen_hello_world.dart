import 'package:flutter/material.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

class ScreenPracticeHelloWorld extends StatelessWidget {
  const ScreenPracticeHelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body:   Center(
        child: Text(MyMents.helloWorld, style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
