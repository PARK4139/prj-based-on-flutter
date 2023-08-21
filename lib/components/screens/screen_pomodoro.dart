import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';


class ScreenPomodoro extends StatefulWidget {
  const ScreenPomodoro({Key? key}) : super(key: key);

  @override
  State<ScreenPomodoro> createState() => _ScreenPomodoroState();
}

class _ScreenPomodoroState extends State<ScreenPomodoro> {
  int counter = 0;
  List<int> inputs = [];
  bool showDecision = true;
  dynamic foo;

  void onClicked() {
    setState(() {
      counter = counter + 1;
      inputs.add(counter);
    });
  }

  @override
  void initState() {
    super.initState();
    foo = 0;
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenPomodoroHome(),
    );
  }
}

class ScreenPomodoroHome extends StatefulWidget {
  const ScreenPomodoroHome({Key? key}) : super(key: key);

  @override
  State<ScreenPomodoroHome> createState() => _ScreenPomodoroHomeState();
}

class _ScreenPomodoroHomeState extends State<ScreenPomodoroHome> {

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
  int count = 0;
  int screenSeconds = defaultSeconds;
  bool isRunning = false;
  bool isPaused = false;
  int pomodoros = 0;

  late Timer timer; //Dart 의 표준 built in library 중의 하나


  void onTick(Timer timer) {
    setState(() {
      screenSeconds = screenSeconds - 1;
      if (screenSeconds == 0) {
        pomodoros = pomodoros + 1;
        debugSomething("pomodoros$pomodoros",troubleShootingId: "20230811184110");
        isRunning = true;
        screenSeconds = defaultSeconds;
        debugSomething("ScreenSeconds$screenSeconds",troubleShootingId: "20230811184114");
        // print("___________"+___________.toString());
      }
    });
  }

  void resetStatus() {
    setState(() {
      timer.cancel();
      screenSeconds = defaultSeconds;
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
      backgroundColor: MyColors.black0xff181818,
      body: ListView(
        children: [
          ElevatedButton(
            child: Text(
              '뒤로가기'.toUpperCase(),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: <Widget>[
              const Icon(Icons.android, color: Colors.lightBlueAccent),
              Text(MyMents.descriptionAboutPomodoroService, style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              timeFormattingHelper(screenSeconds),
              style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 70, fontWeight: FontWeight.w100),
            ),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: resetAllPomodoro, child: const Text('ALL RESET', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20, fontWeight: FontWeight.w100))),
                  IconButton(color: Colors.lightBlueAccent, onPressed: togglePlayAndPause, iconSize: 90, icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline)),
                  TextButton(onPressed: resetStatus, child: const Text('CURRENT\nLAP\nRESET', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20, fontWeight: FontWeight.w100))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          const SizedBox(height: 30),
          Row(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Pomodoro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: Colors.white)),
                    Text('$pomodoros', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white38)),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }



  void togglePlayAndPause() {
    setState(() {
      if (isRunning == true) {
        isRunning = false;
        timer.cancel();
      } else {
        isRunning = true;
        timer = Timer.periodic(const Duration(seconds: 1), onTick); // onTick(); (x)   vs   onTick (o)
      }
    });
  }

  resetAllPomodoro() {
    setState(() {
      timer.cancel();
      screenSeconds = defaultSeconds;
      pomodoros = 0;
      isRunning = false;
    });
  }
}
