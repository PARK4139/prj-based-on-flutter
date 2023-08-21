import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';

/*처음에 클립보드의 값이 버튼명으로 저장이 되고 그 이후로 클릭을 하면 클립보드로 값이 저장되는 클립보드의 내용을 버튼명에 바인딩하는 버튼*/
class DisposalStampMaker extends StatefulWidget {
  String txt;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  late BorderRadius? borderRadius;

  final String prefix;

  final String suffix;

  DisposalStampMaker({
    Key? key,
    this.prefix = "",
    required this.txt,
    this.suffix = "",
    this.color = Colors.white38,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w200,
    this.paddingVertical = 5,
    this.paddingHorizontal = 5,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<DisposalStampMaker> createState() => _DisposalStampMakerState();
}

class _DisposalStampMakerState extends State<DisposalStampMaker> {
  late bool isFirstClick;

  @override
  void initState() {
    widget.borderRadius ??= BorderRadius.circular(5);
    super.initState();
    isFirstClick = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: widget.backgroundColor,
        // color: MyColors.black12,
        borderRadius: widget.borderRadius,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal,
        vertical: widget.paddingVertical,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: TextButton(
          onPressed: copyToClipboardAfterPasteButtonName,
          child: Text(
            widget.prefix + widget.txt + widget.suffix,
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

  void copyToClipboardAfterPasteButtonName() {
    if (isFirstClick == true) {
      FlutterClipboard.paste().then((value) {
        setState(() {
          widget.txt = value;
          FlutterClipboard.copy(widget.prefix + widget.txt + widget.suffix).then((value) {
            debugSomethingWithoutMent('copied : ${widget.prefix + widget.txt + widget.suffix}');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('복사되었습니다.\n${widget.prefix + widget.txt + widget.suffix}')));
          });
          isFirstClick = false;
        });
      });
    } else {
      FlutterClipboard.copy(widget.prefix + widget.txt + widget.suffix).then((value) {
        debugSomethingWithoutMent('copied : ${widget.prefix + widget.txt + widget.suffix}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(milliseconds: 1000), content: Text('복사되었습니다.\n${widget.prefix + widget.txt + widget.suffix}')));
      });
    }
  }
}
