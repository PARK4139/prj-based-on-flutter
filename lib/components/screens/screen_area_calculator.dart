import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/super_helper.dart';



class ScreenAreaCalculator extends StatefulWidget {
  const ScreenAreaCalculator({Key? key}) : super(key: key);

  @override
  State<ScreenAreaCalculator> createState() => _ScreenAreaCalculatorState();
}

class _ScreenAreaCalculatorState extends State<ScreenAreaCalculator> {
  String userInput = '';
  String result = '';

  late bool isUnitSquaredMeter;

  late TextEditingController textEditingController;

  int buildMethodCounter = 0;
  late Color rainbowColor;
  List<Color> colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple];

  late Timer changeTextColorScheduler;
  late bool isUpperCaseMode;
  late bool isIconColorToogled;

  final clearButtonKey = GlobalKey();
  late Timer autoClickScheduler;
  late bool isFirstBuild;

  @override
  void initState() {
    isFirstBuild = true;
    initIsUnitSquaredMeter();
    initTextEditingController();
    initRainbowColor();
    initChangeTextColorScheduler();
    super.initState();
  }


  @override
  void dispose() { autoClickScheduler.cancel();
    changeTextColorScheduler.cancel();
    textEditingController.dispose();

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
          Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.all(2.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 5000), content: Text(MyMents.descriptionAboutAreaCalculatingService)));
                        });
                      },
                      icon: const Icon(Icons.android, color: Colors.lightBlueAccent),
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
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 5000), content: Text(MyMents.descriptionAboutAreaCalculatingService)));
                        });
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          toogleIsUnitSquaredMeterState();
                        });
                      },
                      icon: isUnitSquaredMeter ? const Icon(Icons.published_with_changes, color: Colors.deepOrangeAccent) : const Icon(Icons.published_with_changes, color: Colors.lightGreenAccent),
                      tooltip: "㎡ <-> 평",
                    ),
                    Form(
                      //하위 TextFormField에 대한 상태를 관리할 수 있는 위젯
                      child: TextFormField(
                        controller: textEditingController,
                        //initialValue: '', // TextFormField에서 initialValue 설정하면 textEditingController 사용불가.
                        cursorColor: Colors.blueAccent,
                        style: TextStyle(color: rainbowColor, fontSize: 30),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            labelText: isUnitSquaredMeter ? '㎡' : '평',
                            floatingLabelAlignment: FloatingLabelAlignment.center,
                            labelStyle: TextStyle(
                              color: isUnitSquaredMeter ? Colors.deepOrangeAccent : Colors.lightGreenAccent,
                            ),
                            hintText: isUnitSquaredMeter ? 'ex )  3.3 / 58' : 'ex )  1 / 5 / 17 / 32',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 40),
                        // Icon(Icons.read_more),
                        const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                        const Icon(Icons.calculate_rounded, color: Colors.lightBlueAccent),
                        const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          result,
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 50.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ],
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
        userInput = text;
        result = '${(double.parse(text) / 3.3).toStringAsFixed(2)} 평';
        printWithoutError("onChanged: $result");
      } else {
        userInput = text;
        result = '${(double.parse(text) * 3.3).toStringAsFixed(2)} ㎡';
        printWithoutError("onChanged: $result");
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
        printWithoutError('textEditingController is empty');
      }
    });
  }

  void initChangeTextColorScheduler() {
    // timer = Timer.periodic(Duration(milliseconds: 1000), changeTextColor);//답답한
    // timer = Timer.periodic(Duration(milliseconds: 100), changeTextColor); //느린
    // timer = Timer.periodic(Duration(milliseconds: 80), changeTextColor); //
    changeTextColorScheduler = Timer.periodic(const Duration(milliseconds: 50), changeTextColor); //크리스마스
    // timer = Timer.periodic(Duration(milliseconds: 25), changeTextColor);  // 정신없는
    // timer = Timer.periodic(Duration(milliseconds: 20), changeTextColor);  // 광고용
  }

  void changeTextColor(Timer timer) {
    setState(() {
      if (buildMethodCounter == colors.length) {
        buildMethodCounter = 0;
      }
      rainbowColor = colors[buildMethodCounter];
      buildMethodCounter = buildMethodCounter + 1;
    });
  }

  void initRainbowColor() {
    setState(() {
      rainbowColor = Colors.pinkAccent;
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

    await Future.delayed(const Duration(milliseconds: 500));
    //add delay between up and down button

    GestureBinding.instance.handlePointerEvent(PointerUpEvent(
      position: Offset(x, y),
    ));
  }

  Future<void> hideAllSnackBar() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
