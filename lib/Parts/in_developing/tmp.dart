import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';




 import 'package:flutter/material.dart';

class ScreenRandomNumberSub extends StatefulWidget {
  const ScreenRandomNumberSub({super.key});

  @override
  State<ScreenRandomNumberSub> createState() => _ScreenRandomNumberSubState();
}

class _ScreenRandomNumberSubState extends State<ScreenRandomNumberSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //_________________________________________________________________________ tmp s
          /*뭐가 필요할지 몰라 임시로 다 준비했어.*/


          /*커스텀 앱바*/ Container(
            color: Colors.black87,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*뒤로가기 버튼*/ InkWell(
                  child: const Icon(Icons.chevron_left, size: 40, color: Colors.redAccent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          /*임시메인컨테이너*/ Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*임시텍스트*/ Text("?", style: TextStyle(color: Colors.pink.shade50, fontSize: 19, fontWeight: FontWeight.w100)),

                  /*임시이미지*/ Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: SizedBox(height:0.1,  width: 0.1,child: Image.asset('asset/images/app_webtoon_logo.jpg')))),

                  /*임시버튼*/ InkWell(
                    child: const Icon(Icons.question_mark, size: 40, color: Colors.pink),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('테스트 스크린이 시현중입니다.')));
                    },
                  )
                ],
              )
          ),

          //_________________________________________________________________________ tmp e
        ],
      ),
    );
  }
}
