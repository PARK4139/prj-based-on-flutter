

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
/*처음에 클립보드의 값이 버튼명으로 저장이 되고 그 이후로 클릭을 하면 클립보드로 값이 저장되는 클립보드의 내용을 버튼명에 바인딩하는 버튼*/
class DisposalStampMaker extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  DisposalStampMaker({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
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
        color: widget.background_color,
        borderRadius: widget.border_radius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.padding_horizontal,
        vertical: widget.padding_vertical,
      ),
      child: TextButton(
        onPressed: copyToClipboardAfterPasteButtonName,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.font_size,
            fontWeight: widget.font_weight,
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
            print('copied : ' + widget.text);
          });
          isFirstClick = false;
        });
      });
    } else {
      FlutterClipboard.copy(widget.text).then((value) {
        print('copied : ' + widget.text);
      });
    }
  }
}
