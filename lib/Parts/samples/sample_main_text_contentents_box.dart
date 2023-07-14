import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/my_superworkers.dart';

class SampleMainTextContententsBox extends StatefulWidget {
  String text;
  bool isMainContentClicked;

  @override
  _SampleMainTextContententsBoxState createState() => _SampleMainTextContententsBoxState();

  SampleMainTextContententsBox({this.text = '코드는 세상을 바꾼다. 코드는 사람의 실수를 줄여준다. 코드는 생산성을 높여준다. 나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.나는 코드가 좋다 너는 코드가 좋다 우리는 코드가 좋다 너도 나도 코드가 좋다.', required this.isMainContentClicked});
}

class _SampleMainTextContententsBoxState extends State<SampleMainTextContententsBox> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toogleMainContentState();
      },
      child: Container(
        // width: 400,//폭을 설정하면 유용하다!
        padding: EdgeInsets.all(10),
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
                maxLines: widget.isMainContentClicked ? 1 : 100, //100 줄까지만 보이도록
                // strutStyle: const StrutStyle(fontSize: 9.0),//이거 어디에 쓰이는지?..
                text: TextSpan(text: widget.text, style: MyTextStyles.textStyle4),
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
}
