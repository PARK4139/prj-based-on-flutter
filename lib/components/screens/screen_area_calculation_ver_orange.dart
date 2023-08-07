import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/components/helpers/super_helper.dart';

class ScreenAreaCalculationVerOrangeAndroid extends StatefulWidget {
  const ScreenAreaCalculationVerOrangeAndroid({Key? key}) : super(key: key);

  @override
  State<ScreenAreaCalculationVerOrangeAndroid> createState() => _ScreenAreaCalculationVerOrangeAndroidState();
}

class _ScreenAreaCalculationVerOrangeAndroidState extends State<ScreenAreaCalculationVerOrangeAndroid> {
  final title = '평형 계산기';
  final ment = '평형 계산기는 *"평" 과 ㎡(제곱미터) 간 단위변환 한 결과를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"평" : 한국에서 사용하는 집의 면적에 대한 단위입니다.';
  String userInput = '';
  String result = '';
  late TextEditingController textEditingController;

  late bool isUnitSquaredMeter;

  @override
  void initState() {
    super.initState();
    initIsUnitSquaredMeter();
    initTextEditingController();
  }

  @override
  void dispose() {
    
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        // primaryColor: Colors.orangeAccent,
      ),
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.all(2.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: TextButton(
                      child: const Text('뒤로가기', style: TextStyle(color: Colors.greenAccent)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Icon(Icons.android, color: Colors.amber),
                  Text(ment, style: const TextStyle(color: Colors.greenAccent, fontSize: 12.5)),
                  IconButton(
                    onPressed: () {
                      toogleIsUnitSquaredMeterState();
                    },
                    icon: const Icon(Icons.published_with_changes),
                    tooltip: "㎡ <-> 평",
                  ),
                  Form(
                    //하위 TextFormField에 대한 상태를 관리할 수 있는 위젯
                    child: TextFormField(
                      controller: null,
                      initialValue: '',
                      cursorColor: Colors.orangeAccent,
                      style: const TextStyle(color: Colors.orangeAccent),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: isUnitSquaredMeter ? '㎡' : '평',
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        labelStyle: const TextStyle(
                          color: Colors.orangeAccent,
                        ),
                        hintText: isUnitSquaredMeter ? 'ex )  3.3 / 58' : 'ex )  1 / 5 / 17 / 32 / 48',
                        hintStyle: const TextStyle(
                          color: Colors.orangeAccent,
                        ),
                        fillColor: Colors.blueGrey,
                        focusColor: Colors.orangeAccent,
                        hoverColor: Colors.orangeAccent,
                        iconColor: Colors.orangeAccent,
                        prefixIconColor: Colors.orangeAccent,
                        suffixIconColor: Colors.orangeAccent,
                      ),
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
                      const Icon(Icons.arrow_downward_outlined, color: Colors.amberAccent),
                      const Icon(Icons.calculate_rounded, color: Colors.amberAccent),
                      const Icon(Icons.arrow_downward_outlined, color: Colors.amberAccent),
                      const SizedBox(height: 40),
                      Text(
                        result,
                        style: const TextStyle(
                          // color: Colors.cyanAccent,
                          color: Colors.amber,
                          fontSize: 20.0,
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
      ),
    );
  }

  void initIsUnitSquaredMeter() {
    isUnitSquaredMeter = false;
  }

  void initTextEditingController() {
    textEditingController = TextEditingController();
  }

  void toogleIsUnitSquaredMeterState() {
    setState(() {
      result = "";
      if (isUnitSquaredMeter == true) {
        isUnitSquaredMeter = false;
      } else {
        isUnitSquaredMeter = true;
      }
    });
  }

  void serveCalculatingLogic(var text) {
    if (isUnitSquaredMeter == true) {
      userInput = text;
      result = '${(double.parse(text) / 3.3).toStringAsFixed(2)} 평';
      printWithoutError("onChanged: $result");
    } else {
      userInput = text;
      result = '${(double.parse(text) * 3.3).toStringAsFixed(2)} ㎡';
      printWithoutError("onChanged: $result");
    }
  }
}
