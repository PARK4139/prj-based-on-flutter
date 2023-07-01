import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class Button_to_calmel_case extends StatefulWidget {
  String text_place_holder;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  Button_to_calmel_case({
    Key? key,
    required this.text_place_holder,
    required this.background_color,
    required this.color,
    required this.font_size,
    required this.font_weight,
    required this.padding_vertical,
    required this.padding_horizontal,
    required this.border_radius,
  }) : super(key: key);

  @override
  State<Button_to_calmel_case> createState() => _Button_to_calmel_caseState();
}

class _Button_to_calmel_caseState extends State<Button_to_calmel_case> {
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
          widget.text_place_holder,
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
          widget.text_place_holder = Calmel_case_maker(value: value);
          FlutterClipboard.copy(widget.text_place_holder).then((value) {
            print('copied : ' + widget.text_place_holder);
          });
          isFirstClick = false;
        });
      });
    } else {
      FlutterClipboard.copy(widget.text_place_holder).then((value) {
        print('copied : ' + widget.text_place_holder);
      });
    }
  }

  String Calmel_case_maker({required String value}) {
    var result = value.split('_');
    for (int i = 0; i < result.length; i++) {
      result[i] = result[i].substring(0, 1).toUpperCase() + result[i].substring(1);
    }
    return result.join('');
  }
}
