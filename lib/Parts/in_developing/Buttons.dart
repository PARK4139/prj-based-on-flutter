import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

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

//회사 시스템 DB 유지보수용 쿼리 작성에 도움을 주는 버튼
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
