import 'package:flutter/material.dart';

import '../helpers/rainbow_text_maker.dart';

class ScreenPracticeGermany extends StatefulWidget {
  const ScreenPracticeGermany({super.key});

  @override
  State<ScreenPracticeGermany> createState() => _ScreenPracticeGermanyState();
}

class _ScreenPracticeGermanyState extends State<ScreenPracticeGermany> {
  late int repeatCount;
  late int colorCount;
  late int calibrationValue;
  late double flagHeight;
  late double titleSliderMaker;
  late bool isRowMode;

  late NATION nationMode;

  late Color firstColor;
  late Color secondColor;
  late Color thirdColor;

  @override
  Widget build(BuildContext context) {
    setStripeSetting(); //flagHeight 를  MediaQuery.of(context).size.height 로 초기화하니 에러가 나타났다. MediaQuery.of(context).size.height 이 값이 build() 시에 초기화 되는 값이기 때문에 initState() 시에 초기화 하면 아마 null과 같은 유효하지 않은 값인 것 같다. 이를 참조하면 에러
    return Scaffold(
       floatingActionButton:  /*뒤로가기 버튼*/ InkWell(
         child: RainbowTextMaker(text: "뒤로가기"),
         onTap: () {
           Navigator.pop(context);
         },
       ),
      backgroundColor: Colors.black.withOpacity(0.9),
      body: SafeArea(
        // top: true,
        // bottom: true,
        child: Container(
            color: Colors.black,
            // width: 50,
            // width: MediaQuery.of(context).size.width,
            height: flagHeight,
            child: isRowMode
                ? Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch, //Column의 자식 위젯들을 가로로 늘릴수 있다
                    mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < repeatCount; i++)
                        Container(
                          width: titleSliderMaker /( repeatCount * 3)- calibrationValue ,
                          color: firstColor,
                        ) ,
                      Container(
                        width: titleSliderMaker /( repeatCount * 3)- calibrationValue ,
                        color: secondColor,
                      ),
                      Container(
                        width: titleSliderMaker /( repeatCount * 3)- calibrationValue ,
                        color: thirdColor,
                      ),

                    ],
                  )
                : Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                        for (int i = 0; i < repeatCount; i++)
                            Container(
                              height: flagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: firstColor,
                            ) ,
                            Container(
                              height: flagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: secondColor,
                            ),
                            Container(
                              height: flagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: thirdColor,
                            ),
                    ],
                  )),
      ),
    );
  }

  void setStripeSetting() {
    isRowMode = false;
    firstColor = Colors.black;
    secondColor = Colors.red;
    thirdColor = Colors.yellow;
    if (isRowMode == true) {
      repeatCount = 1;
      calibrationValue = 0;
    } else {
      repeatCount = 1;
      calibrationValue = 24;
    }
    flagHeight = MediaQuery.of(context).size.height;
    titleSliderMaker = MediaQuery.of(context).size.width;

  }
}

enum NATION { germany, monaco, indonesia, italia, france, korea, japan, usa, sweden }
