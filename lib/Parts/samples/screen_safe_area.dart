import 'package:flutter/material.dart';

class ScreenSafeArea extends StatefulWidget {
  const ScreenSafeArea({super.key});

  @override
  State<ScreenSafeArea> createState() => _ScreenSafeAreaState();
}

class _ScreenSafeAreaState extends State<ScreenSafeArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          color: Colors.black,
          // width: 50,
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,//Column의 자식 위젯들을 가로로 늘릴수 있다
            // mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
            mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
