

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'super_helper.dart';

class TextShirikableStampMaker extends StatefulWidget {
  String text;
  bool isMainContentClicked;



  TextShirikableStampMaker({super.key, this.text = '코드는 세상을 바꾼다. 코드는 사람의 실수를 줄여준다. 코드는 생산성을 높여준다. 나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.', required this.isMainContentClicked});

  @override
  State<TextShirikableStampMaker> createState() =>  _TextShirikableStampMakerState();
}

class _TextShirikableStampMakerState extends State<TextShirikableStampMaker> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        copyToClipboard();
        toogleMainContentState();
      },
      child: /*줄길이에 따라 변하도록 할 수있는 유용한 텍스트박스*/Container(
        width: 300-45,//폭 설정
        padding: const EdgeInsets.all(10),
        color: Colors.black38.withOpacity(0.5),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: RichText(
                selectionColor: Colors.blueAccent,
                // overflow: TextOverflow.clip,//오버플로우 텍스트를 잘라내어 보이지 않도록 렌더링
                overflow: TextOverflow.fade, //오버플로우 텍스트를 그라데이션효과로 사라지도록 렌더링
                // overflow: TextOverflow.ellipsis,//오버플로우 텍스트를 ...으로 렌더링
                // overflow: TextOverflow.visible,//오버플로우 텍스트를 보이도록 렌더링
                maxLines: widget.isMainContentClicked ? 3 : 100, //100 줄까지만 보이도록
                // strutStyle: const StrutStyle(fontSize: 9.0),//이거 어디에 쓰이는지?..
                text: TextSpan(text: widget.text, style: MyTextStyles.textStyle20230719),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toogleMainContentState() {
    setState(() {
      if (widget.isMainContentClicked == true) {
        widget.isMainContentClicked = false;
      } else {
        widget.isMainContentClicked = true;
      }
    });
  }

  void copyToClipboard() {
    FlutterClipboard.copy(widget.text).then((value) {
      printWithoutErrorOrPrintWithError('copied : ${widget.text}');
    });

  }
}
