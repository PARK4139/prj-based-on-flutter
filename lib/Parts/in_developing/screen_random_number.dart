import 'package:flutter/material.dart';

class ScreenRandomNumber extends StatefulWidget {
  const ScreenRandomNumber({super.key});

  @override
  State<ScreenRandomNumber> createState() => _ScreenRandomNumberState();
}

class _ScreenRandomNumberState extends State<ScreenRandomNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*커스텀 앱바*/ Container(
            color: Colors.black,
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

          /*메인컨테이너*/ Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*랜덤숫자 생성기*/ const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("랜덤숫자 생성기", style: TextStyle(color: Colors.white, fontSize: 19 * 2, fontWeight: FontWeight.w500)),
                      ),
                      /*설정버튼*/ Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          child: const Icon(Icons.settings, size: 20, color: Colors.red),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('테스트 스크린이 시현중입니다.')));
                          },
                        ),
                      ),
                    ],
                  ),
                  /*숫자컨테이너*/ Container(
                    height: 550,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Container(
                          height: 180,
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Column(
                            children: [
                              Text("data"),
                              Text("data"),
                              Text("data"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*생성하기버튼*/ InkWell(
                    child: /*빈버튼*/ Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width - 19,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(textAlign: TextAlign.center, '생성하기', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('테스트 스크린이 시현중입니다.')));
                    },
                  ),
                  const SizedBox(height: 60),
                  /*임시텍스트*/ Text("?", style: TextStyle(color: Colors.pink.shade50, fontSize: 19, fontWeight: FontWeight.w100)),
                  /*임시이미지*/ Transform.translate(offset: const Offset(17, 0), child: Transform.scale(scale: 300, child: SizedBox(height: 0.1, width: 0.1, child: Image.asset('asset/images/app_webtoon_logo.jpg')))),
                  /*임시버튼*/ InkWell(
                    child: const Icon(Icons.question_mark, size: 40, color: Colors.pink),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(milliseconds: 1000), content: Text('테스트 스크린이 시현중입니다.')));
                    },
                  )
                ],
              )),

          //_________________________________________________________________________ tmp e
        ],
      ),
    );
  }
}
