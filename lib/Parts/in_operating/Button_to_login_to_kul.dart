import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../in_developing/common.dart';
import '../in_operating/my_superworkers.dart';
import 'iterable_structure_maker.dart';

class Button_to_login_to_kul extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_to_login_to_kul({
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
  State<Button_to_login_to_kul> createState() => _ButtonMoveToBizmekaDailyReportState();
}

class _ButtonMoveToBizmekaDailyReportState extends State<Button_to_login_to_kul> {
  String text_to_copy = '';
  late Map<String, dynamic> Stamps;
  var helper = My_superworkers();
  int ClickCounter = 0;
  late List<String> items_to_copy;

  // late var naturalNumbers;
  late var items_iterable;

  @override
  void initState() {
    super.initState();
    init_this_buton();
  }

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
          child: Text(
            widget.text.substring(10, 40),
            style: TextStyle(
              color: widget.color,
              fontSize: widget.font_size,
              fontWeight: widget.font_weight,
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
      if (ClickCounter == 0) {
        print("ClickCounter:" + ClickCounter.toString()); //DEVELOPMENT
        print('copied : ' + text_to_copy); //DEVELOPMENT
        text_to_copy = items_iterable.next();
        widget.text = text_to_copy;
      }
      int i = 1;
      while (true) {
        if (ClickCounter == i) {
          print("ClickCounter:" + ClickCounter.toString()); //DEVELOPMENT
          print('copied : ' + text_to_copy); //DEVELOPMENT
          FlutterClipboard.copy(text_to_copy).then((value) {});
          try {
            text_to_copy = items_iterable.next();
          } catch (e) {
            // print(e);//DEVELOPMENT
            init_this_buton();
            text_to_copy = items_iterable.next();
          }
          widget.text = text_to_copy;
        }
        i++;
        if (i == items_iterable.item_length_snapshot_at_born + 1) {
          break;
        }
      }
      ClickCounter = ClickCounter + 1;
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

  void init_this_buton() {
    Stamps = COMMON_TEXT_DATA().STAMPS;
    items_to_copy = <String>[
      Stamps['시작'], //DEVELOPMENT
      Stamps['1001'],
      Stamps['1002'],
      Stamps['1003'],
      Stamps['종료'], //DEVELOPMENT
      widget.text,
    ];
    items_iterable = IterableStringListMaker(items: items_to_copy);
    ClickCounter = 0;
  }
}
