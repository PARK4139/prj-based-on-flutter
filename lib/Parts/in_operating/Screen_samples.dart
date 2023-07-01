import 'package:flutter/material.dart';

import '../simple_samples/SampleButtonGeneral.dart';
import '../simple_samples/SampleCheckBox.dart';
import '../simple_samples/SamplePopUpAlert.dart';
import '../simple_samples/SamplePopUpForm.dart';
import '../simple_samples/SampleToggle.dart';
import 'my_functions.dart';

class Screen_samples extends StatefulWidget {
  const Screen_samples({Key? key}) : super(key: key);

  @override
  State<Screen_samples> createState() => _Screen_pomodoState();
}

class _Screen_pomodoState extends State<Screen_samples> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_sample_sub(),
    );
  }
}

class Screen_sample_sub extends StatefulWidget {
  const Screen_sample_sub({Key? key}) : super(key: key);

  @override
  State<Screen_sample_sub> createState() => _Screen_sample_subState();
}

class _Screen_sample_subState extends State<Screen_sample_sub> {
  final ment = '해당 스크린에서는 Flutter Wiget Sample 템플릿을 육안으로 확인할 수 있도록 서비스를 제공합니다 \n\n'
      '＊"" : .';

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
          Container(
            color: Colors.lightBlueAccent.shade100,
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
                const Icon(Icons.android, color: Colors.lightBlueAccent),
                Text("$ment", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SampleToggle(),
          SampleCheckBox(),
          // SampleGridSystem1(),....안되는데 왜 안될까?
          // SampleGridSystem2(),....안되는데 왜 안될까?
          // SampleGridSystem(),
          SamplePopUpAlert(text: 'SamplePopUpAlert', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
          SamplePopUpForm(text: 'SamplePopUpForm', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
          SampleButtonGeneral(text: "SampleButtonGeneral", color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, background_color: MyColors.black_background, padding_vertical: 4, padding_horizontal: 4, border_radius: BorderRadius.circular(5)),
        ],
      ),
    );
  }
}
