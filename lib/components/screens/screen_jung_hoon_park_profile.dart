
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/source/remote/netflixx_api_helper.dart';
import '../../utils/super_helper.dart';


class ScreenJungHoonParkProfile extends StatefulWidget {
  const ScreenJungHoonParkProfile({Key? key}) : super(key: key);

  @override
  State<ScreenJungHoonParkProfile> createState() => _ScreenJungHoonParkProfileState();
}

class _ScreenJungHoonParkProfileState extends State<ScreenJungHoonParkProfile> {
  bool isMainContentClicked = true;

  bool isTextBoxButtonFirstClick = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          // shrinkWrap: true,
          children: [

            const SizedBox(height: 50),
            circleMaker(imgUrl: 'asset/images/my_lovely_dog_sky.jpg'),
            const Center(
                child: Text(
              'JungHoonPark',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
            const SizedBox(height: 3),
            /*'JungHoonPark'.length 에 따른 빨간밑줄*/ Center(
              /*리스트 뷰 내의 위젯의 폭을 설정하기 위해 Center 위젯으로 한번 더 감싸는 방법이 있다 기억하자!*/
              child: Container(
                height: 3,
                width: 200,
                color: Colors.red,
              ),
            ),
            for (int i = 0; i <= 2; i++) const SizedBox(height: 3),
            /*하이퍼링크*/ GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://github.com/PARK4139')); //Uri 인수는 텍스트 URL 인수보다 더 안전하고 신뢰할 수 있습니다.
              },
              child: const Center(child: Text('https://github.com/PARK4139', style: TextStyle(color: Colors.white, fontSize: 15))),
            ),
            for (int i = 0; i <= 2; i++) const SizedBox(height: 3),
            /*프로필 수정하기 버튼*/ Transform.translate(
              offset: const Offset(0, 0),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(  SnackBar(duration: const Duration(milliseconds: 2000), content: Text(MyMents.notReadyYet)));
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit, color: Colors.white, size: 22),
                        SizedBox(width: 3),
                        Text('프로필 수정하기', style: TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            /*줄길이에 따라 변하도록 할 수있는 유용한 텍스트박스*/ GestureDetector(
              onTap: () {
                setState(() {
                  toogleIsMainContentClicked();
                  if (isTextBoxButtonFirstClick == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 4000),
                      content: Text('\n\n오늘도 좋은 하루가 되시길 바래요!\n\n'),
                    ));
                    isTextBoxButtonFirstClick = true;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.10),
                    color: Colors.black38.withOpacity(0.5),
                  ),
                  width: 200, //폭을 설정하면 유용하다!
                  padding: const EdgeInsets.all(30),
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
                          maxLines: isMainContentClicked ? 1 : 2000, //20 줄까지만 보이도록
                          // strutStyle: const StrutStyle(fontSize: 9.0),//이거 어디에 쓰이는지?..
                          text: TextSpan(text: """
                      안녕하세요.
 
강아지와 산책을 사랑하는 개발자 
박정훈이라고 합니다. 저는 공군 중사 출신의 1년 차 개발자입니다.
현재는 웹 유지보수를 하고 있습니다. 

크로스 플랫폼에 관심이 많아 앱에 집중 공부하며 앱 개발자가 되기 위해서 준비하고 있습니다.
모바일 크로스 플랫폼 프레임워크 중에 플러터를 선정하여 집중하고 있습니다.

다양한 애니메이션을 구현할 수 있는 멋진 프레임워크라고 생각하며 학습하고 정진하고 있습니다.



서로 인연이 닿으면 좋겠습니다.
읽어주셔서 감사합니다.  🙋🙋         
                          """, style: MyTextStyles.textStyle4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*빨간색 밑줄 데코*/ Transform.translate(
              offset: const Offset(0, 380 + 30 + 20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white, size: 22),
                      SizedBox(width: 3),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleMaker({required String imgUrl}) {
    Widget widget = Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(-0, -20),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
                // borderRadius: BorderRadius.circular(100),
                shape: BoxShape.circle,
              ),
              child: Image.asset(imgUrl, height: 140 + 20),
            ),
          ),
        ],
      ),
    );
    return widget;
  }

  List<Widget> posterListMaker(List<Movie> movies) {
    List<Widget> lists = [
      for (Movie movie in movies)
        /* 영화 포스터*/ Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(-0, -20),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    // borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(movie.imgUrl, height: 180),
                ),
              ),
            ],
          ),
        ),
    ];
    return lists;
  }

  List<Widget> titleSliderMaker(List<Movie> movies) {
    String seperator = '    ';
    List<Widget> lists = [
      for (Movie movie in movies) Text(movie.title + seperator, style: const TextStyle(fontSize: 14, color: Colors.white38)),
    ];
    return lists;
  }

  void toogleIsMainContentClicked() {
    isMainContentClicked = !isMainContentClicked;
  }
}
