import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';



class ReplacingStampMaker extends StatefulWidget {
  String deprecated;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;

  final String template;

  ReplacingStampMaker({
    Key? key,
    required this.template,
    required this.deprecated,
    this.backgroundColor = Colors.black12,
    this.color = Colors.white38,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w200,
    this.paddingVertical = 5,
    this.paddingHorizontal = 5,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ReplacingStampMaker> createState() => _ReplacingStampMakerState();
}

class _ReplacingStampMakerState extends State<ReplacingStampMaker> {
  bool isFirstClick = true;

  String resultTxts = "";

  @override
  void initState() {
    widget.borderRadius ??= BorderRadius.circular(5);
    super.initState();
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
        onPressed: copyToClipboardAfterPasteButtonName,
        child: Text(
          "${widget.template}",
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
          List<String> lines = [];
          lines = value.split("\n").map((x) {
            return widget.template.replaceAll(widget.deprecated, value);
          }).toList();

          for (String line in lines) {
            resultTxts = '$resultTxts$line\n';
          }
          FlutterClipboard.copy(resultTxts).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('$resultTxts\n이(가) 복사되었습니다.')));
            debugSomething('$resultTxts\n이(가) 복사되었습니다.');
          });
          isFirstClick = false;
          widget.deprecated = resultTxts;
        });
      });
    } else {
      FlutterClipboard.copy(resultTxts).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('$resultTxts\n이(가) 복사되었습니다.')));
        debugSomething('$resultTxts\n이(가) 복사되었습니다.');
      });
    }
  }
}
