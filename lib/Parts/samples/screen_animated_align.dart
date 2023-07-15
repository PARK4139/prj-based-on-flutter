import 'package:flutter/material.dart';

class ScreenAnimatedAlign extends StatefulWidget {
  @override
  _ScreenAnimatedAlignState createState() => _ScreenAnimatedAlignState();
}

class _ScreenAnimatedAlignState extends State<ScreenAnimatedAlign> {
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
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: AnimatedAlign(
                  alignment: alignment,
                  duration: Duration(milliseconds: 100),
                  child: FlutterLogo(size: 100),
                ),
              ),
              InkWell(
                child: Text('위젯배열토글',style: TextStyle(color: Colors.blueAccent)),
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