// typedef operand = void;
// operand myNavigatorPop(var context) {
//   Navigator.of(context).pop();
// }

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';

class HardCodingStampMaker extends StatefulWidget {
  final String txt;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;


  bool isAbleToPop;

  // var width;
  var textAlign;

  // operand myNavigatorPop;

  HardCodingStampMaker({
    Key? key,
    required this.txt,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w200,
    this.paddingVertical = 0, //5
    this.paddingHorizontal = 0, //4
    this.borderRadius,
    this.isAbleToPop = false,
    this.textAlign ,
  }) : super(key: key);

  @override
  State<HardCodingStampMaker> createState() => _HardCodingStampMakerState();
}

class _HardCodingStampMakerState extends State<HardCodingStampMaker> {

  @override
  Widget build(BuildContext context) {
    widget.borderRadius = BorderRadius.circular(0);
    widget.textAlign = TextAlign.left;
    // widget.width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(

        // width: widget.width,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          // color: MyColors.black12,
          // color: MyColors.blackWithOpacity20Percent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal,
          vertical: widget.paddingVertical,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,//textAlign: TextAlign.left, 대체품
          child: TextButton(
            onPressed: copyToClipboard,
            child: Text(
              widget.txt,
              style: TextStyle(
                color: MyColors.whiteWithOpacity60Percent,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
              // textAlign: TextAlign.left,
              // textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }

  void copyToClipboard() {
    FlutterClipboard.copy(widget.txt).then((value) {
      debugSomethingWithoutMent('copied : ${widget.txt}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('복사되었습니다.\n${widget.txt}')));
    });

    /*2023 07 07 10 31 StampIntoClipboard :  copy 클릭 시 창닫기 기능 추가 s*/
    if (widget.isAbleToPop == true) {
      Navigator.of(context).pop();
    }
    /*2023 07 07 10 31 StampIntoClipboard :  copy 클릭 시 창닫기 기능 추가 e*/
  }
}
