import 'package:flutter/material.dart';

class ScreenPracticeVerticalBar extends StatefulWidget {
  const ScreenPracticeVerticalBar({super.key});

  @override
  State<ScreenPracticeVerticalBar> createState() => _ScreenPracticeVerticalBarState();
}

class _ScreenPracticeVerticalBarState extends State<ScreenPracticeVerticalBar> {
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
        top: true,
        bottom: true,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.black,
                width: 50,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 50, width: 50, color: Colors.red),
                    Container(height: 50, width: 50, color: Colors.orange),
                    Container(height: 50, width: 50, color: Colors.yellow),
                    Container(height: 50, width: 50, color: Colors.green),
                    Container(height: 50, width: 50, color: Colors.blue),
                    Container(height: 50, width: 50, color: Colors.purple),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                width: 50,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.red)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.orange)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                width: 50,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.red)),
                    Expanded(flex: 2, child: Container(height: 50, width: 50, color: Colors.orange)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.yellow)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.green)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.blue)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                width: 50,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.red)),
                    Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.orange)),
                    Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.yellow)),
                    Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.green)),
                    Expanded(flex: 3, child: Container(height: 50, width: 50, color: Colors.blue)),
                    Expanded(flex: 1, child: Container(height: 50, width: 50, color: Colors.purple)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
