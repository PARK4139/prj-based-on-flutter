import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenGetxTest(),
    );
  }
}

class ScreenGetxTest extends StatelessWidget {
  const ScreenGetxTest({super.key});//const ScreenGetxTest({... 에 대해서 android studio 가 해당코드 제안해줘서 작성했음.

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

            /*wigetTreeStateController를 통한 위젯트리 상태 메소드 호출*/
            GestureDetector(
              onTap: wigetTreeStateController.incrementCount2,
              child: const Text('incrementCount2()',style: TextStyle(color: Colors.blueAccent)),
            ),

            /*GetBuilder() 위젯을 통한 위젯트리 상태 read*/
            GetBuilder<WigetTreeStateController>(
              init: WigetTreeStateController(),
              builder: (_) => Text(
                'count1: ${_.count1}',style: const TextStyle(color: Colors.white70),
              ),
            ),

            /*GetX() 위젯을 통한 위젯트리 상태 read*/
            GetX<WigetTreeStateController>(
              builder: (_) => Text(
                'count2: ${_.count2.value}',style: const TextStyle(color: Colors.white70),
              ),
            ),

            /*Obx() 위젯을 통한 위젯트리 상태 read(개인적인 개발자 경험으론 제일 마음에 든다.)*/
            Obx(() {
              return Text(
                'count2: ${wigetTreeStateController.count2.value}',style: const TextStyle(color: Colors.white70),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class WigetTreeStateController extends GetxController {
  var count1 = 0;
  var count2 = 0.obs;
  // var count2 = Rx<int>(0);
  // var count2 = RxInt(0);

  void incrementCount1() {
    count1++;
    update();
  }

  void incrementCount2() => count2.value++;


  @override
  void onInit() { //void onInit() 뭔가 상태변화 감지에 대한 이벤트 같아 보인다.
    super.onInit();
    once(count2, (_) {
      print('$_이 처음으로 변경되었습니다.');
    });
    ever(count2, (_) {
      print('$_이 변경되었습니다.');
    });
    debounce(
      count2,
          (_) {
        print('$_가 마지막으로 변경된 이후, 1초간 변경이 없습니다.');
      },
      time: Duration(seconds: 1),
    );
    interval(
      count2,
          (_) {
        print('$_가 변경되는 중입니다.(1초마다 호출)');
      },
      time: Duration(seconds: 1),
    );
  }
}
