import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/my_superworkers.dart';




class Screen_area_calculator extends StatefulWidget {
  const Screen_area_calculator({Key? key}) : super(key: key);

  @override
  State<Screen_area_calculator> createState() => _Screen_area_calculatorState();
}

class _Screen_area_calculatorState extends State<Screen_area_calculator> {
  final Title = '평형 계산기';
  final ment = '평형 계산기는 *"평" 과 ㎡(제곱미터) 간 단위변환 한 결과를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"평" : 한국에서 사용하는 집의 면적에 대한 단위입니다.\n               해당 단위는 점차 ㎡ 로 대체되고 있습니다.';
  String user_input = '';
  String result = '';
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  late bool isUnitSquaredMeter;

  late TextEditingController textEditingController;

  int buildMethodCounter = 0;
  late Color Rainbow_color;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer timer;
  late bool isUpperCaseMode;
  late bool isIconColorToogled;

  @override
  void initState() {
    super.initState();
    initIsUnitSquaredMeter();
    initTextEditingController();
    initRainbowColor();
    initTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black_undefined,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.all(2.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
                      Icon(Icons.android, color: Colors.lightBlueAccent),
                      Text("$ment", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 10, fontWeight: FontWeight.w600)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            toogleIsUnitSquaredMeterState();
                          });
                        },
                        icon: isUnitSquaredMeter ? Icon(Icons.published_with_changes, color: Colors.deepOrangeAccent) : Icon(Icons.published_with_changes, color: Colors.lightGreenAccent),
                        tooltip: "㎡ <-> 평",
                      ),
                      Form(
                        //하위 TextFormField에 대한 상태를 관리할 수 있는 위젯
                        child: TextFormField(
                          controller: textEditingController,
                          //initialValue: '', // TextFormField에서 initialValue 설정하면 textEditingController 사용불가.
                          cursorColor: Colors.blueAccent,
                          style: TextStyle(color: Rainbow_color, fontSize: 30),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: isUnitSquaredMeter ? '㎡' : '평',
                              floatingLabelAlignment: FloatingLabelAlignment.center,
                              labelStyle: TextStyle(
                                color: isUnitSquaredMeter ? Colors.deepOrangeAccent : Colors.lightGreenAccent,
                              ),
                              hintText: isUnitSquaredMeter ? 'ex )  3.3 / 58' : 'ex )  1 / 5 / 17 / 32',
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.blueGrey,
                              focusColor: Colors.blueAccent,
                              hoverColor: Colors.blueAccent,
                              iconColor: Colors.blueAccent,
                              prefixIconColor: Colors.blueAccent,
                              suffixIconColor: Colors.blueAccent),

                          onChanged: (text) {
                            setState(() {
                              serveCalculatingLogic(text);
                            });
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            // Icon(Icons.read_more),
                            const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                            const Icon(Icons.calculate_rounded, color: Colors.lightBlueAccent),
                            const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "$result",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 50.0,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void toogleIsUnitSquaredMeterState() {
    setState(() {
      textEditingController.text = "";
      result = "";
      if (isUnitSquaredMeter == true) {
        isUnitSquaredMeter = false;
      } else {
        isUnitSquaredMeter = true;
      }
    });
  }

  void serveCalculatingLogic(var text) {
    setState(() {
      if (isUnitSquaredMeter == true) {
        user_input = text;
        result = (double.parse(text) / 3.3).toStringAsFixed(2) + ' ' + '평';
        print("onChanged: ${result}");
      } else {
        user_input = text;
        result = (double.parse(text) * 3.3).toStringAsFixed(2) + ' ' + '㎡';
        print("onChanged: ${result}");
      }
    });
  }

  void initIsUnitSquaredMeter() {
    setState(() {
      isUnitSquaredMeter = false;
    });
  }

  void initTextEditingController() {
    setState(() {
      textEditingController = TextEditingController(text: "");
      if (textEditingController.text.isEmpty) {
        print('textEditingController is empty');
      }
      if (textEditingController.text == null) {
        print('textEditingController is null');
      }
    });
  }

  void initTimer() {
    // timer = Timer.periodic(Duration(milliseconds: 1000), changeTextColor);//답답한
    // timer = Timer.periodic(Duration(milliseconds: 100), changeTextColor); //느린
    // timer = Timer.periodic(Duration(milliseconds: 80), changeTextColor); //
    timer = Timer.periodic(Duration(milliseconds: 50), changeTextColor); //크리스마스
    // timer = Timer.periodic(Duration(milliseconds: 25), changeTextColor);  // 정신없는
    // timer = Timer.periodic(Duration(milliseconds: 20), changeTextColor);  // 광고용
  }

  void changeTextColor(Timer timer) {
    setState(() {
      if (buildMethodCounter == colors.length) {
        buildMethodCounter = 0;
      }
      Rainbow_color = colors[buildMethodCounter];
      buildMethodCounter = buildMethodCounter + 1;
    });
  }

  void initRainbowColor() {
    setState(() {
      Rainbow_color = Colors.pinkAccent;
    });
  }
}
