import 'package:flutter/material.dart';

class ScreenPracticeAnimatedAlign extends StatefulWidget {
  const ScreenPracticeAnimatedAlign({super.key});

  @override
  State<ScreenPracticeAnimatedAlign> createState() =>  _ScreenPracticeAnimatedAlignState();


}

class _ScreenPracticeAnimatedAlignState extends State<ScreenPracticeAnimatedAlign> {
  var alignment = Alignment.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading:  /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: AnimatedAlign(
                  alignment: alignment,
                  duration: const Duration(milliseconds: 100),
                  child: const FlutterLogo(size: 100),
                ),
              ),
              InkWell(
                child: const Text('위젯배열토글',style: TextStyle(color: Colors.blueAccent)),
                onTap: () {
                  setState(() {
                    alignment = alignment == Alignment.bottomLeft
                        ? Alignment.topRight
                        : Alignment.bottomLeft;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}