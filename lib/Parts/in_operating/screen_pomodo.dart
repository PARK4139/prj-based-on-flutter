import 'dart:async';

import 'package:flutter/material.dart';

import 'my_functions.dart';

class Screen_pomodo extends StatefulWidget {
  const Screen_pomodo({Key? key}) : super(key: key);

  @override
  State<Screen_pomodo> createState() => _Screen_pomodoState();
}

class _Screen_pomodoState extends State<Screen_pomodo> {
  int Counter = 0;
  List<int> inputs = [];
  bool show_decision = true;
  dynamic foo;

  void onClicked() {
    setState(() {
      Counter = Counter + 1;
      inputs.add(Counter);
    });
  }

  @override
  void initState() {
    super.initState();
    foo = 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen_pomodo_home(),
    );
  }
}

class screen_pomodo_home extends StatefulWidget {
  const screen_pomodo_home({Key? key}) : super(key: key);

  @override
  State<screen_pomodo_home> createState() => _screen_pomodo_homeState();
}

class _screen_pomodo_homeState extends State<screen_pomodo_home> {
  final ment = '해당 스크린에서는 pomodoro를 서비스를 제공합니다 \n\n'
      '＊"pomodoro" : 포모도로 기법은 프란체스코 시릴로가 고안한 시간 관리 기법입니다.\n 25분 동안 집중해서 일을 한 다음 5분간 휴식을 취하는 것을 반복하는 방식입니다.\n 이 기법은 25분을 토마토 모양의 요리용 타이머로 측정한 데서 이름이 유래했습니다.\n 포모도로 기법은 집중력 향상과 생산성 향상에 도움이 될 수 있습니다.';

  // static const defaultSeconds = 10; // DEVELOPMENT
  // static const defaultSeconds = 5; // DEVELOPMENT
  // static const defaultSeconds = 2; // DEVELOPMENT
  // static const defaultSeconds = 1; // DEVELOPMENT
  static const defaultSeconds = 1500; // OPERATION
  // static const defaultSeconds = 1500; // OPERATION
  // static const defaultSeconds = 3600 * 24 * 365; // OPERATION   1 year
  // static const defaultSeconds = 3600 * 24 * 30; // OPERATION   30 Days
  // static const defaultSeconds = 3600 * 24 * 7; // OPERATION   7 Days
  // static const defaultSeconds = 3600 * 24; // OPERATION   1 Day`
  // static const defaultSeconds = 3600; // OPERATION   1 hour
  // static const defaultSeconds = 1200; // OPERATION   30 MIN
  // static const defaultSeconds = 600; // OPERATION   10 MIN
  int Count = 0;
  int ScreenSeconds = defaultSeconds;
  bool isRunning = false;
  bool isPaused = false;
  int pomodoros = 0;

  late Timer timer; //Dart 의 표준 built in library 중의 하나
  late Timer timer2;

  void onTick(Timer timer) {
    setState(() {
      ScreenSeconds = ScreenSeconds - 1;
      if (ScreenSeconds == 0) {
        // timer.cancel();//OPERATION
        pomodoros = pomodoros + 1;
        print("pomodoros" + pomodoros.toString());
        isRunning = true;
        ScreenSeconds = defaultSeconds;
        print("ScreenSeconds" + ScreenSeconds.toString());
        // print("___________"+___________.toString());
      }
    });
  }

  void resetStatus() {
    setState(() {
      timer.cancel();
      ScreenSeconds = defaultSeconds;
      isRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();

    // onCountPer1Second(); //DEVELOPMENT // 화면 시작시 바로시작하도록
    // isRunning = true; //DEVELOPMENT // 화면 시작시 바로시작하도록
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black_undefined,
      body: ListView(
        children: [
          ElevatedButton(
            child: Text(
              'go to index'.toUpperCase(),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            child: Column(
              children: <Widget>[
                const Icon(Icons.android, color: Colors.lightBlueAccent),
                Text("$ment", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SizedBox(height: 30),
          SizedBox(height: 30),
          Container(
            child: Text(
              "${FormattingToMinuite(ScreenSeconds)}",
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 70, fontWeight: FontWeight.w100),
            ),
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(height: 30),
          SizedBox(height: 30),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  Container(child: TextButton(onPressed: resetAllPomodoro, child: Text('ALL RESET', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20, fontWeight: FontWeight.w100)))),
                  Container(child: IconButton(color: Colors.lightBlueAccent, onPressed: togglePlayAndPause, iconSize: 90, icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline))),
                  Container(child: TextButton(onPressed: resetStatus, child: Text('CURRENT\nLAP\nRESET', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20, fontWeight: FontWeight.w100)))),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(height: 30),
          Row(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Text('Pomodoro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: Colors.white)),
                    Text('$pomodoros', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white38)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  String FormattingToMinuite(int seconds) {
    var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
    // return duration.toString().split(".")[0];  // DEPRECATED FOR first IS MORE EXPLICTED EXPRESSION THAN [0].
    // print(duration.toString().split(".").first.split(":").first);
    if (duration.toString().split(".").first.split(":").first == '0') {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return duration.toString().split(".").first; //PRODUCTION
    }
  }

  void togglePlayAndPause() {
    setState(() {
      if (isRunning == true) {
        isRunning = false;
        timer.cancel();
      } else {
        isRunning = true;
        timer = Timer.periodic(Duration(seconds: 1), onTick); // onTick(); (x)   vs   onTick (o)
      }
    });
  }

  resetAllPomodoro() {
    setState(() {
      timer.cancel();
      ScreenSeconds = defaultSeconds;
      pomodoros = 0;
      isRunning = false;
    });
  }
}
