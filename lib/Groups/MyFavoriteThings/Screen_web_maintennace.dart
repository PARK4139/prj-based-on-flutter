import 'package:flutter/material.dart';

import 'Button_to_move_button_name_into_clipboard.dart';

import 'MyFunctions.dart';
import 'Rainbow_text_maker.dart';

class Screen_web_maintennace extends StatefulWidget {
  const Screen_web_maintennace({Key? key}) : super(key: key);

  @override
  State<Screen_web_maintennace> createState() => _Screen_web_maintennaceState();
}

class _Screen_web_maintennaceState extends State<Screen_web_maintennace> {
  final ment = '해당 스크린에서는 웹 유지보수를 위한 텍스트를 제공해주는 서비스를 제공합니다 \n\n'
      '＊"" : .';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Center(
              child: Container(
                color: Colors.black38,
                child: TextButton(
                  clipBehavior: Clip.hardEdge,
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    maximumSize: MaterialStateProperty.all(Size(100, 50)),
                  ),
                  child: Text(
                    'go to index'.toUpperCase(),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const Icon(Icons.android, color: Colors.lightBlueAccent),
            Center(
              child: Text(
                "$ment",
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.9),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(child: Rainbow_text_maker(text: 'foo', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            SizedBox(
              height: 10,
            ),
            Button_to_move_button_name_into_clipboard(text: "--DEVELOPMENT", background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10), text_align: TextAlign.right),
            SizedBox(
              height: 20,
            ),
            Center(child: Rainbow_text_maker(text: 'foo', color: Colors.grey.withOpacity(0.9), font_size: 14.0, font_weight: FontWeight.w300, text_decoration: TextDecoration.none, font_family: "NotoSansCJKkr", font_style: FontStyle.normal, text_align: TextAlign.left, isRainbowMode: false)),
            SizedBox(
              height: 10,
            ),
            Button_to_move_button_name_into_clipboard(text: 'foo', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
            Button_to_move_button_name_into_clipboard(text: 'foo', background_color: MyColors.black_background, color: Colors.lightBlueAccent, font_size: 10, font_weight: FontWeight.w200, padding_vertical: 5, padding_horizontal: 10, border_radius: BorderRadius.circular(10)),
          ],
        ),
      ),
    );
  }
}
