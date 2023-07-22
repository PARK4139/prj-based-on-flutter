import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prj_app_feat_nomadcoder_class/Parts/helpers/super_helper.dart';

import '../helpers/api_helper.dart';


class ScreenNetflixHomeSub extends StatefulWidget {
  late List<Movie> movies;

  ScreenNetflixHomeSub({Key? key, required this.movies}) : super(key: key);

  @override
  State<ScreenNetflixHomeSub> createState() => _ScreenNetflixHomeSubState();
}

class _ScreenNetflixHomeSubState extends State<ScreenNetflixHomeSub> {
  late List<Movie> movies;

  @override
  void initState() {
    
    super.initState();
    initMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          // alignment: Alignment.center,
          children: [
            /*블러 배경*/ Center(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Transform.scale(scale: 2.2, child: Image.asset(movies[0].imgUrl, fit: BoxFit.contain)),
              ),
            ),
            /*닫기 버튼*/ Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(340, 30),
                          child: Transform.rotate(
                            angle: 40.05,
                            child: IconButton(
                              onPressed: () {
                                printWithoutErrorOrPrintWithError("이제는 Transform 안에서도 IconButton 의 onPressed 가 동작됩니다X.");
                                Navigator.pop(context);
                              },
                              icon: IconButton(
                                icon: Icon(Icons.add_circle_outlined, color: Colors.black.withOpacity(0.6)),
                                onPressed: () {
                                  printWithoutErrorOrPrintWithError("이제는 Transform 안에서도 IconButton 의 onPressed 가 동작됩니다O.");
                                  Navigator.pop(context);
                                },
                                tooltip: "GO TO HOME",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /*메인 영화 포스터*/ Transform.translate(
              offset: const Offset(0, 40),
              child: Center(
                child: SizedBox(height: 300, child: Image.asset(movies[0].imgUrl, fit: BoxFit.contain)),
              ),
            ),
            /*메인 영화 포스터 유사도 및 출시년도 연령가 시즌개수 등 추가묘사정보*/ Transform.translate(
              offset: const Offset(0, 360),
              child: Center(
                child: SizedBox(height: 300, child: Text('99% 일치 2019 15+ 시즌 1개', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontWeight: FontWeight.w600))),
              ),
            ),
            /*메인 영화 포스터 제목*/ Transform.translate(
              offset: const Offset(0, 360 + 30),
              child: Center(
                child: SizedBox(height: 300, child: Text(movies[0].title, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 20, fontWeight: FontWeight.w600))),
              ),
            ),
            /*재생 버튼*/ Transform.translate(
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
                      Text('재생', style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
            /*메인 영화 포스터 장르 정보*/ Transform.translate(
              offset: const Offset(0, 360 + 40 + 40 + 40),
              child: Center(child: SizedBox(height: 300, child: Text(movies[0].kind, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontWeight: FontWeight.w600)))),
            ),
            /*메인 영화 포스터 출연진 정보*/ Transform.translate(
              offset: const Offset(0, 360 + 40 + 40 + 40 + 30),
              child: SizedBox(height: 300, child: Text('출연: 현빈, 손예진, 서지혜', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontWeight: FontWeight.w600))),
            ),
            /*메인 영화 포스터 제작사 정보*/ Transform.translate(
              offset: const Offset(0, 360 + 40 + 40 + 40 + 40 + 10),
              child: SizedBox(height: 300, child: Text('제작자: 이성호, 박지은', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontWeight: FontWeight.w600))),
            ),
            /*하단 네비게이션 바*/ Transform.translate(
              offset: const Offset(0, 360 + 40 + 40 + 40 + 40 + 30 + 10),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*내가 찜한 콘텐츠 버튼*/ SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            SizedBox(height: 6),
                            Icon(Icons.add, color: Colors.white, size: 23),
                            SizedBox(height: 6),
                            Text('내가 찜한 콘텐츠', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                      SizedBox(width: 3),
                      /*평가 버튼*/ SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            SizedBox(height: 6),
                            Icon(Icons.thumb_up_alt_rounded, color: Colors.white, size: 23),
                            SizedBox(height: 6),
                            Text('평가', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                      SizedBox(width: 3),
                      /*공유 버튼*/ SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            SizedBox(height: 6),
                            Icon(Icons.send, color: Colors.white, size: 23),
                            SizedBox(height: 6),
                            Text('공유', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                      /*더보기 버튼*/ SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            SizedBox(height: 6),
                            Icon(Icons.menu, color: Colors.white, size: 23),
                            SizedBox(height: 6),
                            Text('더보기', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  void initMovies() {
    /*movies dummy data*/ movies = widget.movies;
  }

  List<Widget> circlesAndTitleListMaker(List<Movie> movies) {
    List<Widget> lists = [
      for (Movie movie in movies)
        /*미리보기 원형 영화 포스터*/ Container(
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
                  child: Image.asset(movie.imgUrl, height: 140 + 20),
                ),
              ),
              /*오프셋된 영화 타이틀*/ Transform.translate(
                offset: const Offset(-0, 30),
                child: Text(movie.title, style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
    ];
    return lists;
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
}
