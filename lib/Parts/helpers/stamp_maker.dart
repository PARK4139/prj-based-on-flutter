import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';


// typedef operand = void;
// operand myNavigatorPop(var context) {
//   Navigator.of(context).pop();
// }

class StampMaker extends StatefulWidget {
  final String text;
  Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  late Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;
  late TextAlign? textAlign;

  bool doYouWantPopAfterClicking;

  // operand myNavigatorPop;

  StampMaker({
    Key? key,
    required this.text,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w200,
    this.paddingVertical = 0,//5
    this.paddingHorizontal = 0,//4
    this.borderRadius,
    this.backgroundColor,
    this.color,
    // this.myNavigatorPop,
    this.doYouWantPopAfterClicking = false,
  }) : super(key: key);

  @override
  State<StampMaker> createState() => _StampMakerState();
}

class _StampMakerState extends State<StampMaker> {
  @override
  void initState() {
    
    super.initState();
    widget.backgroundColor ??= MyColors.blackUndefined;
    widget.color ??= MyColors.whiteClear;
    widget.borderRadius ??= BorderRadius.circular(5);
    // widget.text_align = null;
    widget.textAlign = TextAlign.center;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal,
        vertical: widget.paddingVertical,
      ),
      child: TextButton(
        onPressed: copyToClipboard,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
          textAlign: widget.textAlign,
        ),
      ),
    );
  }

  void copyToClipboard() {
    FlutterClipboard.copy(widget.text).then((value) {
      printWithoutErrorOrPrintWithError('copied : ${widget.text}');
    });

    /*2023 07 07 10 31 StampIntoClipboard :  copy 클릭 시 창닫기 기능 추가 s*/
    if(widget.doYouWantPopAfterClicking==true){
      Navigator.of(context).pop();
    }
    /*2023 07 07 10 31 StampIntoClipboard :  copy 클릭 시 창닫기 기능 추가 e*/
  }
}
