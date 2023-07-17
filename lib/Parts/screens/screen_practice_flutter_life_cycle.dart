import 'package:flutter/material.dart';

import '../helpers/my_superworkers.dart';

class ScreenPracticeFlutterStfulWigetLifeCycle extends StatefulWidget {
  // ScreenPracticeFlutterLifeCycle();
  //
  // const ScreenPracticeFlutterLifeCycle();

  // const ScreenPracticeFlutterLifeCycle({super.key});

  // const ScreenPracticeFlutterLifeCycle({Key? key}) : super(key: key);

  ScreenPracticeFlutterStfulWigetLifeCycle({Key? key}) : super(key: key) {
    printWithoutMkr(txt: "ScreenPracticeFlutterLifeCycle()//constructor");
  }

  @override
  State<ScreenPracticeFlutterStfulWigetLifeCycle> createState() {
    printWithoutMkr(txt: "createState()");
    return _ScreenPracticeFlutterStfulWigetLifeCycleState();
  }
}

class _ScreenPracticeFlutterStfulWigetLifeCycleState extends State<ScreenPracticeFlutterStfulWigetLifeCycle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printWithoutMkr(txt: "initState()");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    printWithoutMkr(txt: "didChangeDependencies()");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    printWithoutMkr(txt: "deactivate()");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    printWithoutMkr(txt: "dispose()");
  }

  @override
  void didUpdateWidget(covariant ScreenPracticeFlutterStfulWigetLifeCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    printWithoutMkr(txt: "didUpdateWidget()");
  }

  @override
  Widget build(BuildContext context) {
    printWithoutMkr(txt: "build()");
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
              "라이프 사이클을 테스트하기 위해\n콘솔을 변화를 확인하세요",
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
