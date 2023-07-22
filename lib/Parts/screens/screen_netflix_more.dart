import 'package:flutter/material.dart';

import '../helpers/api_helper.dart';

class ScreenNetflixMore extends StatefulWidget {
  const ScreenNetflixMore({Key? key}) : super(key: key);

  @override
  State<ScreenNetflixMore> createState() => _ScreenNetflixMoreState();
}

class _ScreenNetflixMoreState extends State<ScreenNetflixMore> {
  late List<Movie> movies;

  @override
  void initState() {
    
    super.initState();
    initMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: ListView(
          children: const [




          ],
        ),
      ),
    );
  }

  void initMovies() {
    movies = movies_dummy;
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
}
