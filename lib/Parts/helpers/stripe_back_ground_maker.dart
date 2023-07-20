import 'package:flutter/material.dart';

class StripeBackGroundMaker extends StatefulWidget {
  const StripeBackGroundMaker({super.key});

  @override
  State<StripeBackGroundMaker> createState() => _StripeBackGroundMakerState();
}

class _StripeBackGroundMakerState extends State<StripeBackGroundMaker> {
  late int stripeCount;
  late int colorCount;
  late double calibrationValue;
  late double flagHeight;
  late double titleSliderMaker;
  late MODE boxMode;

  late Color firstColor;
  late Color secondColor;
  late Color thirdColor;

  @override
  Widget build(BuildContext context) {
    setStripeSetting(); //flagHeight 를  MediaQuery.of(context).size.height 로 초기화하니 에러가 나타났다. MediaQuery.of(context).size.height 이 값이 build() 시에 초기화 되는 값이기 때문에 initState() 시에 초기화 하면 아마 null과 같은 유효하지 않은 값인 것 같다. 이를 참조하면 당연

    return Builder(builder: (context) {
      var coreWidget;
      if (boxMode == MODE.row) {
        colorCount = 2;
        firstColor = Colors.white;
        secondColor = Colors.red;
        stripeCount = 2;
        // stripeCount = 100;
        // stripeCount = 200;
        // stripeCount = 300;
        // stripeCount = 400;
        // stripeCount = 500;
        // stripeCount = 600;
        // stripeCount = 700;
        // stripeCount = 800;
        // stripeCount = 900;
        // stripeCount = 1000;
        // stripeCount = 2000; //그라데이션 효과 발생?
        // stripeCount = 3000; //뭔가 아트같다.
        // stripeCount = 4000; // 지지직 오래된 TV 같어
        // stripeCount = 10000;//이제는 화면처럼 보임
        // calibrationValue = 24;
        calibrationValue = 0;
        flagHeight = MediaQuery.of(context).size.height;
        // flagHeight = 50;
        titleSliderMaker = MediaQuery.of(context).size.width;
        // titleSliderMaker = 50;
        coreWidget = Container(
          color: Colors.black,
          // width: 50,
          // width: MediaQuery.of(context).size.width,
          height: flagHeight,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, //Column의 자식 위젯들을 가로로 늘릴수 있다
            mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
            // mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < stripeCount; i++)
                if (i % 2 == 0)
                  Container(
                    width: titleSliderMaker / stripeCount - calibrationValue / stripeCount,
                    color: secondColor,
                  )
                else
                  Container(
                    width: titleSliderMaker / stripeCount - calibrationValue / stripeCount,
                    color: firstColor,
                  )
            ],
          ),
        );
      }
      if (boxMode == MODE.column) {
        colorCount = 2;
        firstColor = Colors.white;
        secondColor = Colors.red;
        stripeCount = 2;
        // stripeCount = 100;
        // stripeCount = 200;
        // stripeCount = 300;
        // stripeCount = 400;
        // stripeCount = 500;
        // stripeCount = 600;
        // stripeCount = 700;
        // stripeCount = 800;
        // stripeCount = 900;
        // stripeCount = 1000;
        // stripeCount = 2000; //그라데이션 효과 발생?
        // stripeCount = 3000; //뭔가 아트같다.
        // stripeCount = 4000; // 지지직 오래된 TV 같어
        // stripeCount = 10000;//이제는 화면처럼 보임
        calibrationValue = 24;
        // calibrationValue = 0;
        flagHeight = MediaQuery.of(context).size.height;
        // flagHeight = 50;
        titleSliderMaker = MediaQuery.of(context).size.width;
        // titleSliderMaker = 50;
        coreWidget = Container(
          color: Colors.black,
          // width: 50,
          // width: MediaQuery.of(context).size.width,
          height: flagHeight,
          child: Column(
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
            mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
            // mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < stripeCount; i++)
                if (i % 2 == 0)
                  Container(
                    height: flagHeight / stripeCount - calibrationValue / stripeCount,
                    color: firstColor,
                  )
                else
                  Container(
                    height: flagHeight / stripeCount - calibrationValue / stripeCount,
                    color: secondColor,
                  ),
            ],
          ),
        );
      }

      if (boxMode == MODE.box) {
        colorCount = 2;
        firstColor = Colors.white;
        secondColor = Colors.red;
        thirdColor = Colors.yellow;
        stripeCount = 2;
        stripeCount = 3;
        stripeCount = 4;
        // stripeCount = 100;
        // stripeCount = 200;
        // stripeCount = 300;
        // stripeCount = 400;
        // stripeCount = 500;
        // stripeCount = 600;
        // stripeCount = 700;
        // stripeCount = 800;
        // stripeCount = 900;
        // stripeCount = 1000;
        // stripeCount = 2000; //그라데이션 효과 발생?
        // stripeCount = 3000; //뭔가 아트같다.
        // stripeCount = 4000; // 지지직 오래된 TV 같어
        // stripeCount = 10000;//이제는 화면처럼 보임
        flagHeight = 4;
        titleSliderMaker = 3;
        coreWidget = Center(
          child: Container(
            color: Colors.black,
            width: flagHeight,
            height: titleSliderMaker,
            child: Column(
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
              mainAxisSize: MainAxisSize.max, //아주 유용하다.적당히 맞출 필요가 없다
              // mainAxisSize: MainAxisSize.min,
              children: [
                if (colorCount == 2)
                  for (int n = 0; n < stripeCount; n++)
                    if (n % 2 == 0)
                      Expanded(
                        child: Container(
                          color: firstColor,
                          // height: 0.1,
                          // width: 0.1,
                        ),
                      )
                    else
                      Expanded(
                        child: Container(
                          color: secondColor,
                          // height: 0.1,
                          // width: 0.1,
                        ),
                      ),
                if (colorCount == 3)
                  // 오케이 숫자 패턴을 보니 등차수열 3개 가 보였다. 그래서 An=1+(n-1)3, Bn=2+(n-1)3 , Cn=3+(n-1)3 의 식을 세웠고 코드에 적용하였다
                  for (int n = 0; n < stripeCount; n++)
                    if (n == 1 + (n - 1) * 3)
                      Expanded(
                        child: Container(
                          color: firstColor,
                          // height: 0.1,
                          // width: 0.1,
                        ),
                      )
                    else if (n == 2 + (n - 1) * 3)
                      Expanded(
                        child: Container(
                          color: secondColor,
                          // height: 0.1,
                          // width: 0.1,
                        ),
                      )
                    else if (n == 3 + (n - 1) * 3)
                      Expanded(
                        child: Container(
                          color: thirdColor,
                          // height: 0.1,
                          // width: 0.1,
                        ),
                      )
              ],
            ),
          ),
        );
      }
      return coreWidget;
    });
  }

  void setStripeSetting() {
    // boxMode = MODE.ROW;
    // boxMode = MODE.COLUMN;
    boxMode = MODE.box;
  }
}

enum MODE { row, column, box }
