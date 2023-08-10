import 'package:flutter/material.dart';

import 'ScreenContextTest1of2.dart'; //  (4/4).

class ScreenContextTest2 extends StatefulWidget {
  const ScreenContextTest2({super.key});

  @override
  ScreenContextTest2State createState() => ScreenContextTest2State();
}

class ScreenContextTest2State extends State<ScreenContextTest2> {
  late ScreenContextTest1State parent; //  (3/4).

  @override
  void initState() {
    super.initState();

    /*로컬 스토리지 사용해서 상태 Read*/
    parent = context.findAncestorStateOfType<ScreenContextTest1State>()!; //  (2/4).
  }

  @override
  Widget build(BuildContext context) {

    parent.getParentFoo(foo: "foo"); //   (1/4).

    return const Placeholder();
  }
}

//flutter 자식위젯이 부모위젯의 메소드 기능 사용법 (x/4)
//※  부모의 상태 객체명이 _ 바로 시작하면 자동 완성 기능으로 import 코드 조각을 작성할 수 없다.
//이것은 _ 가 private 기능을 하기 때문에 안되는 것.따라서 애초에 import 를 하면 안된다.
//... 애초애 하면안되는 방법 같아 보이기도하다...함수의 공통 부분을 component 화 시켜서 외부파일로 만들어
// 외부파일로 부터 메소드를 가져다 쓰는 것이 맞아
