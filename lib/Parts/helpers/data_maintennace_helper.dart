import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';

//회사 시스템 DB 유지보수용 쿼리 작성에 도움을 주는 버튼
class DataMaintennaceHelper extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  DataMaintennaceHelper({
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
  State<DataMaintennaceHelper> createState() => _DataMaintennaceHelperState();
}

class _DataMaintennaceHelperState extends State<DataMaintennaceHelper> {
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
    setState(() {
      if (isFirstClick == true) {
        FlutterClipboard.paste().then((value) {
          widget.text = value;
          isFirstClick = false;
        });
      } else {
        FlutterClipboard.copy(widget.text).then((value) {
          printWithoutErrorOrPrintWithError('copied : ${widget.text}');
        });
      }
    });
  }
}
