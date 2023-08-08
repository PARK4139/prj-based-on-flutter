import 'package:flutter/material.dart';

//부모는 기능만 가지고 있으면 되고 특별히 할 일이 없다.
class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  String getParentFoo({required String foo}) {
    return foo;
  }
}
