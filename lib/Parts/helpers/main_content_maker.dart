import 'package:flutter/material.dart';

import '../../main.dart';
import 'main_text_contentents_box_maker.dart';
import 'super_worker.dart';


class MainContentMaker extends StatefulWidget {
  String level1text;
  Widget level1widget;

  List<dynamic> level2items;

   MainContentMaker({super.key, required this.level1widget, required this.level1text, required this.level2items});

  @override
  State<MainContentMaker> createState() => _MainContentMakerState();


}

class _MainContentMakerState extends State<MainContentMaker> {

  late bool isDarkMode;

  bool isMainContentClicked = false;



  @override
  void initState() {
    
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
            children: [
              for (dynamic item in widget.level2items) Column(
                children: [
                  if (item is String)
                  /*텍스트가 길어서 화면의 폭을 넘어가면 자동으로 줄바꿈해주는 텍스트상자 버튼*/ MainTextContententsBoxMaker(text: item, isMainContentClicked: isMainContentClicked)
                  else if (item is Widget)
                    item
                  else
                    for (int i = 1; i < 2; i++) const SizedBox(height: 3)
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
