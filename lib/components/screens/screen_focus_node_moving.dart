import 'package:flutter/material.dart';


class ScreenFocusNodeMovingTest extends StatefulWidget {
  const ScreenFocusNodeMovingTest();

  @override
  _ScreenFocusNodeMovingTestState createState() => _ScreenFocusNodeMovingTestState();
}


class _ScreenFocusNodeMovingTestState extends State<ScreenFocusNodeMovingTest> {
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true, //시작 시 포커스의 위치
              focusNode: focusNode1,//포커스의 깃발이라고 생각이든다.
              textInputAction: TextInputAction.next, // 키보드의 next를 클릭함으로서 next TextField 로 이동.
            ),
             TextField(
              autofocus: false,
              focusNode: focusNode2,//포커스의 깃발이라고 생각이든다.
               textInputAction: TextInputAction.next, // 키보드의 next를 클릭함으로서 next TextField 로 이동.

             ),
             TextField(
              autofocus: false,
              focusNode: focusNode3,//포커스의 깃발이라고 생각이든다.
               textInputAction: TextInputAction.next, // 키보드의 next를 클릭함으로서 next TextField 로 이동.

             ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => focusNode1.requestFocus(),//focusNode1 으로 이동
        child: const Icon(Icons.golf_course),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}