import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';



class ScreenPracticeFlutterStfulWigetLifeCycle extends StatefulWidget {
  // ScreenPracticeFlutterLifeCycle();
  //
  // const ScreenPracticeFlutterLifeCycle();

  // const ScreenPracticeFlutterLifeCycle({super.key});

  // const ScreenPracticeFlutterLifeCycle({Key? key}) : super(key: key);

  ScreenPracticeFlutterStfulWigetLifeCycle({Key? key}) : super(key: key) {
    debugSomething("", troubleShootingId: "ScreenPracticeFlutterLifeCycle()");
  }

  @override
  // ignore: no_logic_in_create_state
  State<ScreenPracticeFlutterStfulWigetLifeCycle> createState() {
    debugSomething("", troubleShootingId: "createState()"); //원래 createState() 안에는 return 문 외에는 작성이 되어 있어서는 안된다. 그러나 테스트르 위해서 예외처리
    return _ScreenPracticeFlutterStfulWigetLifeCycleState();
  }
}

class _ScreenPracticeFlutterStfulWigetLifeCycleState extends State<ScreenPracticeFlutterStfulWigetLifeCycle> {
  @override
  void initState() {
    super.initState();
    debugSomething("", troubleShootingId: "initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugSomething("", troubleShootingId: "didChangeDependencies()");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugSomething("", troubleShootingId: "deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    debugSomething("", troubleShootingId: "dispose()");
  }

  @override
  void didUpdateWidget(covariant ScreenPracticeFlutterStfulWigetLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugSomething("", troubleShootingId: "didUpdateWidget()");
  }

  @override
  Widget build(BuildContext context) {
    debugSomething("", troubleShootingId: "build()");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        leading: /*뒤로가기 버튼*/ InkWell(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: InkWell(
          child: const Center(
            child: Text(
              "라이프 사이클을 테스트하기 위해\n콘솔의 변화를 확인하세요",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
