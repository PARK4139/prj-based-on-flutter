import 'package:flutter/material.dart';

class ScreenLateralBars extends StatefulWidget {
  const ScreenLateralBars({super.key});

  @override
  State<ScreenLateralBars> createState() => _ScreenLateralBarsState();
}

class _ScreenLateralBarsState extends State<ScreenLateralBars> {
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
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
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
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
                  children: [
                    Container(height: 25, width: 25, color: Colors.red),
                    Container(height: 25, width: 25, color: Colors.orange),
                    Container(height: 25, width: 25, color: Colors.yellow),
                    Container(height: 25, width: 25, color: Colors.green),
                    Container(height: 25, width: 25, color: Colors.blue),
                    Container(height: 25, width: 25, color: Colors.purple),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
