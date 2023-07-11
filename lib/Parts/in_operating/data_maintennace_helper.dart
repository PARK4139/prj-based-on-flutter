import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

//회사 시스템 DB 유지보수용 쿼리 작성에 도움을 주는 버튼
class DataMaintennaceHelper extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  DataMaintennaceHelper({
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
  State<DataMaintennaceHelper> createState() => _DataMaintennaceHelperState();
}

class _DataMaintennaceHelperState extends State<DataMaintennaceHelper> {
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
    setState(() {
      if (isFirstClick == true) {
        FlutterClipboard.paste().then((value) {
          widget.text = value;
          isFirstClick = false;
        });
      } else {
        FlutterClipboard.copy(widget.text).then((value) {
          print('copied : ' + widget.text);
        });
      }
    });
  }
}
