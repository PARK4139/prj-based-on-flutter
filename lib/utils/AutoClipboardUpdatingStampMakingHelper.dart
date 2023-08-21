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
  bool isFirstClicked = false;

  late String resultTxts;

  late String firstPastedValue;

  late Timer autoClipboardUpdatingTimer;

  var isToogled = false;

  @override
  void initState() {
    super.initState();
    widget.borderRadius ??= BorderRadius.circular(5);
    autoClipboardUpdatingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      debugSomething("autoClipboardUpdatingTimer: default initialization");
    },);
  }

  @override
  void dispose() {
    // autoClipboardUpdatingTimer.cancel(); 부모 위젯에서 now 를 참조를 하sms 것과 밀접해 보임
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
      child: Align(
        alignment: Alignment.bottomLeft,
        child: TextButton(
          onPressed: () {
            isToogled = !isToogled;
            if (isToogled == false) {
              autoClipboardUpdatingTimer.cancel();
              /*음....이렇게 해도 즉시 autoClipboardUpdatingTimer 가 종료되지는 않는데...즉시 종료할 방법은 없는가?*/
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 3000), content: Text("autoClipboardUpdatingTimer가 종료되었습니다.\n그러나 이미 Stack 된 작업은 제거될때까지 기다려야 합니다.")));
            } else {
              copyTextToClipboard();
              // if(isFirstClicked==true){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 3000), content: Text("autoClipboardUpdatingTimer가 시작되었습니다.\n한번더 클릭하면 autoClipboardUpdatingTimer를 종료할 수 있습니다.")));
              // }
            }
          },
          child: Text(
            widget.template,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            // textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  void copyTextToClipboard() {
    FlutterClipboard.paste().then((value) {
      if (isFirstClicked == false) {
        firstPastedValue = value;
        if (autoClipboardUpdatingTimer == null) {
          autoClipboardUpdatingTimer = Timer.periodic(const Duration(seconds: 1), autoClipboardUpdating);
        }
        isFirstClicked = true;
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
    copyTextToClipboard();
  }
}
