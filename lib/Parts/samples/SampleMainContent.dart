import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/my_superworkers.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/in_operating/rainbow_icon.dart';

import '../../main.dart';
import '../in_operating/screen_index_colorful.dart';
import 'SampleAccodionMenu.dart';
import 'SampleMainTextContententsBox.dart';

class SampleMainContent extends StatefulWidget {
  String level1text;
  Widget level1widget;

  List<String> level2texts;

   SampleMainContent({required this.level1widget, required this.level1text, required this.level2texts});


  @override
  _SampleMainContentState createState() => _SampleMainContentState();
}

class _SampleMainContentState extends State<SampleMainContent> {

  late var isDarkMode;

  bool isMainContentClicked = false;



  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      isDarkMode = context.findAncestorStateOfType<AppState>()!.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*메인컨텐츠*/ TextButton(
          onPressed: () {
            toogleMainContentState();
          },
          child: Row(
            children: [for (int i = 1; i < 5; i++) const SizedBox(width: 3), widget.level1widget, for (int i = 1; i < 4; i++) const SizedBox(width: 3), Text(widget.level1text, style: MyTextStyles.textStyle3)],
          ),
        ),
        for (int i = 1; i < 2; i++) const SizedBox(height: 3),
          isMainContentClicked ?  Column(
            children: <Widget>[
              for (var text in widget.level2texts) Column(
                children: [
                  /*텍스트가 길어서 화면의 폭을 넘어가면 자동으로 줄바꿈해주는 텍스트상자 버튼*/ SampleMainTextContententsBox(text: text, isMainContentClicked:isMainContentClicked ),
                  for (int i = 1; i < 2; i++) const SizedBox(height: 3),
                ],
              ),
            ],
          ): Container(),
      ],
    );
  }

  void toogleMainContentState() {
    setState(() {
      if (isMainContentClicked == true) {
        isMainContentClicked = false;
      } else {
        isMainContentClicked = true;
      }
    });
  }
}
