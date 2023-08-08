import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';


class ScreenClock extends StatefulWidget {
  const ScreenClock({Key? key}) : super(key: key);

  @override
  State<ScreenClock> createState() => _ScreenClockState();
}

class _ScreenClockState extends State<ScreenClock> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreenDigitalClockSub(),
    );
  }
}

class ScreenDigitalClockSub extends StatefulWidget {
  const ScreenDigitalClockSub({Key? key}) : super(key: key);

  @override
  State<ScreenDigitalClockSub> createState() => _ScreenDigitalClockSubState();
}

class _ScreenDigitalClockSubState extends State<ScreenDigitalClockSub> {
  late Timer tickTimer;
  late final String? platform;

  late DateTime now = DateTime.now();

  final clearButtonKey = GlobalKey();
  late Timer autoClickScheduler;
  late bool isFirstBuild;

  @override
  void initState() {
    super.initState();
    tickTimer = Timer.periodic(const Duration(seconds: 1), onTick);

    isFirstBuild = true;
  }

  @override
  void dispose() {
    tickTimer.cancel();
    autoClickScheduler.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    autoClickScheduler = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (isFirstBuild == true) {
          autoClick();
          isFirstBuild = false;
        }
        autoClickScheduler.cancel();
      },
    );

    return Scaffold(
      backgroundColor: MyColors.blackUndefined,
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 5000), content: Text(MyMents.thisAppServeCurrentTime)));
                  },
                  icon: Icon(Icons.android, color: Colors.pinkAccent.shade100)),
            ],
          ),
          /*버튼(버튼 클릭 시 5초 뒤 사라질 팝업 실행)*/ InkWell(
            key: clearButtonKey,
            child: const Row(
              children: [
                Text('사용자에게 보이지 않을 버튼', style: TextStyle(color: Colors.white, fontSize: 1)),
              ],
            ),
            onTap: () {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 3000), content: Text(MyMents.thisAppServeCurrentTime)));
              });
            },
          ),
          const SizedBox(height: 180),
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
                        '$now',
                        style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 40, fontWeight: FontWeight.w100),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTick(Timer timer) {
    setState(() {
      now = DateTime.now();
      debugSomething(now.toString(),troubleShootingId: "now20230807090514");
    });
  }


  Future<void> autoClick() async {
    RenderBox renderbox = clearButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;

    GestureBinding.instance.handlePointerEvent(PointerDownEvent(
      position: Offset(x, y),
    ));

    await Future.delayed(const Duration(milliseconds: 100));
    //add delay between up and down button

    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      position: Offset(x, y),
    ));
  }
}
