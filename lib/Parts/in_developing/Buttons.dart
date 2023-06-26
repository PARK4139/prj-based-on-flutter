import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../in_operating/My_functions.dart';





//처음에 클립보드의 값이 버튼명으로 저장이 되고 그 이후로 클릭을 하면 클립보드로 값이 저장되는 클립보드의 내용을 버튼명에 바인딩하는 버튼
class Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click({
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
  State<Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click> createState() => _Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_clickState();
}

class _Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_clickState extends State<Button_that_user_click_save_button_name_into_clipboard_after_saving_cliped_text_as_button_name_by_first_user_click> {
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
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.font_size,
            fontWeight: widget.font_weight,
          ),
        ),
        onPressed: copyToClipboardAfterPasteButtonName,
      ),
    );
  }

  void copyToClipboardAfterPasteButtonName() {
    if (isFirstClick == true) {
      FlutterClipboard.paste().then((value) {
        setState(() {
          widget.text = value;
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

//1초마다 시간이 갱신이 되면서 `ti 의 특정위치로 yyyy MM dd HH nn ss SSS  시간 스탬프가 치환이되고 버튼명이 갱신이 되며, 버튼명이 클립보드로 저장이 되는 버튼
class Button_v7 extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_v7({
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
  State<Button_v7> createState() => _Button_v7State();
}

class _Button_v7State extends State<Button_v7> {
  String button_name = '';

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
      child: TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          button_name = widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy, ' ', mm, ' ', dd, ' ', HH, ' ', nn, ' ', ss, ' ', SSS]));
          return TextButton(
            child: Text(
              // widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy,' ',mm,' ',dd,' ',HH, ' ', nn, ' ', ss, ' ',SSS])),
              button_name,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.font_size,
                fontWeight: widget.font_weight,
              ),
            ),
            onPressed: copyToClipboard,
          );
        },
      ),
    );
  }

  void copyToClipboard() {
    setState(() {
      FlutterClipboard.copy(button_name).then((value) {
        print('copied : ' + widget.text);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String FormattingToMinuite(int seconds) {
    var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
    // return duration.toString().split(".")[0];  // DEPRECATED FOR first IS MORE EXPLICTED EXPRESSION THAN [0].
    // print(duration.toString().split(".").first.split(":").first);
    if (duration.toString().split(".").first.split(":").first == '0') {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return duration.toString().split(".").first; //PRODUCTION
    }
  }
}

//1초마다 시간이 갱신이 되면서 `ti 의 특정위치로 yyyy-mm-dd 시간 스탬프가 치환이되고 버튼명이 갱신이 되며, 버튼명이 클립보드로 저장이 되는 버튼
class Button_v8 extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_v8({
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
  State<Button_v8> createState() => _Button_v8State();
}

class _Button_v8State extends State<Button_v8> {
  String button_name = '';

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
      child: TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          button_name = widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
          return TextButton(
            child: Text(
              // widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy,' ',mm,' ',dd,' ',HH, ' ', nn, ' ', ss, ' ',SSS])),
              button_name,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.font_size,
                fontWeight: widget.font_weight,
              ),
            ),
            onPressed: copyToClipboard,
          );
        },
      ),
    );
  }

  void copyToClipboard() {
    setState(() {
      FlutterClipboard.copy(button_name).then((value) {
        print('copied : ' + widget.text);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String FormattingToMinuite(int seconds) {
    var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
    // return duration.toString().split(".")[0];  // DEPRECATED FOR first IS MORE EXPLICTED EXPRESSION THAN [0].
    // print(duration.toString().split(".").first.split(":").first);
    if (duration.toString().split(".").first.split(":").first == '0') {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return duration.toString().split(".").first; //PRODUCTION
    }
  }
}

//1초마다 시간이 갱신이 되면서 `ti 의 특정위치로 HH nn mm 시간 스탬프가 치환이되고 버튼명이 갱신이 되며, 버튼명이 클립보드로 저장이 되는 버튼
class Button_v9 extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_v9({
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
  State<Button_v9> createState() => _Button_v9State();
}

class _Button_v9State extends State<Button_v9> {
  String button_name = '';

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
      child: TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          button_name = widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy, ' ', mm, ' ', dd, ' ', HH, ' ', nn, ' ', ss, ' ', SSS]));
          return TextButton(
            child: Text(
              // widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy,' ',mm,' ',dd,' ',HH, ' ', nn, ' ', ss, ' ',SSS])),
              button_name,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.font_size,
                fontWeight: widget.font_weight,
              ),
            ),
            onPressed: copyToClipboard,
          );
        },
      ),
    );
  }

  void copyToClipboard() {
    setState(() {
      FlutterClipboard.copy(button_name).then((value) {
        print('copied : ' + widget.text);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String FormattingToMinuite(int seconds) {
    var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
    // return duration.toString().split(".")[0];  // DEPRECATED FOR first IS MORE EXPLICTED EXPRESSION THAN [0].
    // print(duration.toString().split(".").first.split(":").first);
    if (duration.toString().split(".").first.split(":").first == '0') {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return duration.toString().split(".").first; //PRODUCTION
    }
  }
}

//1초마다 시간이 갱신이 되면서 `ti 의 특정위치로 HH nn mm 시간 스탬프가 치환이되고 버튼명이 갱신이 되며, 버튼명이 클립보드로 저장이 되는 버튼
class Button_withv_daily_report_title extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_withv_daily_report_title({
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
  State<Button_withv_daily_report_title> createState() => _Button_withv_daily_report_titleState();
}

class _Button_withv_daily_report_titleState extends State<Button_withv_daily_report_title> {
  String button_name = '';

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
      child: TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          // button_name = widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy,' ',mm,' ',dd,' ',HH, ' ', nn, ' ', ss, ' ',SSS])),
          button_name = widget.text.replaceAll('`ti', formatDate(DateTime.now(), [yyyy, '', mm, '', dd]));
          return TextButton(
            child: Text(
              button_name,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.font_size,
                fontWeight: widget.font_weight,
              ),
            ),
            onPressed: copyToClipboard,
          );
        },
      ),
    );
  }

  void copyToClipboard() {
    setState(() {
      FlutterClipboard.copy(button_name).then((value) {
        print('copied : ' + widget.text);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String FormattingToMinuite(int seconds) {
    var duration = Duration(seconds: seconds); // duration.toString()  ==  '0:00:02.000000'
    // return duration.toString().split(".")[0];  // DEPRECATED FOR first IS MORE EXPLICTED EXPRESSION THAN [0].
    // print(duration.toString().split(".").first.split(":").first);
    if (duration.toString().split(".").first.split(":").first == '0') {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return duration.toString().split(".").first; //PRODUCTION
    }
  }
}

class Button_for_data_maintennace extends StatefulWidget {
  String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_for_data_maintennace({
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
  State<Button_for_data_maintennace> createState() => _Button_for_data_maintennaceState();
}

class _Button_for_data_maintennaceState extends State<Button_for_data_maintennace> {
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
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.font_size,
            fontWeight: widget.font_weight,
          ),
        ),
        onPressed: copyToClipboardAfterPasteButtonName,
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
