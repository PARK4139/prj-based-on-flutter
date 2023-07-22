import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../in_developing/common.dart';
import 'iterable_structure_maker.dart';
import 'super_helper.dart';


class WithvKulLoginHelper extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  WithvKulLoginHelper({
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
  State<WithvKulLoginHelper> createState() => _ButtonMoveToBizmekaDailyReportState();
}

class _ButtonMoveToBizmekaDailyReportState extends State<WithvKulLoginHelper> {
  String textToCopy = '';
  late Map<String, dynamic> stamps;
  var helper = MySuperHelpers();
  int clickCounter = 0;
  late List<String> itemsToCopy;

  late var itemsIterable;

  @override
  void initState() {
    super.initState();
    initThisButon();
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
          child: Text(
            widget.text.substring(10, 40),
            style: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
          ),
          onPressed: () {
            final Uri url = Uri.parse("https://naver.com");
            doSpecialCopyProcess(url);
          }),
    );
  }

  void doSpecialCopyProcess(
    Uri url, {
    String? hostOperatingEnvironment, //아무래도 이게 꼭 필요하다
  }) {
    setState(() {
      if (clickCounter == 0) {
        printWithoutErrorOrPrintWithError("ClickCounter:$clickCounter"); //DEVELOPMENT
        printWithoutErrorOrPrintWithError('copied : $textToCopy'); //DEVELOPMENT
        textToCopy = itemsIterable.next();
        widget.text = textToCopy;
      }
      int i = 1;
      while (true) {
        if (clickCounter == i) {
          printWithoutErrorOrPrintWithError("ClickCounter:$clickCounter"); //DEVELOPMENT
          printWithoutErrorOrPrintWithError('copied : $textToCopy'); //DEVELOPMENT
          FlutterClipboard.copy(textToCopy).then((value) {});
          try {
            textToCopy = itemsIterable.next();
          } catch (e) {
            // print(e);//DEVELOPMENT
            initThisButon();
            textToCopy = itemsIterable.next();
          }
          widget.text = textToCopy;
        }
        i++;
        if (i == itemsIterable.itemLengthSnapshotAtBorn + 1) {
          break;
        }
      }
      clickCounter = clickCounter + 1;
    });
  }

  Future<void> runUrl({
    required String url,
    String? mode,
  }) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void initThisButon() {
    stamps = CommonTextData().stamps;
    itemsToCopy = <String>[
      stamps['시작'], //DEVELOPMENT
      stamps['1001'],
      stamps['1002'],
      stamps['1003'],
      stamps['종료'], //DEVELOPMENT
      widget.text,
    ];
    itemsIterable = IterableStringListMaker(items: itemsToCopy);
    clickCounter = 0;
  }
}
