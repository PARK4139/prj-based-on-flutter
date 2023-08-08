import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '포커스 노드 이동 연습',
      home: _ScreenFocusNodeMoving(),
    );
  }
}
class _ScreenFocusNodeMoving extends StatefulWidget {
  const _ScreenFocusNodeMoving();

  @override
  _ScreenFocusNodeMovingState createState() => _ScreenFocusNodeMovingState();
}


class _ScreenFocusNodeMovingState extends State<_ScreenFocusNodeMoving> {
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
            ),
             TextField(
              autofocus: false,
              focusNode: focusNode2,//포커스의 깃발이라고 생각이든다.
            ),
             TextField(
              autofocus: false,
              focusNode: focusNode3,//포커스의 깃발이라고 생각이든다.
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => focusNode1.requestFocus(),
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}