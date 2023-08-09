import 'package:flutter/material.dart';

//부모는 기능만 가지고 있으면 되고 특별히 할 일이 없다.
class ScreenContextTest1 extends StatefulWidget {
  const ScreenContextTest1({super.key});

  @override
  ScreenContextTest1State createState() => ScreenContextTest1State();
}

class ScreenContextTest1State extends State<ScreenContextTest1> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  String getParentFoo({required String foo}) {
    return foo;
  }
}
