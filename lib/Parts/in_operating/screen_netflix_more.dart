import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_data_layer.dart';

class Screen_netflix_more extends StatefulWidget {
  Screen_netflix_more({Key? key}) : super(key: key);

  @override
  State<Screen_netflix_more> createState() => _Screen_netflix_moreState();
}

class _Screen_netflix_moreState extends State<Screen_netflix_more> {
  late List<Movie> movies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          children: [
            CircleMaker(img_url: movies[0].img_url),
            Center(
                child: const Text(
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
            const SizedBox(height: 3),
            const SizedBox(height: 3),
            const SizedBox(height: 3),
            /*깃 주소 하이퍼링크*/ TextButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/PARK4139')); //Uri 인수는 텍스트 URL 인수보다 더 안전하고 신뢰할 수 있습니다.
              },
              child: Text('https://github.com/PARK4139', style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            /*재생 버튼*/ Transform.translate(
              offset: const Offset(0, 0),
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

  void initMovies() {
    movies = movies_dummy;
  }

  Widget CircleMaker({required String img_url}) {
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
              child: Image.asset(img_url, height: 140 + 20),
            ),
          ),
        ],
      ),
    );
    return widget;
  }

  List<Widget> PosterListMaker(List<Movie> movies) {
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
                  child: Image.asset(movie.img_url, height: 180),
                ),
              ),
            ],
          ),
        ),
    ];
    return lists;
  }

  List<Widget> TitleSliderMaker(List<Movie> movies) {
    String seperator = '    ';
    List<Widget> lists = [
      for (Movie movie in movies) Text(movie.title + seperator, style: TextStyle(fontSize: 14, color: Colors.white38)),
    ];
    return lists;
  }
}
