import 'package:flutter/material.dart';

//부모는 기능만 가지고 있으면 되고 특별히 할 일이 없다.
class Parent extends StatefulWidget {
  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  String getParentFoo({required String foo}) {
    return foo;
  }
}
