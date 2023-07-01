import 'package:flutter/material.dart';

import 'Parent.dart'; //  (4/4).

class Child extends StatefulWidget {
  @override
  ChildState createState() => ChildState();
}

class ChildState extends State<Child> {
  late ParentState parent; //  (3/4).

  @override
  void initState() {
    super.initState();
    parent = context.findAncestorStateOfType<ParentState>()!; //  (2/4).
  }

  @override
  Widget build(BuildContext context) {
    parent.getParentFoo(foo: "foo"); //   (1/4).
    return Placeholder();
  }
}

//flutter 특정 부모 위젯의 메소드 기능 사용법
// import 'Parent.dart';// Communication Between Parent and Child from Parent function(4/4).
// late ParentState parent;// Communication Between Parent and Child from Parent function(3/4).
// parent = context.findAncestorStateOfType<ParentState>()!;// Communication Between Parent and Child from Parent function(2/4).
// parent.getParentFoo(foo: "foo");// Communication Between Parent and Child from Parent function(1/4).

//※  부모의 상태 위젯명이 _ 바로 시작하면 자동 완성 기능으로 import 코드 조각을 작성할 수 없다.
