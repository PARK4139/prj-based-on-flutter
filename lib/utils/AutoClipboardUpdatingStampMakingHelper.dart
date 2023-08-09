import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:prj_app_mvp/utils/super_helper.dart';


class AutoClipboardUpdatingStampMakingHelper extends StatefulWidget {
  String deprecated;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;

  final String template;

  AutoClipboardUpdatingStampMakingHelper({
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
  State<AutoClipboardUpdatingStampMakingHelper> createState() => AutoClipboardUpdatingStampMakingHelperState();
}

class AutoClipboardUpdatingStampMakingHelperState extends State<AutoClipboardUpdatingStampMakingHelper> {
  bool isFirstClick = true;

  late String resultTxts ;

  late String firstPastedValue;

  late Timer autoClipboardUpdatingTimer;

  @override
  void initState() {
    super.initState();
    widget.borderRadius ??= BorderRadius.circular(5);
  }


  @override
  void dispose() {
    autoClipboardUpdatingTimer.cancel();
    printSeparatorWithMkr(txt:  "autoClipboardUpdatingTimer.cancel()");

    super.dispose();
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
          widget.template,
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
    FlutterClipboard.paste().then((value) {
      if (isFirstClick == true) {
        firstPastedValue = value;
        autoClipboardUpdatingTimer = Timer.periodic(const Duration(seconds: 1), autoClipboardUpdating);
        isFirstClick = false;
      }
      setState(() {
        resultTxts = widget.template.replaceAll(widget.deprecated, firstPastedValue);
      });
      FlutterClipboard.copy(resultTxts).then((value) {
        printSeparatorWithMkr(txt: "s");
        debugSomethingWithoutMent('$resultTxts 이(가) 복사되었습니다.');
        printSeparatorWithMkr(txt: "e");
      });
    });
  }

  void autoClipboardUpdating(Timer timer) {
      copyToClipboardAfterPasteButtonName();
  }
}
