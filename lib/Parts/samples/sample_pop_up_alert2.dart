import 'package:flutter/material.dart';

class SamplePopUpAlert extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final BorderRadius? borderRadius;

  const SamplePopUpAlert({
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
  State<SamplePopUpAlert> createState() => _SamplePopUpAlertState();
}

class _SamplePopUpAlertState extends State<SamplePopUpAlert> {
  @override
  Widget build(BuildContext context) {
    return /*경고팝업버튼*/ Container(
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
          widget.text,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
        ),
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Icon(Icons.warning_outlined, color: Colors.orangeAccent),
                  content: const Text("아직 준비되지 않은 서비스입니다!\n준비해서 다시 만나요!"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("알겠어요!"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          }); // setState(() {
        },
      ),
    );
  }
}
