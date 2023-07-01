import 'dart:async';

import 'package:flutter/material.dart';

import 'my_functions.dart';

class Screen_digital_clock extends StatefulWidget {
  const Screen_digital_clock({Key? key}) : super(key: key);

  @override
  State<Screen_digital_clock> createState() => _Screen_digital_clockState();
}

class _Screen_digital_clockState extends State<Screen_digital_clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_clock_sub(),
    );
  }
}

class Screen_clock_sub extends StatefulWidget {
  const Screen_clock_sub({Key? key}) : super(key: key);

  @override
  State<Screen_clock_sub> createState() => _Screen_clock_subState();
}

class _Screen_clock_subState extends State<Screen_clock_sub> {
  final ment = '해당 스크린에서는 오늘 날짜와 현재 시간을 제공하는 서비스를 제공합니다. \n\n'
      '＊"" : .';
  late Timer timer; //Dart 의 표준 built in library 중의 하나

  late final String? platform;

  late final String? current_operating_environment;

  late DateTime CurrentTime = DateTime.now();

  void onTick(Timer timer) {
    setState(() {
      initCurrentTime();
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black_undefined,
      body: ListView(
        children: [
          Container(
            color: Colors.pinkAccent.shade100,
            child: TextButton(
              child: const Text('GO TO INDEX', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(Icons.android, color: Colors.pinkAccent.shade100),
                Text("$ment", style: TextStyle(color: Colors.pinkAccent.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      '$CurrentTime',
                      style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 40, fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center,
                    )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initCurrentTime() async {
    CurrentTime = await DateTime.now();
  }
}
