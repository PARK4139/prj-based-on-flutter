import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/super_worker.dart';

class ScreenDigitalClock extends StatefulWidget {
  const ScreenDigitalClock({Key? key}) : super(key: key);

  @override
  State<ScreenDigitalClock> createState() => _ScreenDigitalClockState();
}

class _ScreenDigitalClockState extends State<ScreenDigitalClock> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenClockSub(),
    );
  }
}

class ScreenClockSub extends StatefulWidget {
  const ScreenClockSub({Key? key}) : super(key: key);

  @override
  State<ScreenClockSub> createState() => _ScreenClockSubState();
}

class _ScreenClockSubState extends State<ScreenClockSub> {
  final ment = '해당 스크린에서는 오늘 날짜와 현재 시간을 제공하는 서비스를 제공합니다. \n\n'
      '＊"" : .';
  late Timer timer; //Dart 의 표준 built in library 중의 하나

  late final String? platform;

  late final String? currentOperatingEnvironment;

  late DateTime currentTime = DateTime.now();

  void onTick(Timer timer) {
    setState(() {
      initCurrentTime();
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackUndefined,
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
          Column(
            children: <Widget>[
              Icon(Icons.android, color: Colors.pinkAccent.shade100),
              Text(ment, style: TextStyle(color: Colors.pinkAccent.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
            ],
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
                      '$currentTime',
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
    currentTime = DateTime.now();
  }
}
