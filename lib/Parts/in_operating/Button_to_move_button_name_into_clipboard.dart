import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class Button_to_move_button_name_into_clipboard extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;
  late TextAlign? text_align;

  Button_to_move_button_name_into_clipboard({
    Key? key,
    required this.text,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
    this.text_align = null,
  }) : super(key: key);

  @override
  State<Button_to_move_button_name_into_clipboard> createState() => _Button_to_move_button_name_into_clipboardState();
}

class _Button_to_move_button_name_into_clipboardState extends State<Button_to_move_button_name_into_clipboard> {
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
          textAlign: widget.text_align,
        ),
        onPressed: copyToClipboard,
      ),
    );
  }

  void copyToClipboard() {
    FlutterClipboard.copy(widget.text).then((value) {
      print('copied : ' + widget.text);
    });
  }
}
