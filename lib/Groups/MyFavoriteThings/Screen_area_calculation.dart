import 'package:flutter/material.dart';

import 'MyFunctions.dart';

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
  String result2 = '';
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  // TextEditingController textEditingController = TextEditingController();
  // TextEditingController textEditingController2 = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // textEditingController.dispose();
    // textEditingController2.dispose();
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
                      const Icon(Icons.android, color: Colors.lightBlueAccent),
                      Text(
                        "$ment",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.9),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Form(
                        //하위 TextFormField에 대한 상태를 관리할 수 있는 위젯
                        child: TextFormField(
                          controller: null,
                          initialValue: '',
                          cursorColor: Colors.blueAccent,
                          style: TextStyle(color: Colors.blueAccent),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: '㎡',
                            floatingLabelAlignment: FloatingLabelAlignment.center,
                            labelStyle: TextStyle(
                              color: Colors.blueAccent,
                            ),
                            hintText: 'ex )  3.3 / 58',
                            hintStyle: TextStyle(
                              color: Colors.blueAccent,
                            ),
                            fillColor: Colors.blueGrey,
                            focusColor: Colors.blueAccent,
                            hoverColor: Colors.blueAccent,
                            iconColor: Colors.blueAccent,
                            prefixIconColor: Colors.blueAccent,
                            suffixIconColor: Colors.blueAccent,
                          ),
                          // validator: (value) {if (value!.isEmpty) {return '입력되지 않았네요.다시 작성해주세요.';}return null;},
                          onChanged: (text) {
                            setState(() {
                              user_input = text;
                              print(user_input);
                              result = (double.parse(text) / 3.3).toStringAsFixed(2) + ' ' + '평';
                              print("onChanged: ${result}");
                            });
                          },
                          // onSaved: (value) {setState(() {result = ' ';});},
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            // Icon(Icons.read_more),
                            const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                            const Icon(Icons.calculate_rounded, color: Colors.lightBlueAccent),
                            const Icon(Icons.arrow_downward_outlined, color: Colors.lightBlueAccent),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "$result",
                              style: const TextStyle(
                                // color: Colors.cyanAccent,
                                color: Colors.lightBlueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w100,
                                backgroundColor: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: null,
                        initialValue: '',
                        style: TextStyle(color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.blueAccent,
                        decoration: const InputDecoration(
                          labelText: '평',
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          hintText: 'ex )  1 / 5 / 17 / 32 / 48',
                          hintStyle: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '입력되지 않았네요.다시 작성해주세요.';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {
                            user_input = text;
                            print(user_input);
                            result2 = (double.parse(text) * 3.3).toStringAsFixed(2) + ' ' + '㎡';
                            print("onChanged: ${result2}");
                          });
                        },
                        onTapOutside: (text) {
                          print("onTapOutside:");
                        },
                        // onFieldSubmitted: (value) {setState(() {}); },
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            // Icon(Icons.read_more),
                            const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.lightBlueAccent,
                            ),
                            const Icon(
                              Icons.calculate_rounded,
                              color: Colors.lightBlueAccent,
                            ),
                            const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.lightBlueAccent,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "$result2",
                              style: const TextStyle(
                                // color: Colors.cyanAccent,
                                color: Colors.lightBlueAccent,
                                fontSize: 20.0,
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
}
