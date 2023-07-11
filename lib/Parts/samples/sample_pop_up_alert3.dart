import 'package:flutter/material.dart';

class SamplePopUpAlert extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? font_weight;
  final double? font_size;
  final Color? background_color;
  final double padding_vertical;
  final double padding_horizontal;
  final BorderRadius? border_radius;

  const SamplePopUpAlert({
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
  State<SamplePopUpAlert> createState() => _SamplePopUpAlertState();
}

class _SamplePopUpAlertState extends State<SamplePopUpAlert> {
  @override
  Widget build(BuildContext context) {
    return /*경고팝업버튼*/ Container(
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
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              barrierDismissible: true, // 바깥영역터치 > 닫을지 여부
              useRootNavigator: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('foo'),
                  insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                  actions: [
                    TextButton(
                      child: const Text('확인'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });
        },
      ),
    );
  }
}
