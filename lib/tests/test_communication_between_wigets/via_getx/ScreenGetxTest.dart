import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';

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
  const ScreenGetxTest({super.key}); //const ScreenGetxTest({... 에 대해서 android studio 가 해당코드 제안해줘서 작성했음.

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
              child: const Text('incrementCount1()', style: TextStyle(color: Colors.blueAccent)),
            ),

            /*wigetTreeStateController를 통한 위젯트리 상태 메소드 호출*/
            GestureDetector(
              onTap: wigetTreeStateController.incrementCount2,
              child: const Text('incrementCount2()', style: TextStyle(color: Colors.blueAccent)),
            ),

            /*wigetTreeStateController를 통한 위젯트리 상태 메소드 호출*/
            GestureDetector(
              onTap: wigetTreeStateController.incrementCount3,
              child: const Text('incrementCount3()', style: TextStyle(color: Colors.blueAccent)),
            ),

            /*GetBuilder() 위젯을 통한 위젯트리 상태 read*/
            GetBuilder<WigetTreeStateController>(
              init: WigetTreeStateController(),
              builder: (_) => Text(
                'count1: ${_.count1}',
                style: const TextStyle(color: Colors.white70),
              ),
            ),

            /*GetX() 위젯을 통한 위젯트리 상태 read*/
            GetX<WigetTreeStateController>(
              builder: (_) => Text(
                'count2: ${_.count2.value}',
                style: const TextStyle(color: Colors.white70),
              ),
            ),

            /*Obx() 위젯을 통한 위젯트리 상태 read(개인적인 개발자 경험으론 제일 마음에 든다.)*/
            Obx(() {
              return Text(
                'count3: ${wigetTreeStateController.count3.value}',
                style: const TextStyle(color: Colors.white70),
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
  var count3 = 0.obs;

  // var count2 = Rx<int>(0);
  // var count2 = RxInt(0);

  void incrementCount1() {
    count1++;
    update();
  }

  void incrementCount2() => count2.value++;

  void incrementCount3() => count3.value++;

  @override
  void onInit() {  //void onInit() 뭔가 상태변화 감지에 대한 이벤트 같아 보인다. bloC의 emit()을 개발자가 의도적으로 작성하는 부분을 자동화시킨 것 같아 보인다.
    super.onInit();
    once(count3, (_) {
      debugSomething('$_ once');//count3 가 처음으로 상태변경이 되었을때 감지
    });
    ever(count3, (_) {
      debugSomething('$_ ever');//count3 가 상태변경이 되었을때 계속 감지, 제일 많이 사용하게 될 것 같다.
    });
    debounce(count3, (_) {
      debugSomething('$_ debounce');//count3 가 상태변경 마지막 변경한 시간을 기점으로 5초간 변경이 없을 때 실행.
    }, time: const Duration(seconds: 5));
    interval(count3, (_) {
      debugSomething('$_ interval');//count3 의 상태변경 관계없이 버튼 클릭기점 10초 후 실행? 이거 약간 독특한 걸 수 있다. 초기 버튼 클릭 시간을 기점을 10 초 이내에 버튼을 다시 누르면 10초에 대한 시작 기점이 초기 버튼 클릭 시간인지, 신규 버튼 클릭 시간인지 확인이 필요하다.(초단위로 시간을 출력하는 코드를 추가해 테스트 해볼 수 있겠다.쓸일 있을 때 테스트해보자)
    }, time: const Duration(seconds: 10));
  }



}
