import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'WigetTreeStateController.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenGetxTest(),
    );
  }
}

class ScreenGetxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Getx 를 통한 wiget 간 통신 준비*/
    final wigetTreeStateController = Get.put(WigetTreeStateController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*wigetTreeStateController를 통한 위젯트리 상태 메소드 호출*/
            GestureDetector(
              onTap: wigetTreeStateController.incrementCount1,
              child: const Text('incrementCount1()',style: TextStyle(color: Colors.blueAccent)),
            ),

            GestureDetector(
              onTap: wigetTreeStateController.incrementCount2,
              child: const Text('incrementCount2()',style: TextStyle(color: Colors.blueAccent)),
            ),

            /*GetBuilder() 위젯을 통한 위젯트리 상태 read*/
            GetBuilder<WigetTreeStateController>(
              init: WigetTreeStateController(),
              builder: (_) => Text(
                'count1: ${_.count1}',style: TextStyle(color: Colors.white70),
              ),
            ),

            /*GetX() 위젯을 통한 위젯트리 상태 read*/
            GetX<WigetTreeStateController>(
              builder: (_) => Text(
                'count2: ${_.count2.value}',style: TextStyle(color: Colors.white70),
              ),
            ),

            /*Obx() 위젯을 통한 위젯트리 상태 read(개인적인 개발자 경험으론 제일 마음에 든다.)*/
            Obx(() {
              return Text(
                'count2: ${wigetTreeStateController.count2.value}',style: TextStyle(color: Colors.white70),
              );
            }),
          ],
        ),
      ),
    );
  }
}
