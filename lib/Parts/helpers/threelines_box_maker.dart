import 'package:flutter/material.dart';

class ThreelinesBoxMaker extends StatefulWidget {
  int stripeCount;

  double ratioY;

  double ratioX;

  List<dynamic> colors;

  bool isOppositeDirection;

  ThreelinesBoxMaker({
    super.key,
    required this.ratioY,
    required this.ratioX,
    this.stripeCount = 1,
    required this.colors,
    this.isOppositeDirection = false,
  });

  @override
  State<ThreelinesBoxMaker> createState() => _ThreelinesBoxMakerState();
}

class _ThreelinesBoxMakerState extends State<ThreelinesBoxMaker> {
  late int stripeCount;
  late int colorCount;
  late double calibrationValue;
  late double flagHeight;
  late double titleSliderMaker;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var coreWidget;
      colorCount = widget.colors.length;
      stripeCount = widget.stripeCount;
      flagHeight = widget.ratioY;
      titleSliderMaker = widget.ratioX;

      coreWidget = Center(
        child: Container(
          color: Colors.black,
          width: flagHeight,
          height: titleSliderMaker,
          child: widget.isOppositeDirection
              ? Column(
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
                    if (colorCount == 3)
                      Expanded(
                        child: Container(
                          color: widget.colors[0],
                        ),
                      ),
                    Expanded(
                      child: Container(
                        color: widget.colors[1],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: widget.colors[2],
                      ),
                    )
                  ],
                )
              : Row(
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
                    if (colorCount == 3)
                      Expanded(
                        child: Container(
                          color: widget.colors[0],
                        ),
                      ),
                    Expanded(
                      child: Container(
                        color: widget.colors[1],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: widget.colors[2],
                      ),
                    )
                  ],
                ),
        ),
      );

      return coreWidget;
    });
  }
}
