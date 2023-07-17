import 'package:flutter/material.dart';

class StripedBoxMaker extends StatefulWidget {
  int stripeCount;

  double ratioY;

  double ratioX;

  List<dynamic> colors;

  bool isOppositeDirection;

  StripedBoxMaker({
    required this.ratioY,
    required this.ratioX,
    this.stripeCount = 1,
    required this.colors, this.isOppositeDirection=false,
  });

  @override
  State<StripedBoxMaker> createState() => _StripedBoxMakerState();
}

class _StripedBoxMakerState extends State<StripedBoxMaker> {
  late int stripeCount;
  late int colorCount;
  late double calibrationValue;
  late double FlagHeight;
  late double FlagWidth;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {

      var coreWidget;
      colorCount = widget.colors.length;
      stripeCount = widget.stripeCount;
      FlagHeight = widget.ratioY;
      FlagWidth = widget.ratioX;


      coreWidget = Center(
        child: Container(
          color: Colors.black,
          width: FlagHeight,
          height: FlagWidth,
          child: widget.isOppositeDirection?Column(
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
              if (colorCount == 1)
                Expanded(
                  child: Container(
                    color: widget.colors[0],
                    // height: 0.1,
                    // width: 0.1,
                  ),
                ),
              if (colorCount == 2)
                for (int n = 0; n < stripeCount; n++)
                  if (n % 2 == 0)
                    Expanded(
                      child: Container(
                        color: widget.colors[0],
                        // height: 0.1,
                        // width: 0.1,
                      ),
                    )
                  else
                    Expanded(
                      child: Container(
                        color: widget.colors[1],
                        // height: 0.1,
                        // width: 0.1,
                      ),
                    ),

            ],
          ):Row(
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
              if (colorCount == 1)
                Expanded(
                  child: Container(
                    color: widget.colors[0],
                    // height: 0.1,
                    // width: 0.1,
                  ),
                ),
              if (colorCount == 2)
                for (int n = 0; n < stripeCount; n++)
                  if (n % 2 == 0)
                    Expanded(
                      child: Container(
                        color: widget.colors[0],
                        // height: 0.1,
                        // width: 0.1,
                      ),
                    )
                  else
                    Expanded(
                      child: Container(
                        color: widget.colors[1],
                        // height: 0.1,
                        // width: 0.1,
                      ),
                    ),

            ],
          ),
        ),
      );

      return coreWidget;
    });
  }
}
