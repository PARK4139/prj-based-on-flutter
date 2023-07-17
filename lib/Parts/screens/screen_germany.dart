import 'package:flutter/material.dart';

import '../helpers/rainbow_text_maker.dart';

class ScreenGermany extends StatefulWidget {
  const ScreenGermany({super.key});

  @override
  State<ScreenGermany> createState() => _ScreenGermanyState();
}

class _ScreenGermanyState extends State<ScreenGermany> {
  late int repeatCount;
  late int colorCount;
  late int calibrationValue;
  late double FlagHeight;
  late double FlagWidth;
  late bool isRowMode;

  late NATION nationMode;

  late Color FirstColor;
  late Color SecondColor;
  late Color ThirdColor;

  @override
  Widget build(BuildContext context) {
    setStripeSetting(); //FlagHeight 를  MediaQuery.of(context).size.height 로 초기화하니 에러가 나타났다. MediaQuery.of(context).size.height 이 값이 build() 시에 초기화 되는 값이기 때문에 initState() 시에 초기화 하면 아마 null과 같은 유효하지 않은 값인 것 같다. 이를 참조하면 에러
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
            height: FlagHeight,
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
                          width: FlagWidth /( repeatCount * 3)- calibrationValue ,
                          color: FirstColor,
                        ) ,
                      Container(
                        width: FlagWidth /( repeatCount * 3)- calibrationValue ,
                        color: SecondColor,
                      ),
                      Container(
                        width: FlagWidth /( repeatCount * 3)- calibrationValue ,
                        color: ThirdColor,
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
                              height: FlagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: FirstColor,
                            ) ,
                            Container(
                              height: FlagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: SecondColor,
                            ),
                            Container(
                              height: FlagHeight / (repeatCount * 3)- calibrationValue/3,
                              color: ThirdColor,
                            ),
                    ],
                  )),
      ),
    );
  }

  void setStripeSetting() {
    isRowMode = false;
    FirstColor = Colors.black;
    SecondColor = Colors.red;
    ThirdColor = Colors.yellow;
    if (isRowMode == true) {
      repeatCount = 1;
      calibrationValue = 0;
    } else {
      repeatCount = 1;
      calibrationValue = 24;
    }
    FlagHeight = MediaQuery.of(context).size.height;
    FlagWidth = MediaQuery.of(context).size.width;

  }
}

enum NATION { GERMANY, MONACO, INDONESIA, ITALIA, FRANCE, KOREA, JAPAN, USA, SWEDEN }
