

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';
/*처음에 클립보드의 값이 버튼명으로 저장이 되고 그 이후로 클릭을 하면 클립보드로 값이 저장되는 클립보드의 내용을 버튼명에 바인딩하는 버튼*/
class DisposalStampMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  DisposalStampMaker({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
  }) : super(key: key);

  @override
  State<DisposalStampMaker> createState() => _DisposalStampMakerState();
}

class _DisposalStampMakerState extends State<DisposalStampMaker> {
  bool isFirstClick = true;

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
        onPressed: copyToClipboardAfterPasteButtonName,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
        ),
      ),
    );
  }

  void copyToClipboardAfterPasteButtonName() {
    if (isFirstClick == true) {
      FlutterClipboard.paste().then((value) {
        setState(() {
          widget.text = value;
          FlutterClipboard.copy(widget.text).then((value) {
            printWithoutErrorOrPrintWithError('copied : ${widget.text}');
          });
          isFirstClick = false;
        });
      });
    } else {
      FlutterClipboard.copy(widget.text).then((value) {
        printWithoutErrorOrPrintWithError('copied : ${widget.text}');
      });
    }
  }
}
