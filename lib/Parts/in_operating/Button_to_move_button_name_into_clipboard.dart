import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'my_superworkers.dart';

class Button_to_move_button_name_into_clipboard extends StatefulWidget {
  final String text;
  Color? color;
  final FontWeight font_weight;
  final double font_size;
  late Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  late BorderRadius? border_radius;
  late TextAlign? text_align;

  Button_to_move_button_name_into_clipboard({
    Key? key,
    required this.text,
    this.font_size = 10,
    this.font_weight = FontWeight.w200,
    this.padding_vertical = 5,
    this.padding_horizontal = 4,
    this.border_radius,
    this.background_color,
    this.color,
  }) : super(key: key);

  @override
  State<Button_to_move_button_name_into_clipboard> createState() => _Button_to_move_button_name_into_clipboardState();
}

class _Button_to_move_button_name_into_clipboardState extends State<Button_to_move_button_name_into_clipboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.background_color == null) {
      widget.background_color = MyColors.black_undefined;
    }
    if (widget.color == null) {
      widget.color = MyColors.white_clear;
    }
    if (widget.border_radius == null) {
      widget.border_radius = BorderRadius.circular(5);
    }

    // widget.text_align = null;
    widget.text_align = TextAlign.center;
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
        onPressed: copyToClipboard,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.font_size,
            fontWeight: widget.font_weight,
          ),
          textAlign: widget.text_align,
        ),
      ),
    );
  }

  void copyToClipboard() {
    FlutterClipboard.copy(widget.text).then((value) {
      print('copied : ' + widget.text);
    });
  }
}
