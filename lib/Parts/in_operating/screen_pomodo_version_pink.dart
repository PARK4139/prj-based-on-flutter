import 'dart:async';

import 'package:flutter/material.dart';

import '../../main.dart';

class Screen_pomodo_ver_pink extends StatefulWidget {
  const Screen_pomodo_ver_pink({Key? key}) : super(key: key);

  @override
  State<Screen_pomodo_ver_pink> createState() => _Screen_pomodo_ver_pinkState();
}

class _Screen_pomodo_ver_pinkState extends State<Screen_pomodo_ver_pink> {
  int foo = 100000000;
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

  late Timer timer;

  late AppState parent;
  late bool isAndroid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getParentWigetState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            isAndroid ? const SizedBox(height: 23) : const SizedBox(height: 0),
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
                  Text("$ment", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(height: 30),
            SizedBox(height: 30),
            SizedBox(height: 30),
            Flexible(
              flex: 1,
              child: Container(
                child: Text(FormattingToMinuite(ScreenSeconds), style: TextStyle(color: Theme.of(context).cardColor, fontSize: 89, fontWeight: FontWeight.w600)),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: resetAllPomodoro,
                          child: Text(
                            'ALL RESET',
                            style: TextStyle(color: Theme.of(context).cardColor, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          color: Theme.of(context).cardColor,
                          onPressed: togglePlayAndPause,
                          iconSize: 120,
                          icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline, size: 60),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: resetStatus,
                          child: Text(
                            'CURRENT\nLAP\nRESET',
                            style: TextStyle(color: Theme.of(context).cardColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoro',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).textTheme.headline1!.color),
                        ),
                        Text(
                          '$pomodoros',
                          style: TextStyle(fontSize: 58, fontWeight: FontWeight.w600, color: Theme.of(context).textTheme.headline1!.color),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: true,
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

  void getParentWigetState() {
    parent = context.findAncestorStateOfType<AppState>()!;
    if (parent.platform == Platforms.Android) {
      isAndroid = true;
    } else {
      isAndroid = false;
    }
  }

  void onTick(Timer timer) {
    setState(() {
      ScreenSeconds = ScreenSeconds - 1;
      if (ScreenSeconds == 0) {
        // timer.cancel();//OPERATION
        pomodoros = pomodoros + 1;
        isRunning = true;
        ScreenSeconds = defaultSeconds;
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
}
